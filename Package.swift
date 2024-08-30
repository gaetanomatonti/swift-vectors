// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Vectors",
  platforms: [
    .iOS(.v13),
    .macOS(.v11),
    .watchOS(.v7),
    .tvOS(.v13),
    .visionOS(.v1)
  ],
  products: [
    .library(
      name: "Vectors",
      targets: ["Vectors"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-numerics", from: "1.0.2")
  ],
  targets: [
    .target(
      name: "Vectors"
    ),
    .testTarget(
      name: "VectorsTests",
      dependencies: [
        "Vectors",
        .product(name: "Numerics", package: "swift-numerics"),
      ]
    ),
  ]
)
