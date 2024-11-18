//
//  MockDataTest.swift
//  UsersTestingAssignmentTests
//
//  Created by Giorgi Gakhokidze on 18.11.24.
//

import Foundation
import XCTest
@testable import UsersTestingAssignment

class MockDataTest: XCTestCase {
    
    var mockJSON: MockJSON!

    override func setUp() {
        super.setUp()
        mockJSON = MockJSON()
        mockJSON.decodeMockJson()
    }
    
    override func tearDown() {
        mockJSON = nil
        super.tearDown()
    }
    
    func testUserNotEmpty() {
        XCTAssertNotNil(mockJSON.users.isEmpty)
    }
    
    func testFetchUsersSuccess() {
        mockJSON.fetchUsers(withLimit: 1) { users in
            XCTAssertEqual(users.first?.email, "christian.nielsen@example.com", "expected email address")
            XCTAssertEqual(users.first?.name.first, "Christian")
        }
    }
    
    func testFetchUsersWithLimit() {
        mockJSON.fetchUsers(withLimit: 1) { users in
            XCTAssertEqual(users.count, 1, "Expected 1 user")
        }
    }
    
    func testFetchUsersNoLimit() {
        mockJSON.fetchUsers(withLimit: 0) { users in
            XCTAssertEqual(users.count, 1, "expected as many users as in array")
        }
    }
    
    func testFetchUsersError() {
        mockJSON.isErrorThrown = true
        mockJSON.fetchUsers(withLimit: 1) { users in
            XCTAssertEqual(users.count, 0, "Expected no users on error")
        }
    }
}
