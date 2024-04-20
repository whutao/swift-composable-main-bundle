import Dependencies
import Foundation

extension MainBundleClient {
    
    public static let liveValue: MainBundleClient = {
        let bundle = LockIsolated(Bundle.main)
        
        func property(forKey key: String) -> Any? {
            return bundle.value.object(forInfoDictionaryKey: key)
        }
        
        func string(forKey key: String) -> String? {
            property(forKey: key) as? String
        }
        
        func string(forKey key: String, default: String) -> (() -> String) {
            return { string(forKey: key) ?? `default` }
        }
        
        return MainBundleClient(
            property: property(forKey:),
            string: string(forKey:),
            name: string(forKey: "CFBundleName", default: ""),
            displayName: string(forKey: "CFBundleDisplayName", default: ""),
            buildNumber: string(forKey: "CFBundleVersion", default: ""),
            buildVersion: string(forKey: "CFBundleShortVersionString", default: "")
        )
    }()
}
