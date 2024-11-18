//
//  UnitTesting.swift
//  UsersTestingAssignmentTests
//
//  Created by Giorgi Gakhokidze on 17.11.24.
//

import XCTest
@testable import UsersTestingAssignment

final class UnitTesting: XCTestCase {
    
    var userViewModel: UserViewModel!
    var user: User!
    
    override func setUp() {
        super.setUp()
            
        let jsonData = Data(User.jsonMock.utf8)
        let decoder = JSONDecoder()
        
        do {
            let userList = try decoder.decode(UserList.self, from: jsonData)
            let user = userList.results.first!
            userViewModel = UserViewModel(user: user)
        } catch {
            XCTFail("Failed to decode mockjson: \(error)")
        }
    }
    
    override func tearDown() {
        userViewModel = nil
        super.tearDown()
    }
    
    func testFullName() {
        let expectedName = "Mr Christian Nielsen"
        let fullName = userViewModel.fullName
        XCTAssertEqual(expectedName, fullName)
    }
    
    func testCompleteFullName() {
        if let user = user {
            XCTAssertEqual(userViewModel.fullName, "\(user.name.title) \(user.name.first) \(user.name.last)", "names matched")
        }
    }

    func testContactNumber() {
        let expectedNumber = "85537737 / 57231440"
        let contactNumber = userViewModel.contactNumber
        XCTAssertEqual(expectedNumber, contactNumber)
    }
    
    func testThumbNailImageUrl() {
        let expectedUrl = URL(string: "https://randomuser.me/api/portraits/thumb/men/25.jpg")
        
        let thumbnailImageUrl = userViewModel.thumbnailImageUrl
        XCTAssertEqual(expectedUrl, thumbnailImageUrl)
    }
    
    func testEmail() {
        let expectedEmail = "christian.nielsen@example.com"
        let email = userViewModel.email
        XCTAssertEqual(expectedEmail, email)
    }
    
    func testNotEmptyUserData() {
        XCTAssertNotNil(userViewModel.contactNumber)
        XCTAssertNotNil(userViewModel.thumbnailImageUrl)
        XCTAssertNotNil(userViewModel.fullName)
    }
}
