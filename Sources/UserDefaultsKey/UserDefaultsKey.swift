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
		private let _defaultValue: @Sendable () -> Value

		/// The value which is used when no value is stored in UserDefaults.
		public var defaultValue: Value { _defaultValue() }

		public init(_ key: String, defaultValue: @Sendable @escaping @autoclosure () -> Value) {
			self.key = key
			_defaultValue = defaultValue
		}
	}
}

extension UserDefaults.Key: ExpressibleByStringLiteral {
	public init(stringLiteral value: String) {
		self.init(value)
	}
}
