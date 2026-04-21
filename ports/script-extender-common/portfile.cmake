if (VCPKG_LIBRARY_LINKAGE STREQUAL dynamic)
    message(WARNING "Warning: SKSE only supports static linkage, overriding setting.")
endif ()
set(VCPKG_LIBRARY_LINKAGE static)
set(VCPKG_CRT_LINKAGE static)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Zentarious/CommonLibSSE-NG-Zen-Repository
    REF <new-commit-id-or-tag>
    SHA512 0
)

vcpkg_cmake_configure(
SOURCE_PATH "${SOURCE_PATH}"
PREFER_NINJA
)

vcpkg_cmake_install()
vcpkg_copy_pdbs()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_cmake_config_fixup(
  PACKAGE_NAME common
  CONFIG_PATH "lib/cmake/common"
)

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)
