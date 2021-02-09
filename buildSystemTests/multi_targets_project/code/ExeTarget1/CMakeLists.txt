

AddExeTarget(
    TARGET_NAME "ExeTarget1"
    PRIVATE_INC_DIRS "${CMAKE_CURRENT_SOURCE_DIR}/private"
    SRC "${CMAKE_CURRENT_SOURCE_DIR}/src/ExeTarget1.cpp"    
    PUBLIC_LINK_TARGETS "SharedTarget1"  "SharedTarget2"
    RESOURCES_TO_COPY_TO_EXE_DIR 
    "${CMAKE_CURRENT_SOURCE_DIR}/res_exe1_a" 
    "${CMAKE_CURRENT_SOURCE_DIR}/other_res_exe1/other_res_exe1_a.txt"
    RESOURCES_TO_COPY 
    "${CMAKE_CURRENT_SOURCE_DIR}/res_exe1_b" TO "${CMAKE_BINARY_DIR}/ExeTarget1/res"
    "${CMAKE_CURRENT_SOURCE_DIR}/other_res_exe1/abc" TO "${CMAKE_BINARY_DIR}/ExeTarget1/res"
)
