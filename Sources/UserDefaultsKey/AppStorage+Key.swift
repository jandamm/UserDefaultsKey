#if canImport(SwiftUI)
	import SwiftUI

	// 	@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
	// 	public extension AppStorage where Value == String {
	// 		init(wrappedValue: Value, _ key: UserDefaults.Key<Value>) {
	// 			self.init(wrappedValue: wrappedValue, key.key)
	// 		}

	// 		init(_ key: UserDefaults.DefaultValueKey<Value>) {
	// 			self.init(wrappedValue: key.defaultValue(), key.key)
	// 		}
	// }

	@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
	public extension AppStorage {
		/// Creates a property that can read and write to a boolean user default.
		///
		/// - Parameters:
		///   - wrappedValue: The default value if a boolean value is not specified
		///     for the given key.
		///   - key: The key to read and write the value to in the user defaults
		///     store.
		///   - store: The user defaults store to read and write to. A value
		///     of `nil` will use the user default store from the environment.
		init(wrappedValue: Value, _ key: UserDefaults.Key<Value>, store: UserDefaults? = nil) where Value == Bool {
			self.init(wrappedValue: wrappedValue, key.rawKey, store: store)
		}

		/// Creates a property that can read and write to an integer user default.
		///
		/// - Parameters:
		///   - wrappedValue: The default value if an integer value is not specified
		///     for the given key.
		///   - key: The key to read and write the value to in the user defaults
		///     store.
		///   - store: The user defaults store to read and write to. A value
		///     of `nil` will use the user default store from the environment.
		init(wrappedValue: Value, _ key: UserDefaults.Key<Value>, store: UserDefaults? = nil) where Value == Int {
			self.init(wrappedValue: wrappedValue, key.rawKey, store: store)
		}

		/// Creates a property that can read and write to a double user default.
		///
		/// - Parameters:
		///   - wrappedValue: The default value if a double value is not specified
		///     for the given key.
		///   - key: The key to read and write the value to in the user defaults
		///     store.
		///   - store: The user defaults store to read and write to. A value
		///     of `nil` will use the user default store from the environment.
		init(wrappedValue: Value, _ key: UserDefaults.Key<Value>, store: UserDefaults? = nil) where Value == Double {
			self.init(wrappedValue: wrappedValue, key.rawKey, store: store)
		}

		/// Creates a property that can read and write to a string user default.
		///
		/// - Parameters:
		///   - wrappedValue: The default value if a string value is not specified
		///     for the given key.
		///   - key: The key to read and write the value to in the user defaults
		///     store.
		///   - store: The user defaults store to read and write to. A value
		///     of `nil` will use the user default store from the environment.
		init(wrappedValue: Value, _ key: UserDefaults.Key<Value>, store: UserDefaults? = nil) where Value == String {
			self.init(wrappedValue: wrappedValue, key.rawKey, store: store)
		}

		/// Creates a property that can read and write to a url user default.
		///
		/// - Parameters:
		///   - wrappedValue: The default value if a url value is not specified for
		///     the given key.
		///   - key: The key to read and write the value to in the user defaults
		///     store.
		///   - store: The user defaults store to read and write to. A value
		///     of `nil` will use the user default store from the environment.
		init(wrappedValue: Value, _ key: UserDefaults.Key<Value>, store: UserDefaults? = nil) where Value == URL {
			self.init(wrappedValue: wrappedValue, key.rawKey, store: store)
		}

		/// Creates a property that can read and write to a user default as data.
		///
		/// Avoid storing large data blobs in user defaults, such as image data,
		/// as it can negatively affect performance of your app. On tvOS, a
		/// `NSUserDefaultsSizeLimitExceededNotification` notification is posted
		/// if the total user default size reaches 512kB.
		///
		/// - Parameters:
		///   - wrappedValue: The default value if a data value is not specified for
		///    the given key.
		///   - key: The key to read and write the value to in the user defaults
		///     store.
		///   - store: The user defaults store to read and write to. A value
		///     of `nil` will use the user default store from the environment.
		init(wrappedValue: Value, _ key: UserDefaults.Key<Value>, store: UserDefaults? = nil) where Value == Data {
			self.init(wrappedValue: wrappedValue, key.rawKey, store: store)
		}

		/// Creates a property that can read and write to an integer user default,
		/// transforming that to `RawRepresentable` data type.
		///
		/// A common usage is with enumerations:
		///
		///    enum MyEnum: Int {
		///        case a
		///        case b
		///        case c
		///    }
		///    struct MyView: View {
		///        @AppStorage("MyEnumValue") private var value = MyEnum.a
		///        var body: some View { ... }
		///    }
		///
		/// - Parameters:
		///   - wrappedValue: The default value if an integer value
		///     is not specified for the given key.
		///   - key: The key to read and write the value to in the user defaults
		///     store.
		///   - store: The user defaults store to read and write to. A value
		///     of `nil` will use the user default store from the environment.
		init(wrappedValue: Value, _ key: UserDefaults.Key<Value>, store: UserDefaults? = nil) where Value: RawRepresentable, Value.RawValue == Int {
			self.init(wrappedValue: wrappedValue, key.rawKey, store: store)
		}

		/// Creates a property that can read and write to a string user default,
		/// transforming that to `RawRepresentable` data type.
		///
		/// A common usage is with enumerations:
		///
		///    enum MyEnum: String {
		///        case a
		///        case b
		///        case c
		///    }
		///    struct MyView: View {
		///        @AppStorage("MyEnumValue") private var value = MyEnum.a
		///        var body: some View { ... }
		///    }
		///
		/// - Parameters:
		///   - wrappedValue: The default value if a string value
		///     is not specified for the given key.
		///   - key: The key to read and write the value to in the user defaults
		///     store.
		///   - store: The user defaults store to read and write to. A value
		///     of `nil` will use the user default store from the environment.
		init(wrappedValue: Value, _ key: UserDefaults.Key<Value>, store: UserDefaults? = nil) where Value: RawRepresentable, Value.RawValue == String {
			self.init(wrappedValue: wrappedValue, key.rawKey, store: store)
		}
	}

	@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
	public extension AppStorage where Value: ExpressibleByNilLiteral {
		/// Creates a property that can read and write an Optional boolean user
		/// default.
		///
		/// Defaults to nil if there is no restored value.
		///
		/// - Parameters:
		///   - key: The key to read and write the value to in the user defaults
		///     store.
		///   - store: The user defaults store to read and write to. A value
		///     of `nil` will use the user default store from the environment.
		init(_ key: UserDefaults.Key<Value>, store: UserDefaults? = nil) where Value == Bool? {
			self.init(key.rawKey, store: store)
		}

		/// Creates a property that can read and write an Optional integer user
		/// default.
		///
		/// Defaults to nil if there is no restored value.
		///
		/// - Parameters:
		///   - key: The key to read and write the value to in the user defaults
		///     store.
		///   - store: The user defaults store to read and write to. A value
		///     of `nil` will use the user default store from the environment.
		init(_ key: UserDefaults.Key<Value>, store: UserDefaults? = nil) where Value == Int? {
			self.init(key.rawKey, store: store)
		}

		/// Creates a property that can read and write an Optional double user
		/// default.
		///
		/// Defaults to nil if there is no restored value.
		///
		/// - Parameters:
		///   - key: The key to read and write the value to in the user defaults
		///     store.
		///   - store: The user defaults store to read and write to. A value
		///     of `nil` will use the user default store from the environment.
		init(_ key: UserDefaults.Key<Value>, store: UserDefaults? = nil) where Value == Double? {
			self.init(key.rawKey, store: store)
		}

		/// Creates a property that can read and write an Optional string user
		/// default.
		///
		/// Defaults to nil if there is no restored value.
		///
		/// - Parameters:
		///   - key: The key to read and write the value to in the user defaults
		///     store.
		///   - store: The user defaults store to read and write to. A value
		///     of `nil` will use the user default store from the environment.
		init(_ key: UserDefaults.Key<Value>, store: UserDefaults? = nil) where Value == String? {
			self.init(key.rawKey, store: store)
		}

		/// Creates a property that can read and write an Optional URL user
		/// default.
		///
		/// Defaults to nil if there is no restored value.
		///
		/// - Parameters:
		///   - key: The key to read and write the value to in the user defaults
		///     store.
		///   - store: The user defaults store to read and write to. A value
		///     of `nil` will use the user default store from the environment.
		init(_ key: UserDefaults.Key<Value>, store: UserDefaults? = nil) where Value == URL? {
			self.init(key.rawKey, store: store)
		}

		/// Creates a property that can read and write an Optional data user
		/// default.
		///
		/// Defaults to nil if there is no restored value.
		///
		/// - Parameters:
		///   - key: The key to read and write the value to in the user defaults
		///     store.
		///   - store: The user defaults store to read and write to. A value
		///     of `nil` will use the user default store from the environment.
		init(_ key: UserDefaults.Key<Value>, store: UserDefaults? = nil) where Value == Data? {
			self.init(key.rawKey, store: store)
		}
	}

	@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
	public extension AppStorage {
		/// Creates a property that can save and restore an Optional string,
		/// transforming it to an Optional `RawRepresentable` data type.
		///
		/// Defaults to nil if there is no restored value
		///
		/// A common usage is with enumerations:
		///
		///     enum MyEnum: String {
		///         case a
		///         case b
		///         case c
		///     }
		///     struct MyView: View {
		///         @AppStorage("MyEnumValue") private var value: MyEnum?
		///         var body: some View { ... }
		///     }
		///
		/// - Parameters:
		///   - key: The key to read and write the value to in the user defaults
		///     store.
		///   - store: The user defaults store to read and write to. A value
		///     of `nil` will use the user default store from the environment.
		init<R>(_ key: UserDefaults.Key<Value>, store: UserDefaults? = nil) where Value == R?, R: RawRepresentable, R.RawValue == String {
			self.init(key.rawKey, store: store)
		}

		/// Creates a property that can save and restore an Optional integer,
		/// transforming it to an Optional `RawRepresentable` data type.
		///
		/// Defaults to nil if there is no restored value
		///
		/// A common usage is with enumerations:
		///
		///     enum MyEnum: Int {
		///         case a
		///         case b
		///         case c
		///     }
		///     struct MyView: View {
		///         @AppStorage("MyEnumValue") private var value: MyEnum?
		///         var body: some View { ... }
		///     }
		///
		/// - Parameters:
		///   - key: The key to read and write the value to in the user defaults
		///     store.
		///   - store: The user defaults store to read and write to. A value
		///     of `nil` will use the user default store from the environment.
		init<R>(_ key: UserDefaults.Key<Value>, store: UserDefaults? = nil) where Value == R?, R: RawRepresentable, R.RawValue == Int {
			self.init(key.rawKey, store: store)
		}
	}

#endif
