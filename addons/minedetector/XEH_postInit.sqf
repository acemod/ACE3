#include "script_component.hpp"

// Create a dictionary to store detector configs
GVAR(detectorConfigs) = createHashMap;

[QGVAR(enableDetector), LINKFUNC(enableDetector)] call CBA_fnc_addEventHandler;
[QGVAR(disableDetector), LINKFUNC(disableDetector)] call CBA_fnc_addEventHandler;

// Shows detector and mine posistions in 3d when debug is on
#ifdef DEBUG_MODE_FULL
GVAR(debugDetector) = [];
addMissionEventHandler ["Draw3D", {
    if (GVAR(debugDetector) isEqualTo []) exitWith {};
    GVAR(debugDetector) params ["_detectorPointAGL", "_mines"];
    drawIcon3D ["\A3\ui_f\data\map\markers\military\dot_CA.paa", [0,0,1,1], _detectorPointAGL, 1, 1, 0, "detector", 1, 0.02, "PuristaMedium"];
    {
        private _name = format ["%1@%2", typeOf _x, (floor ((_x distance _detectorPointAGL) * 10)) / 10];
        if ((getNumber (configOf _x >> QGVAR(detectable))) == 1) then {
            drawIcon3D ["\A3\ui_f\data\map\markers\military\dot_CA.paa", [1,0,0,1], (ASLtoAGL (getPosASL _x)), 1, 1, 0, _name, 1, 0.02, "PuristaMedium"];
        } else {
            drawIcon3D ["\A3\ui_f\data\map\markers\military\dot_CA.paa", [1,1,0,1], (ASLtoAGL (getPosASL _x)), 1, 1, 0, _name, 1, 0.02, "PuristaMedium"];
        };
    } forEach _mines;
}];
#endif
