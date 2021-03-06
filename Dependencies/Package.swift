// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    
    name: "Dependencies",
    defaultLocalization: "en",
       platforms: [
           SupportedPlatform.iOS("13.0")],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Dependencies",
            targets: ["Dependencies"]),
    ],
    dependencies: [
        .package(
                 name: "Networking",
                 url: "https://github.com/selfrise/Networking",
                 .upToNextMajor(from: "1.0.1")),
             .package(
                 name: "Kingfisher",
                 url: "https://github.com/onevcat/Kingfisher",
                 .upToNextMajor(from: "7.2.1"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Dependencies",
            dependencies: ["Networking", "Kingfisher"]),
        .testTarget(
            name: "DependenciesTests",
            dependencies: ["Dependencies"]),
    ]
)
