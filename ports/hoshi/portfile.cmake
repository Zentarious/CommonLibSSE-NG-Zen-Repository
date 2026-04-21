#header-only library

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Zentarious/CommonLibSSE-NG-Zen-Repository
    REF <new-commit-id-or-tag>
    SHA512 0
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
