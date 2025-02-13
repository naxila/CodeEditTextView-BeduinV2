// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CodeEditTextView",
    platforms: [.macOS(.v13)],
    products: [
        .library(
            name: "CodeEditTextView",
            targets: ["CodeEditTextView"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/krzyzanowskim/STTextView.git",
            exact: "0.8.7"
        ),
        .package(
            url: "https://github.com/naxila/CodeEditLanguages-BeduinV2.git",
            exact: "0.1.17-alpha2"
        ),
        .package(
            url: "https://github.com/lukepistrol/SwiftLintPlugin",
            from: "0.2.2"
        ),
        .package(
            url: "https://github.com/ChimeHQ/TextFormation",
            from: "0.7.0"
        )
    ],
    targets: [
        .target(
            name: "CodeEditTextView",
            dependencies: [
                "STTextView",
                .product(name: "CodeEditLanguages", package: "CodeEditLanguages-BeduinV2"),
                "TextFormation",
                .product(name: "STTextKitPlus", package: "STTextView")
            ],
            plugins: [
                .plugin(name: "SwiftLint", package: "SwiftLintPlugin")
            ]
        ),

        .testTarget(
            name: "CodeEditTextViewTests",
            dependencies: [
                "CodeEditTextView",
                .product(name: "CodeEditLanguages", package: "CodeEditLanguages-BeduinV2"),
            ]
        ),
    ]
)
