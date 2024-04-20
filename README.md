# 📦 Composable main bundle

<p>
    <img src="https://img.shields.io/badge/Swift-5.9-orange.svg" />
    <img src="https://img.shields.io/badge/iOS->= 15.0-red.svg" />
    <img src="https://img.shields.io/badge/license-MIT-blue.svg" />
</p>

`MainBundleClient` is a dependency (see [swift-dependencies](https://github.com/pointfreeco/swift-dependencies)) that provides an API to the main bundle in a testable way.

## Usage

The client can be used in reducers to access the main bundle properties.

```swift
@Dependency(\.mainBundleClient)
var mainBundle

let bundleDescription = "\(mainBundle.buildVersion()):\(mainBundle.buildNumber())" 
```

## Installation

You can add the library to an Xcode project by adding it as a package dependency.

> https://github.com/whutao/swift-composable-main-bundle

If you want to use the library in a [SwiftPM](https://swift.org/package-manager/) project, it's as simple as adding it to a `dependencies` clause in your `Package.swift`:

``` swift
dependencies: [
    .package(url: "https://github.com/whutao/swift-composable-main-bundle", from: "1.0.0")
]
```

## License

All modules are released under the MIT license. See [LICENSE](LICENSE) for details.
