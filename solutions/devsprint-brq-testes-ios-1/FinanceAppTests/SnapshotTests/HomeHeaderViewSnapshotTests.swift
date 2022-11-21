import XCTest
import SnapshotTesting

@testable import FinanceApp

final class HomeHeaderViewSnapshotTests: XCTestCase {
    let sut = HomeHeaderView(frame: CGRect(x: 0, y: 0, width: 414, height: 114))
    
    func test_headerView_shouldHaveTheRightAppearence() {
        assertSnapshot(matching: sut, as: .image)
    }
    
}
