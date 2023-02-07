import Foundation

public extension UserDefaults {
	/// -stringForKey: is equivalent to -objectForKey:, except that it will convert NSNumber values to their NSString representation. If a non-string non-number value is found, nil will be returned.
	func string(for key: Key<String>) -> String? {
		string(forKey: key.key)
	}

	/// -arrayForKey: is equivalent to -objectForKey:, except that it will nil if the value is not an NSArray.
	func array<V>(for key: Key<[V]>) -> [V]? {
		array(forKey: key.key) as? [V]
	}

	/// -dictionaryForKey: is equivalent to -objectForKey:, except that it will nil if the value is not an NSDictionary.
	func dictionary<V>(for key: Key<[String: V]>) -> [String: V]? {
		dictionary(forKey: key.key) as? [String: V]
	}

	/// -dataForKey: is equivalent to -objectForKey:, except that it will nil if the value is not an NSData.
	func data(for key: Key<Data>) -> Data? {
		data(forKey: key.key)
	}

	/// -stringForKey: is equivalent to -objectForKey:, except that it will nil if the value is not an NSArray<NSString *>. Note that unlike -stringForKey:, NSNumbers are not converted to NSStrings.
	func stringArray(for key: Key<[String]>) -> [String]? {
		stringArray(forKey: key.key)
	}

	func object<Object>(for key: Key<Object>) -> Object? {
		object(forKey: key.key) as? Object
	}

	func object<Object>(for key: Key<Object?>) -> Object? {
		object(forKey: key.key) as? Object
	}

	func integer(for key: Key<Int>) -> Int {
		integer(forKey: key.key)
	}

	/// -floatForKey: is similar to -integerForKey:, except that it returns a float, and boolean values will not be converted.
	func float(for key: Key<Int>) -> Float {
		float(forKey: key.key)
	}

	/// -doubleForKey: is similar to -integerForKey:, except that it returns a double, and boolean values will not be converted.
	func double(for key: Key<Double>) -> Double {
		double(forKey: key.key)
	}

	/**
	 -boolForKey: is equivalent to -objectForKey:, except that it converts the returned value to a BOOL. If the value is an NSNumber, NO will be returned if the value is 0, YES otherwise. If the value is an NSString, values of "YES" or "1" will YES, and values of "NO", "0", or any other string will return NO. If the value is absent or can't be converted to a BOOL, NO will be returned.

	 */
	func bool(for key: Key<Bool>) -> Bool {
		bool(forKey: key.key)
	}

	/**
	 -URLForKey: is equivalent to -objectForKey: except that it converts the returned value to an NSURL. If the value is an NSString path, then it will construct a file URL to that path. If the value is an archived URL from -setURL:forKey: it will be unarchived. If the value is absent or can't be converted to an NSURL, nil will be returned.
	 */
	@available(iOS 4.0, *)
	func url(for key: Key<URL>) -> URL? {
		url(forKey: key.key)
	}
}
