

AddExeTarget(
    TARGET_NAME "ExeTarget2"
    PRIVATE_INC_DIRS "${CMAKE_CURRENT_SOURCE_DIR}/private"
    SRC "${CMAKE_CURRENT_SOURCE_DIR}/src/ExeTarget2.cpp"    
    PUBLIC_LINK_TARGETS "StaticTarget1"  "StaticTarget2" "StaticTarget3"
    RESOURCES_TO_COPY_TO_EXE_DIR 
    "${CMAKE_CURRENT_SOURCE_DIR}/res_exe2_a" 
    "${CMAKE_CURRENT_SOURCE_DIR}/other_res_exe2/other_res_exe2_a.txt"
    RESOURCES_TO_COPY 
    "${CMAKE_CURRENT_SOURCE_DIR}/res_exe2_b" TO "${CMAKE_BINARY_DIR}/ExeTarget2/res"
    "${CMAKE_CURRENT_SOURCE_DIR}/other_res_exe2/abc" TO "${CMAKE_BINARY_DIR}/ExeTarget2/res"
)
