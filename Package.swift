// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "SGSL",
    platforms: [
        .macOS(.v10_13),
    ],
    products: [
        .library(
            name: "SGSL",
            targets: ["SGSL"]
        ),
        .library(
            name: "Statistics",
            targets: ["Statistics"]
        ),
        .library(
            name: "RandomNumberGeneration",
            targets: ["RandomNumberGeneration"]
        ),
        .library(
            name: "MathematicalFunctions",
            targets: ["MathematicalFunctions"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/pvieito/PythonKit.git", .branch("master")),
    ],
    targets: [
        .target(
            name: "MathematicalFunctions",
            dependencies: ["CGSL"]
        ),
        .target(
            name: "Statistics",
            dependencies: ["CGSL"]
        ),
        .target(
            name: "RandomNumberGeneration",
            dependencies: ["CGSL"]
        ),
        .target(
            name: "SGSL",
            dependencies: [
                "MathematicalFunctions",
                "Statistics",
                "RandomNumberGeneration",
            ]
        ),
        .systemLibrary(
            name: "CGSL",
            pkgConfig: "gsl",
            providers: [
                .brew(["gsl"]),
                .apt(["libgsl-dev"]),
            ]
        ),
        .testTarget(
            name: "MathematicalFunctionsTests",
            dependencies: ["MathematicalFunctions", "PythonKit"]
        ),
        .testTarget(
            name: "StatisticsTests",
            dependencies: ["Statistics", "PythonKit"]
        ),
        .testTarget(
            name: "RandomNumberGenerationTests",
            dependencies: ["RandomNumberGeneration", "PythonKit"]
        ),
    ]
)
