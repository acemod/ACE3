private ["_temperature", "_barometricPressure", "_altitude"];

cse_ab_Kestrel4500_Menus = ["Direction", "Wind SPD  m/s", "CROSSWIND m/s", "HEADWIND  m/s", "TEMP       °C", "HUMIDITY    %", "BARO      hPA", "ALTITUDE    m", "User Screen   1", "User Screen   2"];

cse_ab_Kestrel4500_TOTAL = [0, 0, 0, 0, 0, 0, 0, 0];
cse_ab_Kestrel4500_ENTRIES = [0, 0, 0, 0, 0, 0, 0, 0];

cse_ab_Kestrel4500_MinAvgMax = false;
cse_ab_Kestrel4500_MinAvgMaxMode = 0;

cse_ab_Kestrel4500_Menu = 1;
cse_ab_Kestrel4500_Directions = ["N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"];
cse_ab_Kestrel4500_Direction = 0;

cse_ab_Kestrel4500_RefHeading = 0;

cse_ab_Kestrel4500 = false;
cse_ab_Kestrel4500_Overlay = false;
cse_ab_Kestrel4500_OverlayStart = diag_tickTime;
