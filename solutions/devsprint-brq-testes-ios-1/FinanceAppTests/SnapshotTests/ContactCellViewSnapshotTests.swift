import XCTest
import SnapshotTesting

@testable import FinanceApp

final class ContactCellViewSnapshotTests: XCTestCase {
    let sut = ContactCellView()
    
    func test_ContactCellView_ShouldHaveTheRightAppearence() {
        assertSnapshot(matching: sut, as: .image)
    }
}
