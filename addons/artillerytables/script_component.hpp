#define COMPONENT artillerytables
#define COMPONENT_BEAUTIFIED ArtilleryTables
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#include "\z\ace\addons\main\script_macros.hpp"


// This is a good fit for most large artillery, but a little low for lighter mortars
#define DEFAULT_AIR_FRICTION -0.00006
// Friction from the Mk6 Mortar module
#define MK6_AIR_FRICTION -0.0001

#define DEGTOMILS 17.7777778
#define RADTOMILS 1018.59164 //converts from geometric radians (2pi) to 6400 mils;

#define IDC_MODECONTROLGROUP 1000
#define IDC_CHARGE 1001
#define IDC_AZIMUTH 1002
#define IDC_ELEVATION 1003

#define IDC_TABLE 2001
#define IDC_CHARGELIST 2002
#define IDC_BUTTON_ELEV_HIGH 2003
#define IDC_BUTTON_ELEV_LOW 2004
