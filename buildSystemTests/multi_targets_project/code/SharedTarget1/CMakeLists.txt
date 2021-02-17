

AddSharedLibTarget(
    TARGET_NAME "SharedTarget1"
    PUBLIC_INC_DIRS "${CMAKE_CURRENT_SOURCE_DIR}/public"
    PRIVATE_INC_DIRS "${CMAKE_CURRENT_SOURCE_DIR}/private"
    SRC "${CMAKE_CURRENT_SOURCE_DIR}/src/SharedTarget1.cpp"

    PUBLIC_LINK_TARGETS "InterfaceTarget2"  "InterfaceTarget3"
    RESOURCES_TO_COPY_TO_EXE_DIR 
    "${CMAKE_CURRENT_SOURCE_DIR}/res_shared1_a" 
    "${CMAKE_CURRENT_SOURCE_DIR}/other_res_shared1/other_res_shared1_a.txt"
    RESOURCES_TO_COPY 
    "${CMAKE_CURRENT_SOURCE_DIR}/res_shared1_b" TO "${CMAKE_BINARY_DIR}/SharedTarget1/res"
    "${CMAKE_CURRENT_SOURCE_DIR}/other_res_shared1/abc" TO "${CMAKE_BINARY_DIR}/SharedTarget1/res"
)
