import ProjectDescription

let project = Project(
    name: "FanzTask",
    targets: [
        .target(
            name: "FanzTask",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.FanzTask",
            infoPlist: "FanzTask/Sources/FanzTask-Info.plist",
            sources: ["FanzTask/Sources/**"],
            resources: ["FanzTask/Resources/**",
                        "FanzTask/Sources/ViewRelated/Modules/**/*.xib"],
            dependencies: []
        ),
        .target(
            name: "FanzTaskTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.FanzTaskTests",
            infoPlist: .default,
            sources: ["FanzTask/Tests/**"],
            resources: [],
            dependencies: [.target(name: "FanzTask")]
        ),
    ]
)
