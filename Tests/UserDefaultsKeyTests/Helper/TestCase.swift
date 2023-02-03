import XCTest

class TestCase: XCTestCase {
	static let suiteName = "userdefaultskey-test-suite"
	static let defaults: UserDefaults? = UserDefaults(suiteName: suiteName)

	var defaults: UserDefaults!

	override func setUp() {
		super.setUp()
		defaults = Self.defaults
	}

	override func tearDown() {
		super.tearDown()
		defaults.removePersistentDomain(forName: Self.suiteName)
		defaults = nil
	}
}
