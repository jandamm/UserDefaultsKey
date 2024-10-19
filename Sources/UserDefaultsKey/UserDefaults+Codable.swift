import Foundation

public extension UserDefaults {
	/// The decoder used for all `Codable` values when the key does not specify a specific decoder.
	static let defaultDecoder = JSONDecoder()
	/// The encoder used for all `Codable` values when the key does not specify a specific encoder.
	static let defaultEncoder = JSONEncoder()

	func codable<Value: Codable>(for key: Key<Value>) -> Value? {
		guard let data = data(forKey: key.rawKey) else { return nil }
		do {
			let decoder = key.decoder ?? Self.defaultDecoder
			return try decoder.decode(Value.self, from: data)
		} catch {
			assertionFailure("Could not decode stored data. Got error: \(error)")
			return nil
		}
	}

	func rawData<Value: Codable>(for key: Key<Value>) -> Data? {
		data(forKey: key.rawKey)
	}

	func codable<Value: Codable>(for key: DefaultValueKey<Value>) -> Value {
		codable(for: key.key) ?? key.defaultValue
	}

	func rawData<Value: Codable>(for key: DefaultValueKey<Value>) -> Data? {
		data(forKey: key.rawKey)
	}

	func set<Value: Codable>(codable value: Value, for key: Key<Value>) {
		do {
			let encoder = key.encoder ?? Self.defaultEncoder
			let data = try encoder.encode(value)
			set(data, forKey: key.rawKey)
		} catch {
			assertionFailure("Could not encode value. Got error: \(error)")
		}
	}

	func set<Value: Codable>(codable value: Value, for key: DefaultValueKey<Value>) {
		set(codable: value, for: key.key)
	}
}
