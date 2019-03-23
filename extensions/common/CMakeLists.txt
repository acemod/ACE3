file(GLOB_RECURSE ACE_COMMON_SOURCES *.h *.hpp *.c *.cpp)


file(GLOB ACE_BASE_COMMON_SOURCES *.h *.hpp *.c *.cpp)
#file(GLOB ACE_P3D_SOURCES  p3d/*.h p3d/*.hpp p3d/*.c p3d/*.cpp)
#file(GLOB ACE_PBO_SOURCES  pbo/*.h pbo/*.hpp pbo/*.c pbo/*.cpp)
#file(GLOB ACE_SIMULATION_SOURCES simulation/*.h simulation/*.hpp simulation/*.c simulation/*.cpp)
#file(GLOB ACE_DIRECTX_SOURCES directx/*.h directx/*.hpp directx/*.c directx/*.cpp)
#file(GLOB ACE_GLM_SOURCES glm/*.h glm/*.hpp glm/*.c glm/*.cpp)

SOURCE_GROUP("common" FILES ${ACE_BASE_COMMON_SOURCES})
#SOURCE_GROUP("p3d" FILES ${ACE_P3D_SOURCES})
#SOURCE_GROUP("pbo" FILES ${ACE_PBO_SOURCES})
#SOURCE_GROUP("simulation" FILES ${ACE_SIMULATION_SOURCES})
#SOURCE_GROUP("directx" FILES ${ACE_DIRECTX_SOURCES})
#SOURCE_GROUP("glm" FILES ${ACE_GLM_SOURCES})

add_library(ace_common STATIC ${ACE_GLM_SOURCES} ${ACE_BASE_COMMON_SOURCES} ${ACE_P3D_SOURCES} ${ACE_PBO_SOURCES} ${ACE_SIMULATION_SOURCES} ${ACE_DIRECTX_SOURCES})
