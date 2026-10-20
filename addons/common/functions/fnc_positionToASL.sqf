#include "..\script_component.hpp"
/*
 * Author: esteldunedain
 * Converts Arma "Position" to ASL
 *
 * Arguments:
 * 0: Position x <NUMBER>
 * 1: Position y <NUMBER>
 * 2: Position z <NUMBER>
 *
 * Return Value:
 * PosASL <ARRAY>
 *
 * Example:
 * [1, 1, 1] call ace_common_fnc_positionToASL
 *
 * Public: Yes
 */

if (surfaceIsWater _this) then {
    _this
} else {
    ATLToASL _this
};
