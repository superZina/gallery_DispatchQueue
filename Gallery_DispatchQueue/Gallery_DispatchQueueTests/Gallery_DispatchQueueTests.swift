//
//  Gallery_DispatchQueueTests.swift
//  Gallery_DispatchQueueTests
//
//  Created by 이진하 on 2022/04/16.
//

import XCTest
@testable import Gallery_DispatchQueue

class Gallery_DispatchQueueTests: XCTestCase {

    let photoLoader: PhotoLoader = PhotoLoader()
    var storage: [String: Data] = [:]
    let url = "https://images.unsplash.com/photo-1650174193274-377453d47b2b?ixid=MnwzMTkzODR8MHwxfGFsbHw3fHx8fHx8Mnx8MTY1MDE5NTIxMQ&ixlib=rb-1.2.1"

    func testLoad() throws {
        let data = photoLoader.load(url: url, dict: storage) { loaded, data in
            if !loaded { self.storage[self.url] = data }
        }
        XCTAssertNotNil(data)
        XCTAssertFalse(storage.isEmpty)
    }
    
    func testLoadData() throws {
        let data = photoLoader.loadData(from: url)
        XCTAssertNotNil(data)
    }

    func testContainsData() throws {
        XCTAssertFalse(photoLoader.containImageData(url: url, in: storage))
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
        }
    }

}
