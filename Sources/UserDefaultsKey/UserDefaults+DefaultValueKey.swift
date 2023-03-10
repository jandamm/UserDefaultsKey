import Foundation

public extension UserDefaults {
	/// -stringForKey: is equivalent to -objectForKey:, except that it will convert NSNumber values to their NSString representation. If a non-string non-number value is found, the default value will be returned.
	func string(for key: DefaultValueKey<String>) -> String {
		string(for: key.key) ?? key.defaultValue
	}

	/// -arrayForKey: is equivalent to -objectForKey:, except that it will return the default value if the value is not an NSArray.
	func array<V>(for key: DefaultValueKey<[V]>) -> [V] {
		array(for: key.key) ?? key.defaultValue
	}

	/// -dictionaryForKey: is equivalent to -objectForKey:, except that it will return the default value if the value is not an NSDictionary.
	func dictionary<V>(for key: DefaultValueKey<[String: V]>) -> [String: V] {
		dictionary(for: key.key) ?? key.defaultValue
	}

	/// -dataForKey: is equivalent to -objectForKey:, except that it will return the default value if the value is not an NSData.
	func data(for key: DefaultValueKey<Data>) -> Data {
		data(for: key.key) ?? key.defaultValue
	}

	/// -stringForKey: is equivalent to -objectForKey:, except that it will return the default value if the value is not an NSArray<NSString *>. Note that unlike -stringForKey:, NSNumbers are not converted to NSStrings.
	func stringArray(for key: DefaultValueKey<[String]>) -> [String] {
		stringArray(for: key.key) ?? key.defaultValue
	}

	func object<Object>(for key: DefaultValueKey<Object>) -> Object {
		object(for: key.key) ?? key.defaultValue
	}

	func integer(for key: DefaultValueKey<Int>) -> Int {
		object(for: key)
	}

	/// -floatForKey: is similar to -integerForKey:, except that it returns a float, and boolean values will not be converted.
	func float(for key: DefaultValueKey<Float>) -> Float {
		object(for: key)
	}

	/// -doubleForKey: is similar to -integerForKey:, except that it returns a double, and boolean values will not be converted.
	func double(for key: DefaultValueKey<Double>) -> Double {
		object(for: key)
	}

	/**
	 -boolForKey: is equivalent to -objectForKey:, except that it converts the returned value to a BOOL. If the value is an NSNumber, NO will be returned if the value is 0, YES otherwise. If the value is an NSString, values of "YES" or "1" will return YES, and values of "NO", "0", or any other string will return NO. If the value is absent or can't be converted to a BOOL, the default value will be returned.

	 */
	func bool(for key: DefaultValueKey<Bool>) -> Bool {
		object(for: key)
	}

	/**
	 -URLForKey: is equivalent to -objectForKey: except that it converts the returned value to an NSURL. If the value is an NSString path, then it will construct a file URL to that path. If the value is an archived URL from -setURL:forKey: it will be unarchived. If the value is absent or can't be converted to an NSURL, the default value will be returned.
	 */
	@available(iOS 4.0, *)
	func url(for key: DefaultValueKey<URL>) -> URL {
		url(for: key.key) ?? key.defaultValue
	}
}
