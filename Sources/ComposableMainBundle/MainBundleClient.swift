import Dependencies
import DependenciesMacros
import Foundation

@DependencyClient
public struct MainBundleClient: DependencyKey, Sendable {
    
    /// A value under the specified key.
    public var property: (_ forKey: String) -> Any?
    
    /// String value under the specified key.
    public var string: (_ forKey: String) -> String?
    
    // Common values
    
    /// Value under *CFBundleVersion* key.
    ///
    /// The version of the build that identifies the *iteration* of the bundle.
    /// This key is a machine-readable string composed of one to three period
    /// separated integers, such as 10.14.1.
    /// The string can only contain numeric characters (0-9) and periods.
    public var buildNumber: () -> String?
    
    /// Value under *CFBundleShortVersionString* key.
    ///
    /// The release or version number of the bundle.
    /// This key is a user-visible string for the *version* of the bundle.
    /// The required format is three period-separated integers, such as 10.14.1.
    /// The string can only contain numeric characters (0-9) and periods.
    public var buildVersion: () -> String?
    
    /// Value under *CFBundleDisplayName* key.
    ///
    /// The user-visible name for the bundle, used
    /// by Siri and visible on the iOS Home screen.
    public var displayName: () -> String?
    
    /// Value under *CFBundleIdentifier* key.
    ///
    /// A unique identifier for your app, typically in reverse domain name notation.
    public var identifier: () -> String?
    
    /// Value under *CFBundleName* key.
    ///
    /// A user-visible short (up to 15 characters) name for the bundle
    /// that may be displayed to users if *CFBundleDisplayName* isn't set.
    public var name: () -> String?
}

extension DependencyValues {
    
    /// A dependency for accessing the main bundle properties.
    public var mainBundleClient: MainBundleClient {
        get { self[MainBundleClient.self] }
        set { self[MainBundleClient.self] = newValue }
    }
}
