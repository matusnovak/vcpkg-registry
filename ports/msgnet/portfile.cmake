vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO matusnovak/msgnet
  REF 856ab93425719067321068c4b8478c4ccd1d9b62
  SHA512 9979aa66a4430444c7d10eb4ae731b32b304b57fe4c249424f1c9f633246b7d53ddc3a69313b508254bfaaa7aaa040ee4fe59d44e2aa6cb177850de78874d7a4
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
