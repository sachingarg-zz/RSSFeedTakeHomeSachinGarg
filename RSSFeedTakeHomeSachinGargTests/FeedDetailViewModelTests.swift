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
    
    func test_load_with_noData() async {
        let mockApiService = MockAPIService()
        let emptyMockResult: [MusicItem] = []
        let response = FeedResponse(feed: Feed(title: "Empty Result", id: "id", results: emptyMockResult))
        mockApiService.mockResult = response

        let viewModel = await FeedDetailViewModel<MusicItem>(
            urlString: "https://test.com",
            service: mockApiService
        )
        
        // when
        await viewModel.loadFeed()
        
        // then
        await MainActor.run {
            XCTAssertEqual(viewModel.error, .noData)
            XCTAssertTrue(viewModel.feedItems.isEmpty)
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
            XCTAssertEqual(vm.error, AppError.invalicUrl)
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
            XCTAssertEqual(vm.error, AppError.networkError(URLError(.resourceUnavailable)))
        }
    }
    
    func testFeedViewModel_loadsItems_decodingError() async throws {
        // given
        let mockService = MockAPIService()
        mockService.shouldThrow = AppError.decodingFailure(DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "")))
        
        let vm = await FeedDetailViewModel<MusicItem>(urlString: "https://apple.com", service: mockService)
        
        
        await vm.loadFeed()
        
        
        // then
        await MainActor.run {
            switch vm.error {
            case .decodingFailure: XCTAssertTrue(true)
            default: XCTFail("Wrong error emitted")
            }
        }
    }
    
    func testFeedViewModel_loadsItems_unKnownError() async throws {
        // given
        let mockService = MockAPIService()
        mockService.shouldThrow = .unknown(NSError(domain: "Text", code: 999))
        
        let vm = await FeedDetailViewModel<MusicItem>(urlString: "https://apple.com", service: mockService)
        
        
        await vm.loadFeed()
        
        
        // then
        await MainActor.run {
            if case .unknown = vm.error {} else {
                XCTFail("unexpected Error Ocurred")
            }
        }
    }
    
    func testFeedViewModel_searchFilter() async {
        // given
        let mockService = MockAPIService()
        let genre = Genre(name: "testGenre")
        let mockItem1 = MusicItem(id: "1", artistName: "Termintor", name: "name", artworkUrl100: "artWorkURL", releaseDate: "2026-03-03", url: "url", genres: [genre])
        let mockItem2 = MusicItem(id: "2", artistName: "Lord Of king", name: "name", artworkUrl100: "artWorkURL", releaseDate: "2026-03-03", url: "url", genres: [genre])
        let mockResponse = FeedResponse(feed: Feed(title: "Top Songs", id: "id", results: [mockItem1, mockItem2]))
        mockService.mockResult = mockResponse
        
        let vm = await FeedDetailViewModel<MusicItem>(urlString: "https://apple.com", service: mockService)
        
        
        await vm.loadFeed()
        
        let expectation = XCTestExpectation(description: "Search Updated")
        
        let cancellables = await vm.$searchedItems
            .dropFirst()
            .sink { _ in
                expectation.fulfill()
            }
        
        await MainActor.run {
            vm.searchText = "Lord"
        }
        
        wait(for: [expectation], timeout: 1.0)
        
        cancellables.cancel()
        // then
        await MainActor.run {
            XCTAssertEqual(vm.searchedItems.count, 1)
            XCTAssertEqual(vm.searchedItems.first?.subtitleText, "Lord Of king")

        }
    }

}
