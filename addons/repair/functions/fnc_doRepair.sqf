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

private ["_hitPointDamage", "_text", "_hitpointGroup"];
params ["_unit", "_vehicle", "_hitPoint"];
TRACE_3("params",_unit,_vehicle,_hitPoint);

// get current hitpoint damage
_hitPointDamage = _vehicle getHitPointDamage _hitPoint;

_hitPointDamage = _hitPointDamage - 0.5;
// don't use negative values for damage
_hitPointDamage = _hitPointDamage max ([_unit] call FUNC(getPostRepairDamage));

// raise event to set the new hitpoint damage
["setVehicleHitPointDamage", _vehicle, [_vehicle, _hitPoint, _hitPointDamage]] call EFUNC(common,targetEvent);

// Repair the rest in the group (don't need to worry about specific damage as it's not checked)
_hitpointGroup = configFile >> "CfgVehicles" >> typeOf _vehicle >> QGVAR(hitpointGroup);
_hitpointGroup = if (isArray _hitpointGroup) then {getArray _hitpointGroup} else {[]};
if (count _hitpointGroup > 0) then {
    ([_vehicle] call EFUNC(common,getHitPointsWithSelections)) params ["_hitpoints"];
    _hitpointGroup deleteAt 0; // Remove main group hitpoint
    {
        if (_x in _hitpoints) then {
            _vehicle setHitPointDamage [_x, 0];
        } else {
            diag_log text format ["[ACE] ERROR: Invalid hitpoint %1 in hitpointGroup of %2", _x, _vehicle];
        };
    } forEach _hitpointGroup;
};

// display text message if enabled
if (GVAR(DisplayTextOnRepair)) then {
    _text = format ["STR_ACE_Repair_%1", _hitPoint];

    if (isLocalized _text) then {
        _text = format [localize ([LSTRING(RepairedHitPointFully), LSTRING(RepairedHitPointPartially)] select (_hitPointDamage > 0)), localize _text];
    } else {
        _text = localize ([LSTRING(RepairedFully), LSTRING(RepairedPartially)] select (_hitPointDamage > 0));
    };

    [_text] call EFUNC(common,displayTextStructured);
};
