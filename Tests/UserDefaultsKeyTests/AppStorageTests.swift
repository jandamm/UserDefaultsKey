import XCTest
import SwiftUI
@testable import UserDefaultsKey

class AppStorageTests: TestCase {
	func testAppStorage() {
		struct V: View {
			@AppStorage(.intValue, store: .testSuite) var intValue
			@AppStorage(.int, store: .testSuite) var int = 1
			var body: some View { EmptyView() }
		}

		let view = V()

		XCTAssertEqual(view.int, 1)
		XCTAssertEqual(view.intValue, 42)

		view.int = 3
		XCTAssertEqual(view.int, 3)
		XCTAssertEqual(defaults.integer(for: .int), 3)

		defaults.set(5, for: .intValue)
		XCTAssertEqual(view.intValue, 5)
		XCTAssertEqual(defaults.integer(for: .intValue), 5)
	}
}
