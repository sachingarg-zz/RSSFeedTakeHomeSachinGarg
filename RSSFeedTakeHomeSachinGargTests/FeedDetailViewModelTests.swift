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
        let mockItem = Music(id: "1", artistName: "Artist", name: "name", artworkUrl100: "", releaseDate: "2026-03-03", kind: "Pop")
        let mockResponse = FeedResponse(feed: Feed(title: "Top Songs", id: "id", results: [mockItem]))
        
        mockApiService.mockResult = mockResponse
        
        let viewModel = await FeedDetailViewModel<Music>(
            url: URL("https://apple.com")!,
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
    
    func testFeedViewModel_loadsItems_throw_error() async throws {
        // given
        let mockService = MockAPIService()
        mockService.shouldThrow = true
        
        let vm = await FeedDetailViewModel<Music>(url: URL(string: "https://apple.com")!, service: mockService)
        
        // when
        await vm.loadFeed()
        
        // then
        await MainActor.run {
            XCTAssertTrue(vm.feedItems.isEmpty)
        }
        
        
        
    }

}
