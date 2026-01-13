#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Returns attack data for GPS guided bomb
 *
 * Arguments:
 * None
 *
 * Return Value:
 * <ARRAY>
 *
 * Example:
 * [] call ace_missileguidance_fnc_gps_getAttackData
 *
 * Public: No
 */

if (GVAR(gps_mode) isEqualTo "too") then {
    private _target = getPilotCameraTarget (vehicle focusOn);
    _target params ["_tracking", "_position", "_object"];
    if (driver (vehicle focusOn) isNotEqualTo focusOn) then {
        _position = (vehicle focusOn) lockedCameraTo [focusOn call cba_fnc_turretpath];
    };
    GVAR(gps_currentSettings) set [0, _position]
};

// create a copy of this array to make sure values are not overwritten
+GVAR(gps_currentSettings)  // return

