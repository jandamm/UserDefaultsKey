import Foundation

public extension UserDefaults {
	struct Key<Value>: Sendable, Equatable {
		let key: String

		public init(_ key: String) {
			self.key = key
		}

		public init(_ key: String, value _: Value.Type) {
			self.init(key)
		}
	}

	struct DefaultValueKey<Value>: Sendable {
		let key: String
		let defaultValue: @Sendable () -> Value

		public init(_ key: String, defaultValue: @Sendable @escaping @autoclosure () -> Value) {
			self.key = key
			self.defaultValue = defaultValue
		}
	}
}

extension UserDefaults.Key: ExpressibleByStringLiteral {
	public init(stringLiteral value: String) {
		self.init(value)
	}
}
