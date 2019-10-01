set(ACE_EXTENSION_NAME "ace_artillerytables")

file(GLOB SOURCES *.h *.hpp *.c *.cpp)
add_library( ${ACE_EXTENSION_NAME} SHARED ${SOURCES} ${GLOBAL_SOURCES})
target_link_libraries(${ACE_EXTENSION_NAME} ace_common)
set_target_properties(${ACE_EXTENSION_NAME} PROPERTIES PREFIX "")
set_target_properties(${ACE_EXTENSION_NAME} PROPERTIES FOLDER Extensions)

if(CMAKE_COMPILER_IS_GNUCXX)
	set_target_properties(${ACE_EXTENSION_NAME} PROPERTIES LINK_SEARCH_START_STATIC 1)
	set_target_properties(${ACE_EXTENSION_NAME} PROPERTIES LINK_SEARCH_END_STATIC 1)
endif()



# enable_testing()
# set(ACE_TEST_NAME Test_${ACE_EXTENSION_NAME})

# add_executable(${ACE_TEST_NAME} tests/tester.cpp ${SOURCES})
# target_link_libraries(${ACE_TEST_NAME} ace_common)
# target_link_libraries(${ACE_TEST_NAME} ${ACE_EXTENSION_NAME})
# target_link_libraries(${ACE_TEST_NAME} gtest_main)
# add_test(${ACE_TEST_NAME} ${ACE_TEST_NAME})
# set_target_properties(${ACE_TEST_NAME} PROPERTIES FOLDER Tests)
