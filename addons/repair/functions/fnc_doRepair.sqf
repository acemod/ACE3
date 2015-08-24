/*
 * Author: commy2
 * Called by repair action / progress bar. Raise events to set the new hitpoint damage.
 *
 * Arguments:
 * 0: Unit that does the repairing <OBJECT>
 * 1: Vehicle to repair <OBJECT>
 * 2: Selected hitpoint <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit, vehicle, "hitpoint"] call ace_repair_fnc_doRepair
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_vehicle", "_hitPoint"];
TRACE_3("params",_unit,_vehicle,_hitPoint);

// get current hitpoint damage
private "_hitPointDamage";
_hitPointDamage = _vehicle getHitPointDamage _hitPoint;

_hitPointDamage = _hitPointDamage - 0.5;
// don't use negative values for damage
_hitPointDamage = _hitPointDamage max ([_unit] call FUNC(getPostRepairDamage));

// raise event to set the new hitpoint damage
["setVehicleHitPointDamage", _vehicle, [_vehicle, _hitPoint, _hitPointDamage]] call EFUNC(common,targetEvent);

// display text message if enabled
if (GVAR(DisplayTextOnRepair)) then {
    private ["_text", "_toFind", "_combinedString"];

    // Prepare first part of the string from stringtable
    _text = LSTRING(Hit);

    // Remove "Hit" from hitpoint name if one exists
    _toFind = if (_x find "Hit" == 0) then {
        [_x, 3] call CBA_fnc_substr
    } else {
        _x
    };

    // Loop through always shorter part of the hitpoint name to find the string from stringtable
    for "_i" from 0 to (count _x) do {
        // Localize if localization found
        _combinedString = _text + _toFind;
        if (isLocalized _combinedString) exitWith {
            _text = format [localize ([LSTRING(RepairedHitPointFully), LSTRING(RepairedHitPointPartially)] select (_hitPointDamage > 0)), localize _combinedString];
        };

        // Cut off one character
        _toFind = [_toFind, 0, count _toFind - 1] call CBA_fnc_substr;
    };

    // Don't display part name if no string is found in stringtable
    if (_text == LSTRING(Hit)) then {
        _text = localize ([LSTRING(RepairedFully), LSTRING(RepairedPartially)] select (_hitPointDamage > 0));
    };

    // Display text
    [_text] call EFUNC(common,displayTextStructured);
};
