cmake_minimum_required (VERSION 3.16)
project (ACE)

set_property(GLOBAL PROPERTY USE_FOLDERS ON)

if(WIN32)
add_definitions(/DWINVER=0x0600 /D_WIN32_WINNT=0x0600)
endif()

if (NOT CMAKE_BUILD_TYPE AND CMAKE_COMPILER_IS_GNUCXX)
    message(STATUS "No build type selected, default to Debug")
    set(CMAKE_BUILD_TYPE "Debug")
endif()

option(USE_PCH "USE_PCH" ON)
option(USE_64BIT_BUILD "USE_64BIT_BUILD" OFF)
option(USE_STATIC_LINKING "USE_STATIC_LINKING" ON)

if(CMAKE_GENERATOR_PLATFORM MATCHES "x64")
    set(USE_64BIT_BUILD ON)
endif()

if(CMAKE_COMPILER_IS_GNUCXX)
    SET(CMAKE_CXX_FLAGS "-std=c++11 -pedantic -pedantic-errors -march=i686 -m32 -O2 -s -fPIC -fpermissive")
    set(CMAKE_FIND_LIBRARY_SUFFIXES ".a")
    set(CMAKE_SHARED_LINKER_FLAGS "-static-libgcc -static-libstdc++")
elseif (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    message(ERROR "SUPPORT NOT COMPLETE")
elseif (CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
    add_definitions(-D_CRT_SECURE_NO_WARNINGS) # Disable MSVC *_s function warnings

    if(USE_64BIT_BUILD)
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /W4 /Qpar-report:2") # Default SSE2
    else()
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /W4 /arch:SSE2 /Qpar-report:2")
    endif()

    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS} /D _DEBUG /MTd /Zi /Ob0 /Od /RTC1")
    set(CMAKE_CXX_FLAGS_MINSIZEREL     "${CMAKE_CXX_FLAGS} /MT /O1 /Ob1 /D NDEBUG")
    set(CMAKE_CXX_FLAGS_RELEASE       "${CMAKE_CXX_FLAGS} /MT /O2 /Ob2 /D NDEBUG")
    set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "${CMAKE_CXX_FLAGS} /MT /Zi /O2 /Ob1 /D NDEBUG")
endif()


include_directories("common")

string(TIMESTAMP ACE_BUILDSTAMP "%Y-%m-%dT%H:%M:%SZ")
file(READ "../addons/main/script_version.hpp" script_version)
string(REGEX MATCH "#define MAJOR ([0-9]*)" "x" outputX ${script_version})
set(ACE_VERSION_MAJOR ${CMAKE_MATCH_1})
string(REGEX MATCH "#define MINOR ([0-9]*)" "x" outputX ${script_version})
set(ACE_VERSION_MINOR ${CMAKE_MATCH_1})
string(REGEX MATCH "#define PATCHLVL ([0-9]*)" outputX ${script_version})
set(ACE_VERSION_REVISION ${CMAKE_MATCH_1})

EXECUTE_PROCESS(COMMAND git rev-parse --verify HEAD
    OUTPUT_VARIABLE T_ACE_VERSION_BUILD
    OUTPUT_STRIP_TRAILING_WHITESPACE
)
string(SUBSTRING ${T_ACE_VERSION_BUILD} 0 7 ACE_VERSION_BUILD )

message("Setting ACE Version: " ${ACE_VERSION_MAJOR}.${ACE_VERSION_MINOR}.${ACE_VERSION_REVISION}-${ACE_VERSION_BUILD})
configure_file(
    "${CMAKE_CURRENT_SOURCE_DIR}/common/ace_version.hpp.in"
    "${CMAKE_CURRENT_BINARY_DIR}/common/ace_version.hpp"
  @ONLY)
if(MSVC)
    configure_file(
        "${CMAKE_CURRENT_SOURCE_DIR}/common/ace_version_win32.rc.in"
        "${CMAKE_CURRENT_BINARY_DIR}/common/ace_version_win32.rc"
      @ONLY)
    set(GLOBAL_RC ${CMAKE_CURRENT_BINARY_DIR}/common/ace_version_win32.rc)
    set(GLOBAL_SOURCES ${GLOBAL_RC})
endif()

include_directories(${CMAKE_CURRENT_BINARY_DIR}/common)
add_subdirectory(common)

# Extensions
add_subdirectory(fcs)
add_subdirectory(break_line)
add_subdirectory(clipboard)
add_subdirectory(advanced_ballistics)
add_subdirectory(parse_imagepath)
add_subdirectory(artillerytables)
#add_subdirectory(medical) # After medical re-write this extension is no longer used

message("Build Type: ${CMAKE_BUILD_TYPE}")
