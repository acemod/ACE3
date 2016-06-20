/*
 * Author: esteldunedain
 * Get unit dogtag data
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_target"];

// Check if the data was already created
private _dogTagData = _target getVariable QGVAR(dogtagData);
if (!isNil "_dogTagData") exitWith {_dogTagData};

// Create dog tag data once for the unit: nickname, code (eg. 135-13-900) and blood type
private ["_bloodTypeIndex", "_code"];
if !(getplayeruid _target in ["", "_SP_AI_", "_SP_PLAYER_"]) then {
    _bloodTypeIndex = (parseNumber ((getPlayerUID _target) select [0, 5])) mod 8;
    _code = (getplayeruid _target) select [0, 3] + "-" +
            (getplayeruid _target) select [3, 2] + "-" +
            (getplayeruid _target) select [5, 3];
} else {
    _bloodTypeIndex = floor random 8;
    _code = str(floor random 9) + str(floor random 9) + str(floor random 9) + "-" +
            str(floor random 9) + str(floor random 9) + "-" +
            str(floor random 9) + str(floor random 9) + str(floor random 9);
};
private _dogTagData = [
    [_target, false, true] call EFUNC(common,getName),
    _code,
    ["O POS", "O NEG", "A POS", "A NEG", "B POS", "B NEG",
        "AB POS", "AB NEG"] select _bloodTypeIndex
];
// Store it
_target setVariable [QGVAR(dogtagData), _dogTagData, true];
_dogTagData
