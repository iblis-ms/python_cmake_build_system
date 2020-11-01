# Author: Marcin Serwach
# License: MIT
# ULR: https://github.com/iblis-ms/cmake_add_target
# 
# AddTarget simpliefies adding targets in CMake. For example:
##################### <EXAMPLE> ########################
#   set(SRC_DIR "${CMAKE_CURRENT_SOURCE_DIR}/src")
#   set(SRC
#       "${SRC_DIR}/main.cpp"
#       "${SRC_DIR}/ExeA.cpp"
#       "${SRC_DIR}/exeA1/ExeA1.cpp"
#       "${SRC_DIR}/exeA1/ExeA1Sub/ExeA1Sub.cpp"
#       "${SRC_DIR}/exeA2/ExeA2.cpp"
#       )
#   set(INC_DIR "${CMAKE_CURRENT_SOURCE_DIR}/inc")
#   
#   AddTarget(
#      TARGET_NAME "exeA"                      # - target name
#      TARGET_TYPE "EXE"                       # - type of target: "EXE" so target is executable
#      SRC "${SRC}"                            # - source files
#      PRIVATE_LIBS "LibraryA"                 # - libraries to link with this target; private linking, so not visible to others
#      PUBLIC_INC_DIRS "${INC_DIR}"            # - path to directories with header files
#      PUBLIC_DEFINES "DEFINE_A" "DEFINE_AA=1" # - defines
#   )
##################### </EXAMPLE> #######################
# Set to 1 to print debug values
if (NOT DEFINED ADD_TARGET_DEBUG)
    set(ADD_TARGET_DEBUG 1)
endif ()


set(CMAKE_MACOSX_RPATH "OFF")

set(CONAN_CMAKE_FILE "${CMAKE_CURRENT_LIST_DIR}/conan.cmake") # set path to file

if(NOT EXISTS "${CONAN_CMAKE_FILE}") # if not exist, download it
   message(STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
   file(DOWNLOAD "https://github.com/conan-io/cmake-conan/raw/v0.15/conan.cmake"
                 "${CONAN_CMAKE_FILE}")
endif()

include("${CONAN_CMAKE_FILE}") 
include("${CMAKE_CURRENT_LIST_DIR}/gtestHelper.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/sanitizerHelper.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/logger.cmake")




function(addGroupsInternal)

    set(OPTIONAL_ARGUMENTS_PATTERN 
        )
    
    set(ONE_ARGUMENT_PATTERN 
        ROOT_PATH 
        OUTPUT_FILES
        ) 
        
    set(MULTI_ARGUMENT_PATTERN 
        PATHS_TO_DIRS 
        EXTENSIONS
        )
    
    CMake_parse_arguments(ARG "${OPTIONAL_ARGUMENTS_PATTERN}" "${ONE_ARGUMENT_PATTERN}" "${MULTI_ARGUMENT_PATTERN}" ${ARGN} )
    list(APPEND OUTPUT_FILES)
    foreach(PATH_DIR IN LISTS ARG_PATHS_TO_DIRS)
        
    
        foreach(EXTENSION IN LISTS ARG_EXTENSIONS)
            file(GLOB_RECURSE PATHS_TO_FILES "${PATH_DIR}/*.${EXTENSION}")
            
            foreach(PATH_TO_FILE IN LISTS PATHS_TO_FILES)
            
                get_filename_component(OUTPUT_DIR "${PATH_TO_FILE}" DIRECTORY)
                file(RELATIVE_PATH RELATIVE "${ARG_ROOT_PATH}" "${OUTPUT_DIR}")
                string(REPLACE  "/" "\\"  OUTPUT_VAR "${RELATIVE}" )
                source_group("${OUTPUT_VAR}" FILES "${PATH_TO_FILE}")
                    
            endforeach()
            
            list(APPEND OUTPUT_FILES "${PATHS_TO_FILES}")
            
        endforeach()
                
    endforeach()
     
    set(${ARG_OUTPUT_FILES} "${OUTPUT_FILES}" PARENT_SCOPE)
    
endfunction()


function(addSrcGroupsInternal)
    set(OPTIONAL_ARGUMENTS_PATTERN 
        )
    
    set(ONE_ARGUMENT_PATTERN 
        ROOT_PATH 
        ) 
        
    set(MULTI_ARGUMENT_PATTERN 
        PATHS_TO_SRCS
        )
    
    CMake_parse_arguments(ARG "${OPTIONAL_ARGUMENTS_PATTERN}" "${ONE_ARGUMENT_PATTERN}" "${MULTI_ARGUMENT_PATTERN}" ${ARGN} )

    foreach(PATH_TO_SRC IN LISTS ARG_PATHS_TO_SRCS)
        get_filename_component(OUTPUT_DIR "${PATH_TO_SRC}" DIRECTORY)
        file(RELATIVE_PATH RELATIVE  "${ARG_ROOT_PATH}" "${OUTPUT_DIR}")
        string(REPLACE  "/" "\\"  OUTPUT_VAR "${RELATIVE}" )
        source_group("${OUTPUT_VAR}" FILES "${PATH_TO_SRC}")
    endforeach()
endfunction()



# \brief Creates target.
# \param[in] TARGET_NAME Target name
# \param[in] TARGET_TYPE Target type: EXE for executable, STATIC for static library, SHARED for shared library, INTERFACE for headers only library
# \param[in] TARGET_DIR Path to directory where target is defined
# \param[in] SRC Source files
# \param[in] PUBLIC_INC_DIRS Arguments to target_include_directories with PUBLIC/INTERFACE visibility,
# \param[in] PRIVATE_INC_DIRS Arguments to target_include_directories with PRIVATE visibility,
# \param[in] PUBLIC_LIBS Arguments to target_link_libraries with PUBLIC/INTERFACE visibility,
# \param[in] PRIVATE_LIBS Arguments to target_link_libraries with PRIVATE visibility,
# \param[in] PUBLIC_DEFINES Arguments to target_compile_definitions with PUBLIC/INTERFACE visibility,
# \param[in] PRIVATE_DEFINES Arguments to target_compile_definitions with PRIVATE visibility,
function(AddTargetInternal)

    set(OPTIONAL_ARGUMENTS_PATTERN 
        TEST_TARGET
        )
    
    set(ONE_ARGUMENT_PATTERN 
        TARGET_NAME 
        TARGET_TYPE 
        TARGET_DIR
        ) 
        
    set(MULTI_ARGUMENT_PATTERN 
        SRC 
        
        PUBLIC_INC_DIRS 
        PRIVATE_INC_DIRS 
        
        PUBLIC_LIBS 
        PRIVATE_LIBS 
        
        PUBLIC_DEFINES
        PRIVATE_DEFINES

        RESOURCES_TO_COPY_TO_EXE_DIR
        RESOURCES_TO_COPY

        PUBLIC_LINK_OPTIONS
        PRIVATE_LINK_OPTIONS

        PUBLIC_COMPILE_OPTIONS
        PRIVATE_COMPILE_OPTIONS
        )
  
    CMake_parse_arguments(ADD_TARGET "${OPTIONAL_ARGUMENTS_PATTERN}" "${ONE_ARGUMENT_PATTERN}" "${MULTI_ARGUMENT_PATTERN}" ${ARGN} )

    if (ADD_TARGET_DEBUG)
        logDebug("--------------------------------------------------------------")
        logDebug("TARGET_NAME=${ADD_TARGET_TARGET_NAME}")
        logDebug("TARGET_TYPE=${ADD_TARGET_TARGET_TYPE}")
        logDebug("TARGET_DIR=${ADD_TARGET_TARGET_DIR}")
        
        logDebug("SRC=${ADD_TARGET_SRC}")
        
        logDebug("PUBLIC_INC_DIRS=${ADD_TARGET_PUBLIC_INC_DIRS}")
        logDebug("PRIVATE_INC_DIRS=${ADD_TARGET_PRIVATE_INC_DIRS}")
        
        logDebug("PUBLIC_LIBS=${ADD_TARGET_PUBLIC_LIBS}")
        logDebug("PRIVATE_LIBS=${ADD_TARGET_PRIVATE_LIBS}")
        
        logDebug("PUBLIC_DEFINES=${ADD_TARGET_PUBLIC_DEFINES}")
        logDebug("PRIVATE_DEFINES=${ADD_TARGET_PRIVATE_DEFINES}")
        
        logDebug("RESOURCES_TO_COPY_TO_EXE_DIR=${ADD_TARGET_RESOURCES_TO_COPY_TO_EXE_DIR}")
        logDebug("RESOURCES_TO_COPY=${ADD_TARGET_RESOURCES_TO_COPY}")
        
        logDebug("PUBLIC_LINK_OPTIONS=${ADD_TARGET_PUBLIC_LINK_OPTIONS}")
        logDebug("PRIVATE_LINK_OPTIONS=${ADD_TARGET_PRIVATE_LINK_OPTIONS}")
        
        logDebug("PUBLIC_COMPILE_OPTIONS=${ADD_TARGET_PUBLIC_COMPILE_OPTIONS}")
        logDebug("PRIVATE_COMPILE_OPTIONS=${ADD_TARGET_PRIVATE_COMPILE_OPTIONS}")
        
        logDebug("TEST_TARGET=${ADD_TARGET_TEST_TARGET}")
        logDebug("--------------------------------------------------------------")
    endif ()
    
    if (ADD_TARGET_TEST_TARGET)
        if (ADD_TARGET_TEST_TARGET_INCLUDE)
            if (NOT "${ADD_TARGET_TARGET_NAME}" MATCHES "${ADD_TARGET_TEST_TARGET_INCLUDE}")
                message(STATUS "Target ${ADD_TARGET_TARGET_NAME} doesn't match to regex: ${ADD_TARGET_TEST_TARGET_INCLUDE}, so the test target wouldn't be built.")
                return()
            endif ()
        endif ()
        if (ADD_TARGET_TEST_TARGET_EXCLUDE)
            if ("${ADD_TARGET_TARGET_NAME}" MATCHES "${ADD_TARGET_TEST_TARGET_EXCLUDE}")
                message(STATUS "Target ${ADD_TARGET_TARGET_NAME} matches to regex: ${ADD_TARGET_TEST_TARGET_EXCLUDE}, so the test target wouldn't be built.")
                return()
            endif ()
        endif ()
    endif ()

    addGroupsInternal(ROOT_PATH "${ADD_TARGET_TARGET_DIR}" 
        PATHS_TO_DIRS "${ADD_TARGET_PUBLIC_INC_DIRS}" 
        EXTENSIONS "hpp" "h"
        OUTPUT_FILES PUBLIC_INCS_TO_SRC)
        
    addGroupsInternal(ROOT_PATH "${ADD_TARGET_TARGET_DIR}" 
        PATHS_TO_DIRS "${ADD_TARGET_PRIVATE_INC_DIRS}" 
        EXTENSIONS "hpp" "h"
        OUTPUT_FILES PRIVATE_INCS_TO_SRC)
   
    addSrcGroupsInternal(ROOT_PATH "${ADD_TARGET_TARGET_DIR}" 
        PATHS_TO_SRCS "${ADD_TARGET_SRC}")
        
    set(SRC "${ADD_TARGET_SRC}" "${PUBLIC_INCS_TO_SRC}" "${PRIVATE_INCS_TO_SRC}")
    
    if ("${ADD_TARGET_TARGET_TYPE}" STREQUAL "EXE")
        add_executable("${ADD_TARGET_TARGET_NAME}" "${SRC}")
    elseif ("${ADD_TARGET_TARGET_TYPE}" STREQUAL "STATIC")
        add_library("${ADD_TARGET_TARGET_NAME}" STATIC "${SRC}")
    elseif ("${ADD_TARGET_TARGET_TYPE}" STREQUAL "SHARED")
        add_library("${ADD_TARGET_TARGET_NAME}" SHARED "${SRC}")
    elseif ("${ADD_TARGET_TARGET_TYPE}" STREQUAL "INTERFACE")
        add_library("${ADD_TARGET_TARGET_NAME}" INTERFACE)
    else ()
        message(FATAL_ERROR " Incorrect TARGET_TYPE=${ADD_TARGET_TARGET_TYPE} for TARGET_NAME=${ADD_TARGET_TARGET_NAME} from location ${ADD_TARGET_TARGET_DIR}")
    endif ()
    
    if ("${ADD_TARGET_TARGET_TYPE}" STREQUAL "INTERFACE")
        target_include_directories("${ADD_TARGET_TARGET_NAME}" INTERFACE "${ADD_TARGET_PUBLIC_INC_DIRS}")
        
        target_link_libraries("${ADD_TARGET_TARGET_NAME}" INTERFACE "${ADD_TARGET_PUBLIC_LIBS}")
        
        target_compile_definitions("${ADD_TARGET_TARGET_NAME}" INTERFACE "${ADD_TARGET_PUBLIC_DEFINES}")
        
        target_link_options("${ADD_TARGET_TARGET_NAME}" INTERFACE "${ADD_TARGET_PUBLIC_LINK_OPTIONS}")

        target_compile_options("${ADD_TARGET_TARGET_NAME}" INTERFACE "${ADD_TARGET_PUBLIC_COMPILE_OPTIONS}")

    else()
        target_include_directories("${ADD_TARGET_TARGET_NAME}" PUBLIC "${ADD_TARGET_PUBLIC_INC_DIRS}")
        target_include_directories("${ADD_TARGET_TARGET_NAME}" PRIVATE "${ADD_TARGET_PRIVATE_INC_DIRS}")
        
        target_link_libraries("${ADD_TARGET_TARGET_NAME}" PUBLIC "${ADD_TARGET_PUBLIC_LIBS}")
        target_link_libraries("${ADD_TARGET_TARGET_NAME}" PRIVATE "${ADD_TARGET_PRIVATE_LIBS}")
        
        target_compile_definitions("${ADD_TARGET_TARGET_NAME}" PUBLIC "${ADD_TARGET_PUBLIC_DEFINES}")
        target_compile_definitions("${ADD_TARGET_TARGET_NAME}" PRIVATE "${ADD_TARGET_PRIVATE_DEFINES}")
        
        target_link_options("${ADD_TARGET_TARGET_NAME}" PUBLIC "${ADD_TARGET_PUBLIC_LINK_OPTIONS}")
        target_link_options("${ADD_TARGET_TARGET_NAME}" PRIVATE "${ADD_TARGET_PRIVATE_LINK_OPTIONS}")

        target_compile_options("${ADD_TARGET_TARGET_NAME}" PUBLIC "${ADD_TARGET_PUBLIC_COMPILE_OPTIONS}")
        target_compile_options("${ADD_TARGET_TARGET_NAME}" PRIVATE "${ADD_TARGET_PRIVATE_COMPILE_OPTIONS}")
    endif()
    
    if (ADD_TARGET_TEST_TARGET)
        set(ADD_TARGET_TEST_COMMAND "${ADD_TARGET_TARGET_NAME}")
        if (COMMAND addTargetTestRunCommand)
            AddTargetTestRunCommand("${ADD_TARGET_TARGET_NAME}")
        else()
            if (ADD_TARGET_VALGRIND)
                AddTargetTestRunCommand_Valgrind("${ADD_TARGET_TARGET_NAME}")
            endif ()

            if (ADD_TARGET_DR_MEMORY)
                AddTargetTestRunCommand_DrMemory("${ADD_TARGET_TARGET_NAME}")
            endif ()
        endif ()
        if (ADD_TARGET_TEST_SHELL_COMMAND)
            add_test(NAME "${ADD_TARGET_TARGET_NAME}" COMMAND sh -c "${ADD_TARGET_TEST_COMMAND}" ${GTEST_ARGS_LIST} )
        else()
            add_test(NAME "${ADD_TARGET_TARGET_NAME}" COMMAND  "${ADD_TARGET_TEST_COMMAND}"   ${GTEST_ARGS_LIST})
        endif()
    endif()
    
    set(CONAN_FILE_PATH "${ADD_TARGET_TARGET_DIR}/conanfile.txt")
    if (EXISTS "${CONAN_FILE_PATH}")
        file(RELATIVE_PATH CONAN_FILE_RELATIVE_PATH "${CMAKE_CURRENT_SOURCE_DIR}" "${CONAN_FILE_PATH}") # conan_cmake_run requires relative path

        # Note that build type, architecture is detected by CMake, but you can overwrite it
        # see https://github.com/conan-io/cmake-conan for details
        conan_cmake_run(CONANFILE "${CONAN_FILE_RELATIVE_PATH}"
                        BASIC_SETUP         # calls conan_basic_setup: https://docs.conan.io/en/latest/reference/generators/cmake.html
                        CMAKE_TARGETS       # to use modern CMake approach: target_* function
                        BUILD missing)      # build library if missing 
        message(STATUS "Libraries taken via Conan.io: ${CONAN_TARGETS}")
        target_link_libraries("${ADD_TARGET_TARGET_NAME}" PUBLIC  ${CONAN_TARGETS})
    endif()
    
    if (ADD_TARGET_CLANG_ADDRESS_SANITIZER)
        target_link_options("${ADD_TARGET_TARGET_NAME}" PUBLIC "-fsanitize=address" "-fno-omit-frame-pointer")
        target_compile_options("${ADD_TARGET_TARGET_NAME}" PUBLIC "-fsanitize=address" "-fno-omit-frame-pointer")
    endif()
    if (ADD_TARGET_CLANG_MEMORY_SANITIZER)
        target_link_options("${ADD_TARGET_TARGET_NAME}" PUBLIC "-fsanitize=memory" "-fno-omit-frame-pointer" "-fno-optimize-sibling-calls")
        target_compile_options("${ADD_TARGET_TARGET_NAME}" PUBLIC "-fsanitize=memory" "-fno-omit-frame-pointer" "-fno-optimize-sibling-calls")
    endif()
    if (ADD_TARGET_CLANG_THREAD_SANITIZER)
        target_link_options("${ADD_TARGET_TARGET_NAME}" PUBLIC "-fsanitize=thread" "-fno-omit-frame-pointer")
        target_compile_options("${ADD_TARGET_TARGET_NAME}" PUBLIC "-fsanitize=thread" "-fno-omit-frame-pointer")
    endif()
    if (ADD_TARGET_CLANG_UNDEFINED_BEHAVIOR_SANITIZER)
        target_link_options("${ADD_TARGET_TARGET_NAME}" PUBLIC "-fsanitize=undefined")
        target_compile_options("${ADD_TARGET_TARGET_NAME}" PUBLIC "-fsanitize=undefined")
    endif()

    set(RES_COPY_TO_EXE_DIR ${ADD_TARGET_RESOURCES_TO_COPY_TO_EXE_DIR})
    set(RES_COPY ${ADD_TARGET_RESOURCES_TO_COPY})

    list(APPEND LIBS ${ADD_TARGET_PUBLIC_LIBS} ${ADD_TARGET_PRIVATE_LIBS})

       list(APPEND ALL_LIBS "${LIBS}")
    foreach(LIB IN LISTS LIBS)
        list(APPEND RES_COPY_TO_EXE_DIR ${${LIB}_PROPERTY_RESOURCES_TO_COPY_TO_EXE_DIR})
        list(APPEND RES_COPY ${${LIB}_PROPERTY_RESOURCES_TO_COPY})

           list(APPEND ALL_LIBS ${${LIB}_PROPERTY_ALL_LIBS})
    endforeach()

       set(${ADD_TARGET_TARGET_NAME}_PROPERTY_RESOURCES_TO_COPY_TO_EXE_DIR "${RES_COPY_TO_EXE_DIR}" CACHE INTERNAL "Resource of ${ADD_TARGET_TARGET_NAME} to copy to exe dir" FORCE)
       set(${ADD_TARGET_TARGET_NAME}_PROPERTY_RESOURCES_TO_COPY "${RES_COPY}" CACHE INTERNAL "Resource of ${ADD_TARGET_TARGET_NAME} to copy to given dir" FORCE)
       set(${ADD_TARGET_TARGET_NAME}_PROPERTY_TARGET_DIR "${ADD_TARGET_TARGET_DIR}" CACHE INTERNAL "Path where target ${ADD_TARGET_TARGET_NAME} is defined." FORCE)

    if("${ADD_TARGET_TARGET_TYPE}" STREQUAL "EXE")
        foreach(RES IN LISTS ${ADD_TARGET_TARGET_NAME}_PROPERTY_RESOURCES_TO_COPY_TO_EXE_DIR)

            if (NOT EXISTS "${RES}")
                logError("Resource ${RES} not exists.")
            else()
                if (IS_DIRECTORY "${RES}")
                    get_filename_component(DIR_NAME "${RES}" NAME_WE)
                    add_custom_command(TARGET ${ADD_TARGET_TARGET_NAME} POST_BUILD
                        COMMAND ${CMAKE_COMMAND} -E copy_directory 
                            "${RES}" 
                            "$<TARGET_FILE_DIR:${ADD_TARGET_TARGET_NAME}>/${DIR_NAME}")  # copy_directory copies content without folder, so folder needs to be added to destination path
                else ()
                    add_custom_command(TARGET ${ADD_TARGET_TARGET_NAME} POST_BUILD
                        COMMAND ${CMAKE_COMMAND} -E copy
                            "${RES}" 
                            "$<TARGET_FILE_DIR:${ADD_TARGET_TARGET_NAME}>")  

                endif ()
            endif ()
        endforeach()

        if (${ADD_TARGET_TARGET_NAME}_PROPERTY_RESOURCES_TO_COPY)
            list(LENGTH ${ADD_TARGET_TARGET_NAME}_PROPERTY_RESOURCES_TO_COPY RES_LIST_LENGTH)

            math(EXPR CHECK_LENGTH "${RES_LIST_LENGTH}%3")
            if (NOT "${CHECK_LENGTH}" STREQUAL "0")
                logError("Incorrect format of RESOURCES_TO_COPY values. Expected \"src TO dest\".")
            endif ()

            foreach (KEYWORD_INDEX RANGE 1 ${RES_LIST_LENGTH} 3) # RANGE start stop step

                math(EXPR INDEX "${KEYWORD_INDEX}-1")
                list(GET ${ADD_TARGET_TARGET_NAME}_PROPERTY_RESOURCES_TO_COPY ${INDEX} SRC)

                list(GET ${ADD_TARGET_TARGET_NAME}_PROPERTY_RESOURCES_TO_COPY ${KEYWORD_INDEX} KEYWORD)

                math(EXPR DEST_INDEX "${KEYWORD_INDEX}+1")
                list(GET ${ADD_TARGET_TARGET_NAME}_PROPERTY_RESOURCES_TO_COPY ${DEST_INDEX} DEST)

                if (NOT "${KEYWORD}" STREQUAL "TO")
                    logError("Incorrect key for RESOURCES_TO_COPY in target: ${ADD_TARGET_TARGET_NAME} after item: ${SRC}")
                endif()
                if (IS_DIRECTORY "${SRC}")
                    get_filename_component(DIR_NAME "${SRC}" NAME_WE)
                    add_custom_command(TARGET ${ADD_TARGET_TARGET_NAME} POST_BUILD
                        COMMAND ${CMAKE_COMMAND} -E make_directory "${DEST}/${DIR_NAME}"
                        COMMAND ${CMAKE_COMMAND} -E copy_directory 
                            "${SRC}" 
                            "${DEST}/${DIR_NAME}")  
                else ()
                    add_custom_command(TARGET ${ADD_TARGET_TARGET_NAME} POST_BUILD
                        COMMAND ${CMAKE_COMMAND} -E make_directory "${DEST}"
                        COMMAND ${CMAKE_COMMAND} -E copy
                            "${SRC}" 
                            "${DEST}")  
                endif ()

            endforeach ()
        endif()

        # copy dynanic libs 
        foreach(LIB IN LISTS ${ADD_TARGET_TARGET_NAME}_PROPERTY_ALL_LIBS)
            get_target_property(OUTPUT_TYPE ${LIB} TYPE)
            if ("${OUTPUT_TYPE}" STREQUAL "SHARED_LIBRARY")
                add_custom_command(TARGET ${ADD_TARGET_TARGET_NAME} POST_BUILD
                    COMMAND ${CMAKE_COMMAND} -E copy
                        "$<TARGET_FILE:${LIB}>" 
                        "$<TARGET_FILE_DIR:${ADD_TARGET_TARGET_NAME}>")  
            endif()
        endforeach()
    endif()
endfunction()


function(printTarget TARGET_NAME)
    message(STATUS "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")

    if (NOT TARGET ${TARGET_NAME})
        logStatus("NO TARGET NAMED: ${TARGET_NAME}")
        return()
    endif()

    logStatus("TARGET NAME: ${TARGET_NAME}")
    get_target_property(OUTPUT_TYPE ${TARGET_NAME} TYPE)
    logStatus("TARGET TYPE: ${OUTPUT_TYPE}")
    logStatus("ROOT: ${${TARGET_NAME}_PROPERTY_TARGET_DIR}")

    get_target_property(OUTPUT_SOURCES ${TARGET_NAME} SOURCES)
    if (OUTPUT_SOURCES)
        foreach(ITEM IN LISTS OUTPUT_SOURCES)
            logStatus("SOURCES: ${ITEM}")
        endforeach()
    endif ()
    
    get_target_property(OUTPUT_INC_DIR ${TARGET_NAME} INCLUDE_DIRECTORIES)
    if (OUTPUT_INC_DIR)
        foreach(ITEM IN LISTS OUTPUT_INC_DIR)
            logStatus("INCLUDE_DIRECTORIES: ${ITEM}")
        endforeach()
    endif ()
    
    get_target_property(OUTPUT_INT_INC_DIR ${TARGET_NAME} INTERFACE_INCLUDE_DIRECTORIES)
    if (OUTPUT_INT_INC_DIR)
        foreach(ITEM IN LISTS OUTPUT_INT_INC_DIR)
            logStatus("INTERFACE_INCLUDE_DIRECTORIES: ${ITEM}")
        endforeach()
    endif ()
    
    get_target_property(OUTPUT_COMPILE_DEF ${TARGET_NAME} COMPILE_DEFINITIONS)
    if (OUTPUT_COMPILE_DEF)
        foreach(ITEM IN LISTS OUTPUT_COMPILE_DEF)
            logStatus("COMPILE_DEFINITIONS: ${ITEM}")
        endforeach()
    endif ()
    
    get_target_property(OUTPUT_INT_COMPILE_DEF ${TARGET_NAME} INTERFACE_COMPILE_DEFINITIONS)
    if (OUTPUT_INT_COMPILE_DEF)
        foreach(ITEM IN LISTS OUTPUT_INT_COMPILE_DEF)
            logStatus("COMPILE_DEFINITIONS: ${ITEM}")
        endforeach()
    endif ()
    
    get_target_property(OUTPUT_COMPILE_OPT ${TARGET_NAME} COMPILE_OPTIONS)
    if (OUTPUT_COMPILE_OPT)
        foreach(ITEM IN LISTS OUTPUT_COMPILE_OPT)
            logStatus("COMPILE_OPTIONS: ${ITEM}")
        endforeach()
    endif ()
    
    get_target_property(OUTPUT_INT_COMPILE_OPT ${TARGET_NAME} INTERFACE_COMPILE_OPTIONS)
    if (OUTPUT_INT_COMPILE_OPT)
        foreach(ITEM IN LISTS OUTPUT_INT_COMPILE_OPT)
            logStatus("INTERFACE_COMPILE_OPTIONS: ${ITEM}")
        endforeach()
    endif ()
    
    get_target_property(OUTPUT_LINK_OPT ${TARGET_NAME} LINK_OPTIONS)
    if (OUTPUT_LINK_OPT)
        foreach(ITEM IN LISTS OUTPUT_LINK_OPT)
            logStatus("LINK_OPTIONS: ${ITEM}")
        endforeach()
    endif ()
    
    get_target_property(OUTPUT_INT_LINK_OPT ${TARGET_NAME} INTERFACE_LINK_OPTIONS)
    if (OUTPUT_INT_LINK_OPT)
        foreach(ITEM IN LISTS OUTPUT_INT_LINK_OPT)
            logStatus("INTERFACE_LINK_OPTIONS: ${ITEM}")
        endforeach()
    endif ()

    message(STATUS "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
endfunction()

# \brief Creates target.
# \param[in] TARGET_NAME Target name
# \param[in] TARGET_TYPE Target type: EXE for executable, STATIC for static library, SHARED for shared library, INTERFACE for headers only library
# \param[in] TARGET_DIR Path to directory where target is defined
# \param[in] SRC Source files
# \param[in] PUBLIC_INC_DIRS Arguments to target_include_directories with PUBLIC/INTERFACE visibility,
# \param[in] PRIVATE_INC_DIRS Arguments to target_include_directories with PRIVATE visibility,
# \param[in] PUBLIC_LIBS Arguments to target_link_libraries with PUBLIC/INTERFACE visibility,
# \param[in] PRIVATE_LIBS Arguments to target_link_libraries with PRIVATE visibility,
# \param[in] PUBLIC_DEFINES Arguments to target_compile_definitions with PUBLIC/INTERFACE visibility,
# \param[in] PRIVATE_DEFINES Arguments to target_compile_definitions with PRIVATE visibility,
macro(AddTarget)

    AddTargetInternal(TARGET_DIR "${CMAKE_CURRENT_SOURCE_DIR}" TARGET_LINE "${CMAKE_CURRENT_LIST_LINE}" ${ARGV})
    
endmacro()

# \brief Creates test target.
# \param[in] TARGET_NAME Target name
# \param[in] TARGET_TYPE Target type: EXE for executable, STATIC for static library, SHARED for shared library, INTERFACE for headers only library
# \param[in] TARGET_DIR Path to directory where target is defined
# \param[in] SRC Source files
# \param[in] PUBLIC_INC_DIRS Arguments to target_include_directories with PUBLIC/INTERFACE visibility,
# \param[in] PRIVATE_INC_DIRS Arguments to target_include_directories with PRIVATE visibility,
# \param[in] PUBLIC_LIBS Arguments to target_link_libraries with PUBLIC/INTERFACE visibility,
# \param[in] PRIVATE_LIBS Arguments to target_link_libraries with PRIVATE visibility,
# \param[in] PUBLIC_DEFINES Arguments to target_compile_definitions with PUBLIC/INTERFACE visibility,
# \param[in] PRIVATE_DEFINES Arguments to target_compile_definitions with PRIVATE visibility,
macro(AddTestTarget)

    AddTargetInternal(TARGET_DIR "${CMAKE_CURRENT_SOURCE_DIR}" TARGET_LINE "${CMAKE_CURRENT_LIST_LINE}" ${ARGV} TEST_TARGET)
    
endmacro()
