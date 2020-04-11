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
    ],
    dependencies: [
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
            dependencies: ["MathematicalFunctions"]
        ),
        .testTarget(
            name: "StatisticsTests",
            dependencies: ["Statistics"]
        ),
        .testTarget(
            name: "RandomNumberGenerationTests",
            dependencies: ["RandomNumberGeneration"]
        ),
    ]
)
