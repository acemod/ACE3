cmake_minimum_required (VERSION 3.0)

set(ACE_EXTENSION_NAME "ace_wind_deflection")


if(CMAKE_COMPILER_IS_GNUCXX)
	# This target defaults to 32-bit on linux
	SET(CMAKE_CXX_FLAGS "-std=c++11 -march=i686 -m32 -O2 -s -fPIC -fpermissive")

	if(ACRE_LINK_TYPE STREQUAL "static")
		set(CMAKE_FIND_LIBRARY_SUFFIXES ".a")
		set(CMAKE_SHARED_LINKER_FLAGS "-static-libgcc -static-libstdc++")
	endif()
elseif(MSVC)
	if(ACRE_LINK_TYPE STREQUAL "static")
		set(CMAKE_CXX_FLAGS_DEBUG "/D _DEBUG /MTd /Zi /Ob0 /Od /RTC1" PARENT_SCOPE)
		set(CMAKE_CXX_FLAGS_MINSIZEREL     "/MT /O1 /Ob1 /D NDEBUG" PARENT_SCOPE)
		set(CMAKE_CXX_FLAGS_RELEASE       "/MT /O2 /Ob2 /D NDEBUG" PARENT_SCOPE)
		set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "/MT /Zi /O2 /Ob1 /D NDEBUG" PARENT_SCOPE)
	else()
		set(CMAKE_CXX_FLAGS_DEBUG "/D _DEBUG /MDd /Zi /Ob0 /Od /RTC1" PARENT_SCOPE)
		set(CMAKE_CXX_FLAGS_MINSIZEREL     "/MD /O1 /Ob1 /D NDEBUG" PARENT_SCOPE)
		set(CMAKE_CXX_FLAGS_RELEASE       "/MD /O2 /Ob2 /D NDEBUG" PARENT_SCOPE)
		set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "/MD /Zi /O2 /Ob1 /D NDEBUG" PARENT_SCOPE)
	endif()

	set(CMAKE_EXE_LINKER_FLAGS_DEBUG "${CMAKE_EXE_LINKER_FLAGS_DEBUG} /NODEFAULTLIB:libcmt.lib")
	set(CMAKE_EXE_LINKER_FLAGS_MINSIZEREL "${CMAKE_EXE_LINKER_FLAGS_MINSIZEREL} /NODEFAULTLIB:libcmt.lib")
	set(CMAKE_EXE_LINKER_FLAGS_RELEASE "${CMAKE_EXE_LINKER_FLAGS_RELEASE} /NODEFAULTLIB:libcmt.lib")
	set(CMAKE_EXE_LINKER_FLAGS_RELWITHDEBINFO "${CMAKE_EXE_LINKER_FLAGS_RELWITHDEBINFO} /NODEFAULTLIB:libcmt.lib")
endif()

add_definitions(/DINTERCEPT_NO_THREAD_SAFETY)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}ace_wind_deflection")

file(GLOB SOURCES *.h *.hpp *.c *.cpp)
file(GLOB INTERCEPT_CLIENT_SOURCES  P:/z/intercept/src/client/intercept/*.h P:/z/intercept/src/client/intercept/*.hpp P:/z/intercept/src/client/intercept/*.c P:/z/intercept/src/client/intercept/*.cpp)
file(GLOB INTERCEPT_CLIENT_MAIN_SOURCES  P:/z/intercept/src/client/intercept/client/*.h P:/z/intercept/src/client/intercept/client/*.hpp P:/z/intercept/src/client/intercept/client/*.c P:/z/intercept/src/client/intercept/client/*.cpp)
file(GLOB INTERCEPT_CLIENT_SHARED_SOURCES  P:/z/intercept/src/client/intercept/shared/*.h P:/z/intercept/src/client/intercept/shared/*.hpp P:/z/intercept/src/client/intercept/shared/*.c P:/z/intercept/src/client/intercept/shared/*.cpp)
file(GLOB INTERCEPT_CLIENT_SQF_SHARED_SOURCES  P:/z/intercept/src/client/intercept/client/sqf/*.h P:/z/intercept/src/client/intercept/client/sqf/*.hpp P:/z/intercept/src/client/intercept/client/sqf/*.c P:/z/intercept/src/client/intercept/client/sqf/*.cpp)

SOURCE_GROUP("ace_wind_deflection" FILES ${SOURCES})
SOURCE_GROUP("intercept_includes" FILES ${INTERCEPT_CLIENT_SOURCES})
SOURCE_GROUP("intercept_includes\\client" FILES ${INTERCEPT_CLIENT_MAIN_SOURCES})
SOURCE_GROUP("intercept_includes\\shared" FILES ${INTERCEPT_CLIENT_SHARED_SOURCES})
SOURCE_GROUP("intercept_includes\\client\\sqf" FILES ${INTERCEPT_CLIENT_SQF_SHARED_SOURCES})





add_library( ${ACE_EXTENSION_NAME} SHARED ${SOURCES} ${INTERCEPT_CLIENT_SOURCES} ${INTERCEPT_CLIENT_SOURCES} ${INTERCEPT_CLIENT_MAIN_SOURCES} ${INTERCEPT_CLIENT_SHARED_SOURCES} ${INTERCEPT_CLIENT_SQF_SHARED_SOURCES})
include_directories(${CMAKE_CURRENT_SOURCE_DIR} "P:/z/intercept/src/client/intercept")

target_link_libraries(${ACE_EXTENSION_NAME} ${LINK_LIBS})
set_target_properties(${ACE_EXTENSION_NAME} PROPERTIES PREFIX "")
set_target_properties(${ACE_EXTENSION_NAME} PROPERTIES FOLDER Extensions)

if(CMAKE_COMPILER_IS_GNUCXX)
	set_target_properties(${ACE_EXTENSION_NAME} PROPERTIES LINK_SEARCH_START_STATIC 1)
	set_target_properties(${ACE_EXTENSION_NAME} PROPERTIES LINK_SEARCH_END_STATIC 1)
endif()
