
AddInterfaceTarget(
    TARGET_NAME "InterfaceTarget3"
    PUBLIC_INC_DIRS "${CMAKE_CURRENT_SOURCE_DIR}/public"

    RESOURCES_TO_COPY_TO_EXE_DIR 
    "${CMAKE_CURRENT_SOURCE_DIR}/res_interface3_a" 
    "${CMAKE_CURRENT_SOURCE_DIR}/other_res_interface3/other_res_interface3_a.txt"
    RESOURCES_TO_COPY 
    "${CMAKE_CURRENT_SOURCE_DIR}/res_interface3_b" TO "${CMAKE_BINARY_DIR}/InterfaceTarget3/res"
    "${CMAKE_CURRENT_SOURCE_DIR}/other_res_interface3/abc" TO "${CMAKE_BINARY_DIR}/InterfaceTarget3/res"

    INSTALL_TARGET_DIR "output_install/InterfaceTarget3"
    INSTALL_HEADERS_DIR "output_install/InterfaceTarget3/headers"
)