#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Slews turret to target pos and shows visual feedback
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Turret (will be local) <ARRAY>
 * 2: Look PosASL <ARRAY>
 * 3: Override <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle, [0], [0,0,0], true] call ace_hunterkiller_fnc_slew
 *
 * Public: No
 */

params ["_vehicle", "_turret", "_posASL", "_isOverride"];
TRACE_4("slew",_vehicle,_turret,_posASL,_isOverride);

_vehicle lockCameraTo [_posASL, _turret, true];

if (hasInterface && {(_vehicle turretUnit _turret) isEqualTo ace_player}) then {
    private _displayText = if (_isOverride) then { LLSTRING(override) } else { LLSTRING(observe) };
    QGVAR(text) cutText [format ["<br/><br/><br/><br/><br/><t color='#ff0000' size='1.25'>[%1]</t>", _displayText], "PLAIN", -1, false, true];
    [{
        QGVAR(text) cutText ["", "PLAIN"];
    }, [], 1] call CBA_fnc_waitAndExecute;
};
