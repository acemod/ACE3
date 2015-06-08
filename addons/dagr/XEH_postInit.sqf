#include "script_component.hpp"

DAGR_RUN = false;
DAGR_MENU_RUN = false;
DAGR_DIRECTION = true; // true -> degrees; false -> milliradian
DAGR_GRID_VECTOR = "00000000"; // Default

DAGR_WP_NUM = 0;  // Number of WPs entered into DAGR
DAGR_WP0_String = "";  // Presets all WPs to empty
DAGR_WP1_String = "";
DAGR_WP2_String = "";
DAGR_WP3_String = "";
DAGR_WP4_String = "";
DAGR_WP0 = 0;
DAGR_WP1 = 0;
DAGR_WP2 = 0;
DAGR_WP3 = 0;
DAGR_WP4 = 0;
DAGR_UPDATE_INTERVAL = 0.5;   // Update timer on DAGR, set for 0.5 seconds
DAGR_EMPTY_VECTOR = true;  // Keeps DAGR Vector display from filling up before use

DAGR_DISPLAY_SELECTION = "DATA"; // Sets DAGR for data display

DAGR_NO_DISPLAY = true;

["RangerfinderData", {_this call FUNC(DAGR_VECTOR)}] call EFUNC(common,addEventHandler);
