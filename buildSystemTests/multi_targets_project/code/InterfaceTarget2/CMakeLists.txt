AddInterfaceTarget(
    TARGET_NAME "InterfaceTarget2"
    PUBLIC_INC_DIRS "${CMAKE_CURRENT_SOURCE_DIR}/public"
    PUBLIC_LINK_TARGETS "InterfaceTarget1"

    RESOURCES_TO_COPY_TO_EXE_DIR 
    "${CMAKE_CURRENT_SOURCE_DIR}/res_interface2_a" 
    "${CMAKE_CURRENT_SOURCE_DIR}/other_res_interface2/other_res_interface2_a.txt"
    RESOURCES_TO_COPY 
    "${CMAKE_CURRENT_SOURCE_DIR}/res_interface2_b" TO "${CMAKE_BINARY_DIR}/InterfaceTarget2/res"
    "${CMAKE_CURRENT_SOURCE_DIR}/other_res_interface2/abc" TO "${CMAKE_BINARY_DIR}/InterfaceTarget2/res"
)
