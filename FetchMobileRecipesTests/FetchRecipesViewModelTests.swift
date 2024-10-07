//
//  FetchRecipesViewModelTests.swift
//  FetchMobileRecipesTests
//
//  Created by Brian Goo on 10/4/24.
//

import XCTest
@testable import FetchMobileRecipes

final class FetchRecipesViewModelTests: XCTestCase {
    var testVM: FetchRecipesViewModel?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        testVM = FetchRecipesViewModel(fetchAPIClient: FetchAPIClientService())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        testVM = nil
    }
    
    func testEmptyResponse() async throws {
        let expectation = expectation(description: "expect call to throw `FetchRecipeError.emptyResponse`")
        guard let testVM = testVM else {
            XCTFail("TestVM is nil")
            return
        }
        do {
            try await testVM.fetchRecipes(endpoint: .empty)
            XCTFail("Empty response error should be thrown.")
        } catch FetchRecipeError.emptyResponse {
            // Test Passed
            expectation.fulfill()
        } catch {
            XCTFail("Unexpected error was thrown.")
        }
        await fulfillment(of: [expectation], timeout: 3)
    }

    func testValidResponse() async throws {
        guard let testVM = testVM else {
            XCTFail("TestVM is nil")
            return
        }
        try await testVM.fetchRecipes(endpoint: .valid)
        XCTAssertEqual(testVM.recipes.count, 65)
    }
    
    func testInvalidResponse() async throws {
        let expectation = expectation(description: "expect call to throw `FetchRecipeError.invalidResponse`")
        guard let testVM = testVM else {
            XCTFail("TestVM is nil")
            return
        }
        do {
            try await testVM.fetchRecipes(endpoint: .invalid)
            XCTFail("Invalid response error should be thrown.")
        } catch FetchRecipeError.invalidResponse {
            // Test Passed
            expectation.fulfill()
        } catch {
            XCTFail("Unexpected error was thrown.")
        }
        await fulfillment(of: [expectation], timeout: 3)
    }
}
