#header-only library

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Zentarious/CommonLibSSE-NG-Zen-Repository
    REF  main
    SHA512 1cdecbe5e70d56a68bb48e1bc5564c224a22fab7483f1a9e50b7cdf9ec41d29331d50e50715f2bff1d0124d679b7467dcecf7b0b98832c9ff607355201aee654
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
        FEATURES
        "tests"                 BUILD_TESTS
        )

vcpkg_cmake_configure(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
)
vcpkg_cmake_install()

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
