

AddSharedLibTarget(
    TARGET_NAME "SharedTarget2"
    PUBLIC_INC_DIRS "${CMAKE_CURRENT_SOURCE_DIR}/public"
    PRIVATE_INC_DIRS "${CMAKE_CURRENT_SOURCE_DIR}/private"
    SRC "${CMAKE_CURRENT_SOURCE_DIR}/src/SharedTarget2.cpp"

    PUBLIC_LINK_TARGETS "InterfaceTarget2"  "InterfaceTarget3"
    RESOURCES_TO_COPY_TO_EXE_DIR 
    "${CMAKE_CURRENT_SOURCE_DIR}/res_shared2_a" 
    "${CMAKE_CURRENT_SOURCE_DIR}/other_res_shared2/other_res_shared2_a.txt"
    RESOURCES_TO_COPY 
    "${CMAKE_CURRENT_SOURCE_DIR}/res_shared2_b" TO "${CMAKE_BINARY_DIR}/SharedTarget2/res"
    "${CMAKE_CURRENT_SOURCE_DIR}/other_res_shared2/abc" TO "${CMAKE_BINARY_DIR}/SharedTarget2/res"

    INSTALL_TARGET_DIR "output_install/SharedTarget2"
    INSTALL_HEADERS_DIR "output_install/SharedTarget2/headers"
)
