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
            type: .static,
            // Используем таргет обертку над XCFramework и его зависимостями
            targets: ["YandexMapsMobileWrapper"]),
    ],
    dependencies: [
    ],
    targets: [
        // Подключаем наш фреймворк локально, также его можно добавлять и через url
//        .binaryTarget(name: "YandexMapsMobileBinary", path: "./Sources/YandexMapsMobile.xcframework"),
        .binaryTarget(name: "YandexMapsMobile", url: "https://github.com/max270598/YandexMapsMobileZip/releases/download/2.0.0/YandexMapsMobile.xcframework.zip", checksum: "2af1813d655ac552f84fb3e733cbae8aec8428db69081289cae357278641efc8"),
        // обертываем наш фреймворк зависимостями
        .target(
            name: "YandexMapsMobileWrapper",
            dependencies: [
                .target(name: "YandexMapsMobile"),
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
