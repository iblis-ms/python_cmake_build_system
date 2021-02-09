

AddStaticLibTarget(
    TARGET_NAME "StaticTarget2"
    PUBLIC_INC_DIRS "${CMAKE_CURRENT_SOURCE_DIR}/public"
    PRIVATE_INC_DIRS "${CMAKE_CURRENT_SOURCE_DIR}/private"
    SRC "${CMAKE_CURRENT_SOURCE_DIR}/src/StaticTarget2.cpp"
    PUBLIC_LINK_TARGETS "InterfaceTarget2"  "InterfaceTarget4"
    RESOURCES_TO_COPY_TO_EXE_DIR 
    "${CMAKE_CURRENT_SOURCE_DIR}/res_static2_a" 
    "${CMAKE_CURRENT_SOURCE_DIR}/other_res_static2/other_res_static2_a.txt"
    RESOURCES_TO_COPY 
    "${CMAKE_CURRENT_SOURCE_DIR}/res_static2_b" TO "${CMAKE_BINARY_DIR}/StaticTarget2/res"
    "${CMAKE_CURRENT_SOURCE_DIR}/other_res_static2/abc" TO "${CMAKE_BINARY_DIR}/StaticTarget2/res"
)
