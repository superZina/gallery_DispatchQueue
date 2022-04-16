//
//  APITest.swift
//  Gallery_DispatchQueueTests
//
//  Created by 이진하 on 2022/04/16.
//

import XCTest
@testable import Gallery_DispatchQueue

class APITest: XCTestCase {
    
    let manager: APIManager = APIManager()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        
    }

    func testExample() throws {
        manager.getPhotoList { error, list in
            XCTAssertNil(error)            
            XCTAssertNotNil(list)
        }
    }

    func testPerformanceExample() throws {
        self.measure {
        }
    }
}
