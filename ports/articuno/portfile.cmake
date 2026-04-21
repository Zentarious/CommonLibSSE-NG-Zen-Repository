vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Zentarious/CommonLibSSE-NG-Zen-Repository
    REF  main
    SHA512 0
)


vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
        FEATURES
        "icywind-archive"       BUILD_ICYWIND_ARCHIVE
        "jsoncons-archive"      BUILD_JSONCONS_ARCHIVE
        "rapidyaml-archive"     BUILD_RAPIDYAML_ARCHIVE
        "toml11-archive"        BUILD_TOML11_ARCHIVE
        "tomlplusplus-archive"  BUILD_TOMLPP_ARCHIVE
        "pugixml-archive"       BUILD_PUGIXML_ARCHIVE
        "tests"                 BUILD_TESTS
        )

vcpkg_cmake_configure(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
  OPTIONS ${FEATURE_OPTIONS}
)

vcpkg_cmake_install()

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
