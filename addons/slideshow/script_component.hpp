#define COMPONENT slideshow
#include "\z\ace\addons\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_SLIDESHOW
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_SLIDESHOW
    #define DEBUG_SETTINGS DEBUG_SETTINGS_SLIDESHOW
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define CLASSNAMES_OBJECTS "Land_MapBoard_F"
#define CLASSNAMES_BOTH "Land_Laptop_unfolded_F", "Land_Laptop_device_F", "Land_PCSet_01_screen_F", "Land_FlatTV_01_F"
#define CLASSNAMES_CONTROLLERS "Land_HandyCam_F", "Land_MobilePhone_smart_F", "Land_Tablet_01_F", "Land_PCSet_01_keyboard_F", "Land_PCSet_01_mouse_F", "Land_GamingSet_01_controller_F"
