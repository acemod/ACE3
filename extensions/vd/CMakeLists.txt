set(ACE_EXTENSION_NAME "ace_vd")

file(GLOB SOURCES *.h *.hpp *.c *.cpp)
file(GLOB PENETRATION_SOURCES penetration/*.h penetration/*.hpp penetration/*.c penetration/*.cpp)
file(GLOB DAMAGE_SOURCES damage/*.h damage/*.hpp damage/*.c damage/*.cpp)

if(DEVEL AND USE_DIRECTX)
    file(GLOB DEBUG_SOURCES debug/*.h debug/*.hpp debug/*.c debug/*.cpp)
endif()

SOURCE_GROUP("main" FILES ${SOURCES})
SOURCE_GROUP("debug" FILES ${DEBUG_SOURCES})
SOURCE_GROUP("penetration models" FILES ${PENETRATION_SOURCES})
SOURCE_GROUP("damage models" FILES ${DAMAGE_SOURCES})

add_library( ${ACE_EXTENSION_NAME} SHARED ${DEBUG_SOURCES} ${SOURCES} ${DAMAGE_SOURCES} ${PENETRATION_SOURCES} ${GLOBAL_SOURCES})
add_library( ${ACE_EXTENSION_NAME}_static STATIC ${DEBUG_SOURCES} ${SOURCES} ${DAMAGE_SOURCES} ${PENETRATION_SOURCES} ${GLOBAL_SOURCES})
include_directories(${CMAKE_CURRENT_SOURCE_DIR})

if(NOT USE_BULLET)
    message(FATAL_ERROR "Bullet is required for vehicle damage!\nYou need to build out the bullet3 folder and define -DUSE_BULLET=On")
endif()

if(DEVEL AND USE_DIRECTX)
   set(LINK_LIBS directxtk BulletDynamics BulletCollision LinaerMath ${DirectX_D3DX11_LIBRARY} ${DirectX_D3D11_LIBRARY} ${DirectX_D3D11_1_LIBRARY} ${DirectX_D3D11_2_LIBRARY})
else()
   set(LINK_LIBS BulletDynamics BulletCollision LinaerMath)
endif()

target_link_libraries(${ACE_EXTENSION_NAME} ace_common ${LINK_LIBS})
set_target_properties(${ACE_EXTENSION_NAME} PROPERTIES PREFIX "")
#set_target_properties(${ACE_EXTENSION_NAME} PROPERTIES COMPILE_DEFINITIONS _DLL)
set_target_properties(${ACE_EXTENSION_NAME} PROPERTIES FOLDER vehicledamage)

target_link_libraries(${ACE_EXTENSION_NAME}_static ace_common ${LINK_LIBS})
set_target_properties(${ACE_EXTENSION_NAME}_static PROPERTIES PREFIX "")
set_target_properties(${ACE_EXTENSION_NAME}_static PROPERTIES COMPILE_DEFINITIONS _STATIC)
set_target_properties(${ACE_EXTENSION_NAME}_static PROPERTIES FOLDER vehicledamage)

if(CMAKE_COMPILER_IS_GNUCXX)
	set_target_properties(${ACE_EXTENSION_NAME} PROPERTIES LINK_SEARCH_START_STATIC 1)
	set_target_properties(${ACE_EXTENSION_NAME} PROPERTIES LINK_SEARCH_END_STATIC 1)
    	set_target_properties(${ACE_EXTENSION_NAME}_static PROPERTIES LINK_SEARCH_START_STATIC 1)
	set_target_properties(${ACE_EXTENSION_NAME}_static PROPERTIES LINK_SEARCH_END_STATIC 1)
endif()
