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
    private _focusOn = focusOn;
    private _vehFocusOn = vehicle _focusOn;
    private _target = getPilotCameraTarget _vehFocusOn;
    _target params ["_tracking", "_position", "_object"];
    if (driver _vehFocusOn isNotEqualTo _focusOn) then {
        _position = _vehFocusOn lockedCameraTo [focusOn call CBA_fnc_turretPath];
        if (_position isEqualType objNull) then { // lockedCameraTo has different return types, can be object as well as position.
            _position = getPosASL _position;
        } else {
            if isNil "_position" then { // lockedCameraTo can return nil if the camera is not locked
                _position = [0,0,0];
            };
        };
    };
    GVAR(gps_currentSettings) set [0, _position]
};

// create a copy of this array to make sure values are not overwritten
+GVAR(gps_currentSettings)  // return

