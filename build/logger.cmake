
set(LOG_LEVEL_ERROR 0)
set(LOG_LEVEL_WARNING 10)
set(LOG_LEVEL_NOTICE 20)
set(LOG_LEVEL_STATUS 30)
set(LOG_LEVEL_VERBOSE 40)
set(LOG_LEVEL_DEBUG 50)
set(LOG_LEVEL_TRACE 60)



if (NOT DEFINED LOG_LEVEL)
    set(LOG_LEVEL_INTERNAL ${LOG_LEVEL_STATUS} CACHE STRING "Current log level" FORCE)
elseif (NOT DEFINED LOG_LEVEL_INTERNAL)
    if ("${LOG_LEVEL}" STREQUAL "ERROR")
        set(LOG_LEVEL_INTERNAL ${LOG_LEVEL_ERROR} CACHE STRING "Current log level" FORCE)
    elseif("${LOG_LEVEL}" STREQUAL "WARNING")
        set(LOG_LEVEL_INTERNAL ${LOG_LEVEL_WARNING} CACHE STRING "Current log level" FORCE)
    elseif("${LOG_LEVEL}" STREQUAL "NOTICE")
        set(LOG_LEVEL_INTERNAL ${LOG_LEVEL_NOTICE} CACHE STRING "Current log level" FORCE)
    elseif("${LOG_LEVEL}" STREQUAL "STATUS")
        set(LOG_LEVEL_INTERNAL ${LOG_LEVEL_STATUS} CACHE STRING "Current log level" FORCE)
    elseif("${LOG_LEVEL}" STREQUAL "VERBOSE")
        set(LOG_LEVEL_INTERNAL ${LOG_LEVEL_VERBOSE} CACHE STRING "Current log level" FORCE)
    elseif("${LOG_LEVEL}" STREQUAL "DEBUG")
        set(LOG_LEVEL_INTERNAL ${LOG_LEVEL_DEBUG} CACHE STRING "Current log level" FORCE)
    elseif("${LOG_LEVEL}" STREQUAL "TRACE")
        set(LOG_LEVEL_INTERNAL ${LOG_LEVEL_TRACE} CACHE STRING "Current log level" FORCE)
    else()
        message(FATAL "Unsupported log level: ${LOG_LEVEL}")
    
    endif()
    
endif()

########################################################################

function(logInternal LEVEL MODE PATH  TXT)
    if (${LEVEL} LESS_EQUAL ${LOG_LEVEL_INTERNAL})
        file(RELATIVE_PATH REL_PATH "${CMAKE_SOURCE_DIR}" "${PATH}")
        message(${MODE} "${REL_PATH}: ${TXT}")
    endif()
endfunction()

macro(logError TXT)
    logInternal(LOG_LEVEL_ERROR FATAL "${CMAKE_CURRENT_LIST_FILE}" "${TXT}")
endmacro()

macro(logWarning TXT)
    logInternal(LOG_LEVEL_WARNING STATUS "${CMAKE_CURRENT_LIST_FILE}" "${TXT}")
endmacro()

macro(logNotice TXT)
    logInternal(LOG_LEVEL_NOTICE STATUS "${CMAKE_CURRENT_LIST_FILE}" "${TXT}")
endmacro()

macro(logStatus TXT)
    logInternal(LOG_LEVEL_STATUS STATUS "${CMAKE_CURRENT_LIST_FILE}" "${TXT}")
endmacro()

macro(logVerbose TXT)
    logInternal(LOG_LEVEL_VERBOSE STATUS "${CMAKE_CURRENT_LIST_FILE}" "${TXT}")
endmacro()

macro(logDebug TXT)
    logInternal(LOG_LEVEL_DEBUG STATUS "${CMAKE_CURRENT_LIST_FILE}" "${TXT}")
endmacro()

macro(logInfo TXT)
    logInternal(LOG_LEVEL_INFO STATUS "${CMAKE_CURRENT_LIST_FILE}" "${TXT}")
endmacro()





########################################################################
# EXAMPLE:  logLineWarning(${CMAKE_CURRENT_LIST_LINE} "abc")


function(logLineInternal LEVEL MODE PATH LINE TXT)
    if (${LEVEL} LESS_EQUAL ${LOG_LEVEL_INTERNAL})
        file(RELATIVE_PATH REL_PATH "${CMAKE_SOURCE_DIR}" "${PATH}")
        message(${MODE} "${REL_PATH}:${LINE}: ${TXT}")
    endif()
endfunction()


macro(logLineError LINE TXT)
    logLineInternal(LOG_LEVEL_ERROR FATAL "${CMAKE_CURRENT_LIST_FILE}" "${LINE}" "${TXT}")
endmacro()

macro(logLineWarning LINE TXT)
    logLineInternal(LOG_LEVEL_WARNING STATUS "${CMAKE_CURRENT_LIST_FILE}" "${LINE}" "${TXT}")
endmacro()

macro(logLineNotice LINE TXT)
    logLineInternal(LOG_LEVEL_NOTICE STATUS "${CMAKE_CURRENT_LIST_FILE}" "${LINE}" "${TXT}")
endmacro()

macro(logLineStatus LINE TXT)
    logLineInternal(LOG_LEVEL_STATUS STATUS "${CMAKE_CURRENT_LIST_FILE}" "${LINE}" "${TXT}")
endmacro()

macro(logLineVerbose LINE TXT)
    logLineInternal(LOG_LEVEL_VERBOSE STATUS "${CMAKE_CURRENT_LIST_FILE}" "${LINE}" "${TXT}")
endmacro()

macro(logLineDebug LINE TXT)
    logLineInternal(LOG_LEVEL_DEBUG STATUS "${CMAKE_CURRENT_LIST_FILE}" "${LINE}" "${TXT}")
endmacro()

macro(logLineInfo LINE TXT)
    logLineInternal(LOG_LEVEL_INFO STATUS "${CMAKE_CURRENT_LIST_FILE}" "${LINE}" "${TXT}")
endmacro()
