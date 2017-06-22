set(ACE_EXTENSION_NAME "ace_fcs")

file(GLOB SOURCES *.h *.hpp *.c *.cpp)
add_library( ${ACE_EXTENSION_NAME} SHARED ${SOURCES} ${GLOBAL_SOURCES})
target_link_libraries(${ACE_EXTENSION_NAME} ace_common)
set_target_properties(${ACE_EXTENSION_NAME} PROPERTIES PREFIX "")
set_target_properties(${ACE_EXTENSION_NAME} PROPERTIES FOLDER Extensions)

if(CMAKE_COMPILER_IS_GNUCXX)
	set_target_properties(${ACE_EXTENSION_NAME} PROPERTIES LINK_SEARCH_START_STATIC 1)
	set_target_properties(${ACE_EXTENSION_NAME} PROPERTIES LINK_SEARCH_END_STATIC 1)
endif()