// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let vlcBinary = Target.binaryTarget(name: "VLCKit-all", url: "https://github.com/crystailx/vlckit-spm/releases/download/4.0.0a11/VLCKit-all.xcframework.zip", checksum: "c62e9202ae884e5bfa3d4d053392c3e271ccafe7fdb160c94c799ec44c1fbf4b")

let package = Package(
    name: "vlckit-spm",
    platforms: [.macOS(.v10_13), .iOS(.v11), .tvOS(.v11)],
    products: [
        .library(
            name: "VLCKitSPM",
            targets: ["VLCKitSPM"]),
    ],
    dependencies: [],
    targets: [
        vlcBinary,
        .target(
            name: "VLCKitSPM",
            dependencies: [
                .target(name: "VLCKit-all")
            ], linkerSettings: [
                .linkedFramework("QuartzCore", .when(platforms: [.iOS])),
                .linkedFramework("CoreText", .when(platforms: [.iOS, .tvOS])),
                .linkedFramework("AVFoundation", .when(platforms: [.iOS, .tvOS])),
                .linkedFramework("Security", .when(platforms: [.iOS])),
                .linkedFramework("CFNetwork", .when(platforms: [.iOS])),
                .linkedFramework("AudioToolbox", .when(platforms: [.iOS, .tvOS])),
                .linkedFramework("OpenGLES", .when(platforms: [.iOS, .tvOS])),
                .linkedFramework("CoreGraphics", .when(platforms: [.iOS])),
                .linkedFramework("VideoToolbox", .when(platforms: [.iOS, .tvOS])),
                .linkedFramework("CoreMedia", .when(platforms: [.iOS, .tvOS])),
                .linkedLibrary("c++", .when(platforms: [.iOS, .tvOS])),
                .linkedLibrary("xml2", .when(platforms: [.iOS, .tvOS])),
                .linkedLibrary("z", .when(platforms: [.iOS, .tvOS])),
                .linkedLibrary("bz2", .when(platforms: [.iOS, .tvOS])),
                .linkedFramework("Foundation", .when(platforms: [.macOS])),
                .linkedLibrary("iconv")
            ]),
    ]
)
