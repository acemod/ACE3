#include "script_component.hpp"

// Create a dictionary to store detector configs
GVAR(detectorConfigs) = createHashMap;

// Shows detector and mine posistions in 3d when debug is on
#ifdef DEBUG_MODE_FULL
GVAR(debugDetector) = [];

addMissionEventHandler ["Draw3D", {
    if (GVAR(debugDetector) isEqualTo []) exitWith {};

    GVAR(debugDetector) params ["_detectorPointAGL", "_mines"];

    drawIcon3D ["\A3\ui_f\data\map\markers\military\dot_CA.paa", [0, 0, 1, 1], _detectorPointAGL, 1, 1, 0, "detector", 1, 0.02, "PuristaMedium"];

    {
        private _name = format ["%1@%2", typeOf _x, (floor ((_x distance _detectorPointAGL) * 10)) / 10];

        drawIcon3D ["\A3\ui_f\data\map\markers\military\dot_CA.paa", [[1, 1, 0, 1], [1, 0, 0, 1]] select (getNumber (configOf _x >> QGVAR(detectable)) == 1), ASLToAGL (getPosASL _x), 1, 1, 0, _name, 1, 0.02, "PuristaMedium"];
    } forEach _mines;
}];
#endif
