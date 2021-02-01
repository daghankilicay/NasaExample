//
//  PhotoViewModelTest.swift
//  NasaExampleTests
//
//  Created by Dağhan Kılıçay on 1.02.2021.
//

import XCTest
import Alamofire

@testable import NasaExample

class PhotoViewModelTest: XCTestCase {
    
    func testSearchViewModel() {
        let e = expectation(description: "AF")
        let viewModel = PhotoViewModel(apiService: APIService())
        viewModel.getData(roverType: "curiosity", page: 0)
        viewModel.bindCountryViewModelToController = { response -> Void in
            XCTAssertNotNil(response)
            XCTAssertNotNil(response.photos)
            XCTAssertTrue(response.photos.count > 0)
            e.fulfill()
        }
        waitForExpectations(timeout: 5.0, handler: nil)
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
