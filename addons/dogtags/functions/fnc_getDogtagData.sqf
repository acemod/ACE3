/*
 * Author: esteldunedain
 * Get unit dogtag data.
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * Dogtag Data <ARRAY>
 * 0: Name <STRING>
 * 1: SSN <STRING>
 * 2: Blood Type <STRING>
 *
 * Example:
 * _dogtagData = [unit, player] call ace_dogtags_fnc_getDogtagData
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_target"];

// Check if the data was already created
private _dogTagData = _target getVariable QGVAR(dogtagData);
if (!isNil "_dogTagData") exitWith {_dogTagData};

// Create dog tag data once for the unit: nickname, code (eg. 135-13-900) and blood type
private _targetName = [_target, false, true] call EFUNC(common,getName);

private _dogTagData = [
    _targetName,
    _targetName call FUNC(ssn),
    _targetName call FUNC(bloodType)
];
// Store it
_target setVariable [QGVAR(dogtagData), _dogTagData, true];
_dogTagData
