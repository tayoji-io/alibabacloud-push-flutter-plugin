// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "aliyun_push",
    platforms: [
        .iOS("12.0")
    ],
    products: [
        .library(name: "aliyun-push", targets: ["aliyun_push"])
    ],
    targets: [
        .target(
            name: "aliyun_push",
            cSettings: [
                .headerSearchPath("include/aliyun_push")
            ]
        )
    ]
)
