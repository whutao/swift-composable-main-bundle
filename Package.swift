// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "swift-composable-main-bundle",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "ComposableMainBundle", targets: ["ComposableMainBundle"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/pointfreeco/swift-dependencies",
            from: Version(1, 2, 0)
        )
    ],
    targets: [
        .target(name: "ComposableMainBundle", dependencies: [
            .product(name: "Dependencies", package: "swift-dependencies"),
            .product(name: "DependenciesMacros", package: "swift-dependencies")
        ])
    ]
)
