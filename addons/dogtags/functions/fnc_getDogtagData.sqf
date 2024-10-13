#include "..\script_component.hpp"
/*
 * Author: esteldunedain
 * Gets unit's dog tag data.
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * Dog tag Data <ARRAY>
 * 0: Name <STRING>
 * 1: SSN <STRING>
 * 2: Blood Type <STRING>
 *
 * Example:
 * player call ace_dogtags_fnc_getDogtagData
 *
 * Public: No
 */

params ["_target"];

// Check if the data was already created
private _dogtagData = _target getVariable QGVAR(dogtagData);

if (!isNil "_dogtagData") exitWith {_dogtagData};

// Create dog tag data once for the unit: nickname, code (eg. 135-13-900) and blood type
private _targetName = [_target, false, true] call EFUNC(common,getName);

private _dogtagData = [
    _targetName,
    _targetName call FUNC(ssn),
    _targetName call FUNC(bloodType)
];

// Store it
_target setVariable [QGVAR(dogtagData), _dogtagData, true];

_dogtagData
