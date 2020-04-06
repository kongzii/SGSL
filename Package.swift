// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "SGSL",
    products: [
        .library(
            name: "SGSL",
            targets: [
                "SGSL",
            ]
        ),
        .library(
            name: "Statistics",
            targets: [
                "Statistics",
            ]
        )
    ],
    dependencies: [

    ],
    targets: [
        .target(
            name: "Test",
            dependencies: [
                "SGSL",
            ]),
        .target(
            name: "MathematicalFunctions",
            dependencies: ["CGSL"]),
        .target(
            name: "Statistics",
            dependencies: ["CGSL"]),
        .target(
            name: "RandomNumberGeneration",
            dependencies: ["CGSL"]),
        .target(
            name: "SGSL",
            dependencies: [
                "MathematicalFunctions",
                "Statistics",
                "RandomNumberGeneration",
            ]),
        .systemLibrary(
            name: "CGSL",
            pkgConfig: "gsl",
            providers: [
                .brew(["gsl"]),
                .apt(["libgsl-dev"]),
            ]),
    ]
)
