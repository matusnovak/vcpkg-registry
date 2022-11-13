vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO matusnovak/msgnet
  REF ea613d0011e57315e15ab90e7e6ede1a5eff9b2e
  SHA512 cce9b382677c7ef4909a83759ba30834b442ca0adf254f7617434673992e1a359bfcfee4ead50c90c4bbf3779b083c81b1f1274c49f76e68159dfb0c4f8ae0be
  HEAD_REF main
)

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
)
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

vcpkg_copy_pdbs()

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)

file(
    INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" 
    DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
