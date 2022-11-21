//
//  FinanceServiceTests.swift
//  FinanceAppTests
//
//  Created by Rodrigo Borges on 13/09/22.
//

import XCTest
@testable import FinanceApp

final class FinanceServiceTests: XCTestCase {
    let sut = FinanceServiceSpy()
    
    func test_fetchUserProfile_shouldHaveUserProfileData() {
        //When
        sut.fetchUserProfile { _ in }
        //Then
        XCTAssertTrue(sut.fetchUserIsCalled)
    }
    
    func test_fetchUserProfile_shouldNotCompletWithNill() {
        //given
        var mockData: UserProfile?
        //when
        sut.fetchUserProfile { user in
            mockData = user
        }
        
        XCTAssertNotNil(mockData)
    }
}

extension FinanceServiceSpy: FetchUserProfileProtocol {
    
    func fetchUserProfile(_ completion: @escaping (FinanceApp.UserProfile?) -> Void) {
        fetchUserIsCalled = true
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let userProfile = try decoder.decode(UserProfile.self, from: dataUserJsonMock!)
            completion(userProfile)
        } catch {
            completion(nil)
        }
    }
}
