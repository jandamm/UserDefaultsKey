import Foundation

public extension UserDefaults {
	struct Key<Value>: Sendable, Equatable {
		/// The key used to store in UserDefaults.
		/// Use this to extend UserDefaults or AppStorage for custom storage strategies.
		/// It's not recommended to use it to access values.
		public let rawKey: String

		let decoder: JSONDecoder?
		let encoder: JSONEncoder?

		public init(_ rawKey: String) {
			self.rawKey = rawKey
			decoder = nil
			encoder = nil
		}

		public init(_ rawKey: String, value _: Value.Type) {
			self.init(rawKey)
		}
	}

	struct DefaultValueKey<Value>: Sendable {
		let key: Key<Value>
		private let _defaultValue: @Sendable () -> Value

		/// The key used to store in UserDefaults.
		/// Use this to extend UserDefaults or AppStorage for custom storage strategies.
		/// It's not recommended to use it to access values.
		public var rawKey: String { key.rawKey }
		/// The value which is used when no value is stored in UserDefaults.
		public var defaultValue: Value { _defaultValue() }

		public init(_ rawKey: String, default defaultValue: @Sendable @escaping @autoclosure () -> Value) {
			key = .init(rawKey)
			_defaultValue = defaultValue
		}

		init(key: Key<Value>, defaultValue: @Sendable @escaping @autoclosure () -> Value) {
			self.key = key
			self._defaultValue = defaultValue
		}
	}
}

extension UserDefaults.Key: ExpressibleByStringLiteral {
	public init(stringLiteral value: String) {
		self.init(value)
	}
}

public func ==<Value>(lhs: UserDefaults.Key<Value>, rhs: UserDefaults.Key<Value>) -> Bool {
	lhs.rawKey == rhs.rawKey
}
