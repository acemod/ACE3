#include "script_component.hpp"

//#include "initKeybinds.sqf"

GVAR(Kestrel4500_Menus) = ["Direction", "Wind SPD  m/s", "CROSSWIND m/s", "HEADWIND  m/s", "TEMP       °C", "HUMIDITY    %", "BARO      hPA", "ALTITUDE    m", "User Screen   1", "User Screen   2"];

GVAR(Kestrel4500_TOTAL) = [0, 0, 0, 0, 0, 0, 0, 0];
GVAR(Kestrel4500_ENTRIES) = [0, 0, 0, 0, 0, 0, 0, 0];

GVAR(Kestrel4500_MinAvgMax) = false;
GVAR(Kestrel4500_MinAvgMaxMode) = 0;

GVAR(Kestrel4500_Menu) = 1;
GVAR(Kestrel4500_Directions) = ["N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"];
GVAR(Kestrel4500_Direction) = 0;

GVAR(Kestrel4500_RefHeading) = 0;

GVAR(Kestrel4500) = false;
GVAR(Kestrel4500_Overlay) = false;
GVAR(Kestrel4500_OverlayStart) = diag_tickTime;
