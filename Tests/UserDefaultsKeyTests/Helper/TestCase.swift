import XCTest

extension UserDefaults {
	fileprivate static let suiteName = "userdefaultskey-test-suite"
	static let testSuite = UserDefaults(suiteName: suiteName)
}

class TestCase: XCTestCase {
	var defaults: UserDefaults!

	override func setUp() {
		super.setUp()
		defaults = .testSuite
	}

	override func tearDown() {
		super.tearDown()
		defaults.removePersistentDomain(forName: UserDefaults.suiteName)
		defaults = nil
	}
}
