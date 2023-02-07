@testable import UserDefaultsKey
import XCTest

class UserDefaultsTests: TestCase {
	func testKey() {
		XCTAssertEqual(defaults.integer(forKey: UserDefaults.Key.int.key), 0)
		XCTAssertEqual(defaults.integer(for: .int), 0)

		defaults.set(12, for: .int)
		XCTAssertEqual(defaults.integer(forKey: UserDefaults.Key.int.key), 12)
		XCTAssertEqual(defaults.integer(for: .int), 12)
	}

	func testDefaultValueKey() {
		XCTAssertEqual(defaults.integer(forKey: UserDefaults.DefaultValueKey.intValue.key), 0)
		XCTAssertEqual(defaults.integer(for: .intValue), 42)
		XCTAssertEqual(defaults.integer(forKey: UserDefaults.DefaultValueKey.intValue.key), 0)

		defaults.set(12, for: .intValue)
		XCTAssertEqual(defaults.integer(for: .intValue), 12)
		XCTAssertEqual(defaults.integer(forKey: UserDefaults.DefaultValueKey.intValue.key), 12)

		XCTAssertEqual(defaults.float(forKey: UserDefaults.DefaultValueKey.floatValue.key), 0)
		XCTAssertEqual(defaults.float(for: .floatValue), 1337)
		XCTAssertEqual(defaults.float(forKey: UserDefaults.DefaultValueKey.floatValue.key), 0)

		defaults.set(12, for: UserDefaults.Key<Int>("floatValue"))
		XCTAssertEqual(defaults.float(for: .floatValue), 12)
		XCTAssertEqual(defaults.float(forKey: UserDefaults.DefaultValueKey.floatValue.key), 12)
	}
}
