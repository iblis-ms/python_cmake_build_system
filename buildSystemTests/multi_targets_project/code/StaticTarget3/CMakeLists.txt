

AddStaticLibTarget(
    TARGET_NAME "StaticTarget3"
    PUBLIC_INC_DIRS "${CMAKE_CURRENT_SOURCE_DIR}/public"
    PRIVATE_INC_DIRS "${CMAKE_CURRENT_SOURCE_DIR}/private"
    SRC "${CMAKE_CURRENT_SOURCE_DIR}/src/StaticTarget3.cpp"
    PUBLIC_LINK_TARGETS "StaticTarget1"  "StaticTarget2" 
    RESOURCES_TO_COPY_TO_EXE_DIR 
    "${CMAKE_CURRENT_SOURCE_DIR}/res_static3_a" 
    "${CMAKE_CURRENT_SOURCE_DIR}/other_res_static3/other_res_static3_a.txt"
    RESOURCES_TO_COPY 
    "${CMAKE_CURRENT_SOURCE_DIR}/res_static3_b" TO "${CMAKE_BINARY_DIR}/StaticTarget3/res"
    "${CMAKE_CURRENT_SOURCE_DIR}/other_res_static3/abc" TO "${CMAKE_BINARY_DIR}/StaticTarget3/res"

    INSTALL_TARGET_DIR "output_install/StaticTarget3"
    INSTALL_HEADERS_DIR "output_install/StaticTarget3/headers"
)
