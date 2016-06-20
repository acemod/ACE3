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
//hint getplayeruid _target;
if ((typename getplayeruid _target) == "SCALAR") then {
    _bloodTypeIndex = (getplayeruid _target) mod 8;
    _code = (str getplayeruid _target) select [0, 3] + "-" +
            (str getplayeruid _target) select [3, 2] + "-" +
            (str getplayeruid _target) select [5, 3];
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
