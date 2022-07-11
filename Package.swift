// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "YandexMapsMobileWrapper",
    platforms: [
        .iOS(.v11),
    ],
    products: [
        .library(
            name: "YandexMapsMobileWrapper",
            // Используем таргет обертку над XCFramework и его зависимостями
            targets: ["YandexMapsMobileWrapper"]),
    ],
    dependencies: [
    ],
    targets: [
        // Подключаем наш фреймворк локально, также его можно добавлять и через url
//        .binaryTarget(name: "YandexMapsMobileBinary", path: "./Sources/YandexMapsMobile.xcframework"),
        .binaryTarget(name: "YandexMapsMobile-4.1.0-lite", url: "https://github.com/crownvic/YandexMapsMobileLiteSPM/releases/download/4.1.0/YandexMapsMobile-4.1.0-lite.framework.zip", checksum: "28310d0c2661625b8137e41b2327f751c3a25d8aa389e6772990a73e39e6485c"),
        // обертываем наш фреймворк зависимостями
        .target(
            name: "YandexMapsMobileWrapper",
            dependencies: [
                .target(name: "YandexMapsMobile-4.1.0-lite"),
            ],
            linkerSettings: [
                .linkedFramework("CoreLocation"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("SystemConfiguration"),
                .linkedLibrary("c++"),
                .unsafeFlags(["-ObjC"]),
            ]),
    ]
)
