import Dependencies
import Foundation

extension MainBundleClient {
    
    public static var liveValue: MainBundleClient {
        let bundle = LockIsolated(Bundle.main)
        
        func property(forKey key: String) -> Any? {
            return bundle.value.object(forInfoDictionaryKey: key)
        }
        
        func string(forKey key: String) -> String? {
            return property(forKey: key) as? String
        }
        
        func stringGetter(forKey key: String) -> (() -> String?) {
            return { string(forKey: key) }
        }
        
        return MainBundleClient(
            property: property(forKey:),
            string: string(forKey:),
            buildNumber: stringGetter(forKey: "CFBundleVersion"),
            buildVersion: stringGetter(forKey: "CFBundleShortVersionString"),
            displayName: stringGetter(forKey: "CFBundleDisplayName"),
            identifier: stringGetter(forKey: "CFBundleIdentifier"),
            name: stringGetter(forKey: "CFBundleName")
        )
    }
}
