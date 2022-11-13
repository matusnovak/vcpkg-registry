vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO matusnovak/msgnet
  REF 7d9f4616d19020d41d75ab70a0ffb198d254e09b
  SHA512 27e5e483eaae9a13b753a71f8773fafeefb2a4a3fefe033f4d7bc6daad64d89aad7622636b82cf0695a1f64f6a34d34d9dffe8965fdeb78a9ce8ef4124dc63a7
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
