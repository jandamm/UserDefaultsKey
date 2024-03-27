import Foundation

public extension UserDefaults.Key where Value: Codable {
	/// - parameter rawKey: The key used to store in UserDefaults.
	/// - parameter decoder: The decoder to decode the stored value. Otherwise `UserDefaults.defaultDecoder` is used
	/// - parameter encoder: The encoder to encode the stored value. Otherwise `UserDefaults.defaultEncoder` is used
	init(_ rawKey: String, decoder: JSONDecoder?, encoder: JSONEncoder?) {
		self.rawKey = rawKey
		self.decoder = decoder
		self.encoder = encoder
	}

	/// - parameter rawKey: The key used to store in UserDefaults.
	/// - parameter decoder: The decoder to decode the stored value. Otherwise `UserDefaults.defaultDecoder` is used
	/// - parameter encoder: The encoder to encode the stored value. Otherwise `UserDefaults.defaultEncoder` is used
	init(_ rawKey: String, value _: Value.Type, decoder: JSONDecoder?, encoder: JSONEncoder?) {
		self.init(rawKey, decoder: decoder, encoder: encoder)
	}
}

public extension UserDefaults.DefaultValueKey where Value: Codable {
	/// - parameter rawKey: The key used to store in UserDefaults.
	/// - parameter decoder: The decoder to decode the stored value. Otherwise `UserDefaults.defaultDecoder` is used
	/// - parameter encoder: The encoder to encode the stored value. Otherwise `UserDefaults.defaultEncoder` is used
	init(_ rawKey: String, decoder: JSONDecoder?, encoder: JSONEncoder?, default defaultValue: @Sendable @escaping @autoclosure () -> Value) {
		self.init(
			key: .init(rawKey, decoder: decoder, encoder: encoder),
			defaultValue: defaultValue()
		)
	}
}
