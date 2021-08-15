AddInterfaceTarget(
    TARGET_NAME "InterfaceTarget4"
    PUBLIC_INC_DIRS "${CMAKE_CURRENT_SOURCE_DIR}/public"

    RESOURCES_TO_COPY_TO_EXE_DIR 
    "${CMAKE_CURRENT_SOURCE_DIR}/res_interface4_a" 
    "${CMAKE_CURRENT_SOURCE_DIR}/other_res_interface4/other_res_interface4_a.txt"
    RESOURCES_TO_COPY 
    "${CMAKE_CURRENT_SOURCE_DIR}/res_interface4_b" TO "${CMAKE_BINARY_DIR}/InterfaceTarget4/res"
    "${CMAKE_CURRENT_SOURCE_DIR}/other_res_interface4/abc" TO "${CMAKE_BINARY_DIR}/InterfaceTarget4/res"

    INSTALL_TARGET_DIR "output_install/InterfaceTarget4"
    INSTALL_HEADERS_DIR "output_install/InterfaceTarget4/headers"
)