

AddStaticLibTarget(
    TARGET_NAME "StaticTarget1"
    PUBLIC_INC_DIRS "${CMAKE_CURRENT_SOURCE_DIR}/public"
    PRIVATE_INC_DIRS "${CMAKE_CURRENT_SOURCE_DIR}/private"
    SRC "${CMAKE_CURRENT_SOURCE_DIR}/src/StaticTarget1.cpp"
    PUBLIC_LINK_TARGETS "InterfaceTarget2"  "InterfaceTarget3"
    RESOURCES_TO_COPY_TO_EXE_DIR 
    "${CMAKE_CURRENT_SOURCE_DIR}/res_static1_a" 
    "${CMAKE_CURRENT_SOURCE_DIR}/other_res_static1/other_res_static1_a.txt"
    RESOURCES_TO_COPY 
    "${CMAKE_CURRENT_SOURCE_DIR}/res_static1_b" TO "${CMAKE_BINARY_DIR}/StaticTarget1/res"
    "${CMAKE_CURRENT_SOURCE_DIR}/other_res_static1/abc" TO "${CMAKE_BINARY_DIR}/StaticTarget1/res"

    INSTALL_TARGET_DIR "output_install/StaticTarget1"
    INSTALL_HEADERS_DIR "output_install/StaticTarget1/headers"
)
