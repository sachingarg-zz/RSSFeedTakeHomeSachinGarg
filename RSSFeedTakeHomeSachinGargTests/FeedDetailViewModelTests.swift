//
//  FeedDetailViewModelTests.swift
//  RSSFeedTakeHomeSachinGargTests
//
//  Created by sachin garg on 3/18/26.
//

import XCTest
@testable import RSSFeedTakeHomeSachinGarg

final class FeedDetailViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFeedViewModel_loadsItems_success() async throws {
        // given
        let mockApiService = MockAPIService()
        let genre = Genre(name: "testGenre")
        let mockItem = MusicItem(id: "1", artistName: "artistName", name: "name", artworkUrl100: "artWorkURL", releaseDate: "2026-03-03", url: "url", genres: [genre])
        let mockResponse = FeedResponse(feed: Feed(title: "Top Songs", id: "id", results: [mockItem]))
        
        mockApiService.mockResult = mockResponse
        
        let viewModel = await FeedDetailViewModel<MusicItem>(
            urlString: "https://apple.com",
            service: mockApiService
        )
        
        // when
        await viewModel.loadFeed()
                
        // then
        await MainActor.run {
            XCTAssertEqual(viewModel.feedItems.count, 1)
            XCTAssertEqual(viewModel.feedItems.first?.name, "name")
            XCTAssertEqual(viewModel.title, "Top Songs")

        }
        
    }
    
    func testFeedViewModel_loadsItems_throw_badUrl() async throws {
        // given
        let mockService = MockAPIService()
        mockService.shouldThrow = .invalicUrl
        
        let vm = await FeedDetailViewModel<MusicItem>(urlString: "https://apple.com", service: mockService)
        
        
        await vm.loadFeed()
        
        
        // then
        await MainActor.run {
            XCTAssertNotNil(vm.error)
            XCTAssertEqual(vm.error?.code, AppError.invalicUrl.code)
        }
    }
    
    func testFeedViewModel_loadsItems_throw_networkError() async throws {
        // given
        let mockService = MockAPIService()
        mockService.shouldThrow = .networkError(URLError(.resourceUnavailable))
        
        let vm = await FeedDetailViewModel<MusicItem>(urlString: "https://apple.com", service: mockService)
        
        
        await vm.loadFeed()
        
        
        // then
        await MainActor.run {
            XCTAssertNotNil(vm.error)
            XCTAssertEqual(vm.error?.code, AppError.networkError(URLError(.resourceUnavailable)).code)
        }
    }

}
