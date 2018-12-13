cmake_minimum_required (VERSION 3.0)
project (ACE)

set_property(GLOBAL PROPERTY USE_FOLDERS ON)

if(WIN32)
add_definitions(/DWINVER=0x0600 /D_WIN32_WINNT=0x0600)
endif()

if (NOT CMAKE_BUILD_TYPE AND CMAKE_COMPILER_IS_GNUCXX)
	message(STATUS "No build type selected, default to Debug")
	set(CMAKE_BUILD_TYPE "Debug")
endif()

option(DEVEL "DEVEL" OFF)
option(USE_BULLET "USE_BULLET" OFF)
option(USE_DIRECTX "USE_DIRECTX" OFF)
option(USE_64BIT_BUILD "USE_64BIT_BUILD" OFF)
option(USE_STATIC_LINKING "USE_STATIC_LINKING" ON)


if(CMAKE_COMPILER_IS_GNUCXX)
	SET(CMAKE_CXX_FLAGS "-std=c++11 -pedantic -pedantic-errors -march=i686 -m32 -O2 -s -fPIC -fpermissive")
	set(CMAKE_FIND_LIBRARY_SUFFIXES ".a")
	set(CMAKE_SHARED_LINKER_FLAGS "-static-libgcc -static-libstdc++")
elseif (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    message(ERROR "SUPPORT NOT COMPLETE")
elseif (CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /W4 /arch:SSE2 /Qpar-report:2")
	set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS} /D _DEBUG /MTd /Zi /Ob0 /Od /RTC1")
	set(CMAKE_CXX_FLAGS_MINSIZEREL     "${CMAKE_CXX_FLAGS} /MT /O1 /Ob1 /D NDEBUG")
	set(CMAKE_CXX_FLAGS_RELEASE       "${CMAKE_CXX_FLAGS} /MT /O2 /Ob2 /D NDEBUG")
	set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "${CMAKE_CXX_FLAGS} /MT /Zi /O2 /Ob1 /D NDEBUG")
endif()

include_directories("common")

if(USE_BULLET)
    # Dependencies
    #
    set(BACKUP_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
    set(BACKUP_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
    set(BACKUP_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})

    add_definitions(-DUSE_DIRECTX)
    add_subdirectory(lib/bullet3)

    set_target_properties(App_BasicExample PROPERTIES FOLDER Bullet3)
    set_target_properties(App_HelloWorld PROPERTIES FOLDER Bullet3)
    set_target_properties(App_ExampleBrowser PROPERTIES FOLDER Bullet3)
    set_target_properties(Bullet2FileLoader PROPERTIES FOLDER Bullet3)
    set_target_properties(Bullet3Collision PROPERTIES FOLDER Bullet3)
    set_target_properties(Bullet3Dynamics PROPERTIES FOLDER Bullet3)
    set_target_properties(Bullet3Geometry PROPERTIES FOLDER Bullet3)
    set_target_properties(Bullet3Common PROPERTIES FOLDER Bullet3)
    set_target_properties(Bullet3OpenCL_clew PROPERTIES FOLDER Bullet3)
    set_target_properties(BulletCollision PROPERTIES FOLDER Bullet3)
    set_target_properties(BulletDynamics PROPERTIES FOLDER Bullet3)
    set_target_properties(BulletFileLoader PROPERTIES FOLDER Bullet3)
    set_target_properties(BulletSoftBody PROPERTIES FOLDER Bullet3)

    set_target_properties(BulletWorldImporter PROPERTIES FOLDER Bullet3)
    set_target_properties(BulletXmlWorldImporter PROPERTIES FOLDER Bullet3)
    set_target_properties(ConvexDecomposition PROPERTIES FOLDER Bullet3)
    set_target_properties(GIMPACTUtils PROPERTIES FOLDER Bullet3)
    set_target_properties(gtest PROPERTIES FOLDER Bullet3)
    set_target_properties(gwen PROPERTIES FOLDER Bullet3)
    set_target_properties(HACD PROPERTIES FOLDER Bullet3)
    set_target_properties(OpenGLWindow PROPERTIES FOLDER Bullet3)
    set_target_properties(LinearMath PROPERTIES FOLDER Bullet3)

    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${BACKUP_ARCHIVE_OUTPUT_DIRECTORY})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${BACKUP_LIBRARY_OUTPUT_DIRECTORY})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${BACKUP_RUNTIME_OUTPUT_DIRECTORY})

    include_directories(BEFORE "lib/bullet3/src")
endif()
if(USE_DIRECTX)
    add_definitions(-DUSE_DIRECTX)
    set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake ${CMAKE_MODULE_PATH})
    find_package (DirectX)
    link_directories (BEFORE ${DirectX_D3DX11_LIBRARY})
    include_directories (BEFORE ${DirectX_D3DX11_INCLUDE_DIR} )
endif()
if(DEVEL)
    add_definitions(-DDEVEL)
endif()


string(TIMESTAMP ACE_BUILDSTAMP "%Y-%m-%dT%H:%M:%SZ")
set(ACE_VERSION_MAJOR 3)
set(ACE_VERSION_MINOR 12)
set(ACE_VERSION_REVISION 3)
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

include_directories(${CMAKE_CURRENT_BINARY_DIR}/common)
set(GLOBAL_SOURCES ${GLOBAL_RC})


# Add extensions to build here
add_subdirectory(common)

# Extensions

add_subdirectory(fcs)
add_subdirectory(break_line)
add_subdirectory(clipboard)
add_subdirectory(advanced_ballistics)
add_subdirectory(medical)
add_subdirectory(parse_imagepath)

# Test Extension for dynamically loading/unloading built extensions; does not build in release
if (DEVEL)
    add_subdirectory(dynload)
    add_subdirectory(tests)
    if(USE_DIRECTX)
        add_subdirectory(lib/directxtk)
    endif()
endif()



message("Build Type: ${CMAKE_BUILD_TYPE}")
