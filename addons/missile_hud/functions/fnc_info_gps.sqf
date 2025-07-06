#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Generates HUD info for GPS seeker.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Element array <ARRAY>
 *
 * Example:
 * [["TEXT", "My Test", [1, 0.4, 5]]] call ace_missile_hud_fnc_info_gps
 *
 * Public: No
 */

// params ["_idleText", "_lockedText", "_unit", "_vehicle", "_ammoConfig"];

private _output = [["TEXT", "GPS", [1, 1, 1]]];

([] call EFUNC(missileguidance,gps_getAttackData)) params [["_position", [0,0,0]]];
if (_position isNotEqualTo [0,0,0]) then {
    ([_position] call EFUNC(common,getMapGridFromPos)) params ["_easting", "_northing"];
    _output pushBack ["TEXT", format ["%1 %2", _easting, _northing], [1, 1, 1]];
} else {
    _output pushBack ["TEXT", "----- -----", [1, 1, 1]];
};

_output
