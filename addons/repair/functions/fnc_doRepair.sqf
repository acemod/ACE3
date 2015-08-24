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

// Get hitpoint groups if available
_hitpointGroupConfig = configFile >> "CfgVehicles" >> typeOf _vehicle >> QGVAR(hitpointGroups);
_hitpointGroup = [];
if (isArray _hitpointGroupConfig) then {
    // Loop through hitpoint groups
    {
        // Exit using found hitpoint group if this hitpoint is leader of any
        if (_x select 0 == _hitPoint) exitWith {
            ([_vehicle] call EFUNC(common,getHitPointsWithSelections)) params ["_hitpoints"];
            // Loop through the found group
            {
                // If hitpoint is valid set damage to 0, else print RPT error
                if (_x in _hitpoints) then {
                    ["setVehicleHitPointDamage", _vehicle, [_vehicle, _x, 0]] call EFUNC(common,targetEvent);
                } else {
                    diag_log text format ["[ACE] ERROR: Invalid hitpoint %1 in hitpointGroups of %2", _x, _vehicle];
                };

            } forEach (_x select 1);
        };
    } forEach (getArray _hitpointGroupConfig);
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
