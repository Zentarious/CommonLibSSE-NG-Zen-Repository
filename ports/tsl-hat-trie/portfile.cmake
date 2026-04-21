#header-only library

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Zentarious/CommonLibSSE-NG-Zen-Repository
    REF  main
    SHA512 0
)

vcpkg_cmake_configure(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
)
vcpkg_build_cmake()

file(INSTALL "${SOURCE_PATH}/include/tsl/"
     DESTINATION "${CURRENT_PACKAGES_DIR}/include/tsl/")

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)
