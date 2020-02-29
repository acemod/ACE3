#define COMPONENT javelin
#define COMPONENT_BEAUTIFIED Javelin
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_JAVELIN
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_JAVELIN
    #define DEBUG_SETTINGS DEBUG_SETTINGS_JAVELIN
#endif

#include "\z\ace\addons\main\script_macros.hpp"


// Javelin IGUI defines
#define __JavelinIGUI (uinamespace getVariable "ACE_RscOptics_javelin")

// Custom controls
#define __JavelinIGUITargeting (__JavelinIGUI displayCtrl 6999)

#define __JavelinIGUISeek (__JavelinIGUI displayCtrl 699000)
#define __JavelinIGUITop (__JavelinIGUI displayCtrl 699001)
#define __JavelinIGUIDir (__JavelinIGUI displayCtrl 699002)

// Constrains
#define __JavelinIGUITargetingConstrains (__JavelinIGUI displayCtrl 699100)
#define __JavelinIGUITargetingConstrainTop (__JavelinIGUI displayCtrl 699101)
#define __JavelinIGUITargetingConstrainBottom (__JavelinIGUI displayCtrl 699102)
#define __JavelinIGUITargetingConstrainLeft (__JavelinIGUI displayCtrl 699103)
#define __JavelinIGUITargetingConstrainRight (__JavelinIGUI displayCtrl 699104)

// Targeting gate
#define __JavelinIGUITargetingGate (__JavelinIGUI displayCtrl 699200)
#define __JavelinIGUITargetingGateTL (__JavelinIGUI displayCtrl 699201)
#define __JavelinIGUITargetingGateTR (__JavelinIGUI displayCtrl 699202)
#define __JavelinIGUITargetingGateBL (__JavelinIGUI displayCtrl 699203)
#define __JavelinIGUITargetingGateBR (__JavelinIGUI displayCtrl 699204)

// Rangefinder
#define __JavelinIGUIRangefinder (__JavelinIGUI displayCtrl 151)

// Targeting lines
#define __JavelinIGUITargetingLines (__JavelinIGUI displayCtrl 699300)
#define __JavelinIGUITargetingLineH (__JavelinIGUI displayCtrl 699301)
#define __JavelinIGUITargetingLineV (__JavelinIGUI displayCtrl 699302)

#define __ConstraintTop (((ctrlPosition __JavelinIGUITargetingConstrainTop) select 1) + ((ctrlPosition (__JavelinIGUITargetingConstrainTop)) select 3))
#define __ConstraintBottom ((ctrlPosition __JavelinIGUITargetingConstrainBottom) select 1)
#define __ConstraintLeft (((ctrlPosition __JavelinIGUITargetingConstrainLeft) select 0) + ((ctrlPosition (__JavelinIGUITargetingConstrainLeft)) select 2))
#define __ConstraintRight ((ctrlPosition __JavelinIGUITargetingConstrainRight) select 0)

// Colors for controls
#define __ColorOrange [0.9255,0.5216,0.1216,1]
#define __ColorGreen [0.2941,0.8745,0.2157,1]
#define __ColorGray [0.2941,0.2941,0.2941,1]
#define __ColorNull [0,0,0,0]
