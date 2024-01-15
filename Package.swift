// swift-tools-version: 5.9
import PackageDescription

let package = Package(
  name: "MetaverseVulkanFramework",
  products: [
    .library(
      name: "MoltenVK",
      targets: ["VkBundle", "MoltenVK"]
    ),
  ],
  targets: [
    .target(
      name: "VkBundle",
      dependencies: [
        .target(name: "MoltenVK")
      ],
      resources: [
        .copy("Resources/vulkan"),
      ],
      swiftSettings: [
        .interoperabilityMode(.Cxx)
      ]
    ),
    .binaryTarget(
      name: "MoltenVK",
      path: "Frameworks/1.2.6-rc2/apple/MoltenVK.xcframework"
    ),
    .testTarget(
      name: "VkBundleTests",
      dependencies: ["VkBundle"],
      swiftSettings: [
        .interoperabilityMode(.Cxx)
      ]
    ),
  ],
  cLanguageStandard: .gnu17,
  cxxLanguageStandard: .cxx17
)
