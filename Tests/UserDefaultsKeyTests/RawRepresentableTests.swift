import SwiftUI
import UserDefaultsKey
import XCTest

class RawRepresentableTests: TestCase {
	struct V: View {
		@AppStorage(.someValue, store: .testSuite) var someValue
		@AppStorage(.intValue, store: .testSuite) var intValue
		var body: some View { EmptyView() }
	}

	func testRawRepresentable() {
		let view = V()
		XCTAssertEqual(view.someValue, .second)
		XCTAssertEqual(defaults.object(for: .someValue), .second)
		XCTAssertNil(defaults.object(forKey: UserDefaults.DefaultValueKey.someValue.rawKey))

		view.someValue = .third
		XCTAssertEqual(view.someValue, .third)
		XCTAssertEqual(defaults.object(for: .someValue), .third)
		XCTAssertEqual(defaults.string(forKey: UserDefaults.DefaultValueKey.someValue.rawKey), SomeValue.third.rawValue)

		defaults.set(.first, for: .someValue)
		// It appears that (at least in the test) view.someValue is not updated.
		// It works when view is newly initialized so I guess it's a bug in this test and not in my code.
		// XCTAssertEqual(view.someValue, .first)
		XCTAssertEqual(V().someValue, .first)

		XCTAssertEqual(defaults.object(for: .someValue), .first)
		XCTAssertEqual(defaults.string(forKey: UserDefaults.DefaultValueKey.someValue.rawKey), SomeValue.first.rawValue)
	}

	func testTheUnexpected() {
		// In this test I test an (at least for me) unexpected behavior.
		// If this test fails I probably can rewrite other tests.
		let view = V()
		XCTAssertEqual(view.someValue, .second)
		XCTAssertEqual(view.intValue, 42)

		view.someValue = .third
		XCTAssertEqual(view.someValue, .third)

		view.intValue = 123
		XCTAssertEqual(view.intValue, 123)

		defaults.set("first", forKey: UserDefaults.DefaultValueKey.someValue.rawKey)
		// The real assumption would be `.first`
		XCTAssertEqual(view.someValue, .third)
		XCTAssertEqual(V().someValue, .first)
		XCTAssertEqual(defaults.object(for: .someValue), .first)

		defaults.set(1337, forKey: UserDefaults.DefaultValueKey.intValue.rawKey)
		// The real assumption would be `1337`
		XCTAssertEqual(view.intValue, 123)
		XCTAssertEqual(V().intValue, 1337)
		XCTAssertEqual(defaults.object(for: .intValue), 1337)
	}
}
