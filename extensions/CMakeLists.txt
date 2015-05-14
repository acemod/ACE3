cmake_minimum_required (VERSION 3.0)
project (ACE)

if (NOT CMAKE_BUILD_TYPE AND CMAKE_COMPILER_IS_GNUCXX)
	message(STATUS "No build type selected, default to Debug")
	set(CMAKE_BUILD_TYPE "Debug")
endif()

option(USE_64BIT_BUILD "USE_64BIT_BUILD" OFF)
option(USE_STATIC_LINKING "USE_STATIC_LINKING" ON)


if(CMAKE_COMPILER_IS_GNUCXX)
	SET(CMAKE_CXX_FLAGS "-std=c++11 -march=i686 -m32 -O2 -s -fPIC -fpermissive")
	set(CMAKE_FIND_LIBRARY_SUFFIXES ".a")
	set(CMAKE_SHARED_LINKER_FLAGS "-static-libgcc -static-libstdc++")
else()
	set(CMAKE_CXX_FLAGS_DEBUG "/D _DEBUG /MTd /Zi /Ob0 /Od /RTC1")
	set(CMAKE_CXX_FLAGS_MINSIZEREL     "/MT /O1 /Ob1 /D NDEBUG")
	set(CMAKE_CXX_FLAGS_RELEASE       "/MT /O2 /Ob2 /D NDEBUG")
	set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "/MT /Zi /O2 /Ob1 /D NDEBUG")
endif()

file(GLOB ACE_COMMON_SOURCES common/*.h common/*.hpp common/*.c common/*.cpp)
add_library(ace_common STATIC ${ACE_COMMON_SOURCES})
include_directories(AFTER "common")

string(TIMESTAMP ACE_BUILDSTAMP "%Y-%m-%dT%H:%M:%SZ")
set(ACE_VERSION_MAJOR 3)
set(ACE_VERSION_MINOR 0)
set(ACE_VERSION_REVISION 1)
EXECUTE_PROCESS(COMMAND git rev-parse --verify HEAD
    OUTPUT_VARIABLE T_ACE_VERSION_BUILD
    OUTPUT_STRIP_TRAILING_WHITESPACE
)
string(SUBSTRING ${T_ACE_VERSION_BUILD} 0 7 ACE_VERSION_BUILD )

message("Building for: " ${ACE_VERSION_MAJOR}.${ACE_VERSION_MINOR}.${ACE_VERSION_REVISION}-${ACE_VERSION_BUILD})

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
endif()

include_directories(AFTER ${CMAKE_CURRENT_BINARY_DIR}/common)
set(GLOBAL_SOURCES ${GLOBAL_RC})

# Add extensions to build here
add_subdirectory(fcs)
add_subdirectory(break_line)
add_subdirectory(clipboard)
add_subdirectory(advanced_ballistics)

message("Build Type: ${CMAKE_BUILD_TYPE}")