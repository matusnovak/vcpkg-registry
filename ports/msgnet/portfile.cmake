vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO matusnovak/msgnet
  REF 121d24d110de5adfaaad3b9bdfdef5c6a69e650c
  SHA512 be05d473617c76438071f874a025c0109213f291122e39d968835b932bc71489e90bdfc5485740a187fb7efe604dfa1b1b3c4687074c81e83e229eaef922b8e0
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
