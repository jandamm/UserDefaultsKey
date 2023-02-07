import SwiftUI
@testable import UserDefaultsKey
import XCTest

class AppStorageTests: TestCase {
	func testAppStorage() {
		struct V: View {
			@AppStorage(.intValue, store: .testSuite) var intValue
			@AppStorage(.int, store: .testSuite) var int = 1
			var body: some View { EmptyView() }
		}

		let view = V()

		XCTAssertEqual(view.int, 1)
		XCTAssertEqual(defaults.integer(for: .int), 0)

		XCTAssertEqual(view.intValue, 42)
		XCTAssertEqual(defaults.integer(for: .intValue), 42)
		XCTAssertEqual(defaults.integer(forKey: UserDefaults.DefaultValueKey.intValue.key), 0)

		view.int = 3
		XCTAssertEqual(view.int, 3)
		XCTAssertEqual(defaults.integer(for: .int), 3)

		defaults.set(5, for: .intValue)
		XCTAssertEqual(view.intValue, 5)
		XCTAssertEqual(defaults.integer(for: .intValue), 5)
	}

	func testAppStorageWithOptional() {
		struct V: View {
			@AppStorage(storingDefaultValueFor: .optionalValue, store: .testSuite) var optionalValue
			@AppStorage(.optional, store: .testSuite) var optional
			var body: some View { EmptyView() }
		}

		let view = V()

		XCTAssertNil(view.optional)
		XCTAssertNil(defaults.object(for: .optional))

		XCTAssertEqual(view.optionalValue, 42)
		XCTAssertEqual(defaults.object(for: .optionalValue), 42)
		XCTAssertEqual(defaults.integer(forKey: UserDefaults.DefaultValueKey.optionalValue.key), 42)
	}
}
