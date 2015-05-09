file(GLOB_RECURSE SOURCES *.h *.hpp *.c *.cpp)


add_library(directxtk STATIC ${SOURCES})
target_include_directories(directxtk PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})