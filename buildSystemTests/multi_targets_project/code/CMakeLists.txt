
cmake_minimum_required(VERSION 3.16)
project(MultiTargetProject)


include(InstallRequiredSystemLibraries)
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/../License.txt")

set(CPACK_PACKAGE_VENDOR "THIS IS VENDER")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "THIS IS DESCRIPTION")
set(CPACK_PACKAGE_VERSION_MAJOR ${PROJECT_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${PROJECT_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${PROJECT_VERSION_PATCH})


set(CPACK_OUTPUT_FILE_PREFIX "${CMAKE_CURRENT_BINARY_DIR}/package")
set(CPACK_PACKAGE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR})

string(TOLOWER ${CMAKE_SYSTEM_NAME} _sys)
string(TOLOWER ${PROJECT_NAME} _project_lower)
set(CPACK_PACKAGE_FILE_NAME "${_project_lower}-${_sys}")
set(CPACK_SOURCE_PACKAGE_FILE_NAME "${_project_lower}-${PROJECT_VERSION}")


set(CPACK_SOURCE_GENERATOR "ZIP")

include(CPack)



include("${CMAKE_CURRENT_SOURCE_DIR}/../build/addTarget.cmake")

add_subdirectory(InterfaceTarget1)
add_subdirectory(InterfaceTarget2)
add_subdirectory(InterfaceTarget3)
add_subdirectory(InterfaceTarget4)
add_subdirectory(StaticTarget1)
add_subdirectory(StaticTarget2)
add_subdirectory(StaticTarget3)
add_subdirectory(SharedTarget1)
add_subdirectory(SharedTarget2)
add_subdirectory(ExeTarget1)
add_subdirectory(ExeTarget2)
