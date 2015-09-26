/*
 * Author: commy2
 * Called by repair action / progress bar. Raise events to set the new hitpoint damage.
 *
 * Arguments:
 * 0: Unit that does the repairing <OBJECT>
 * 1: Vehicle to repair <OBJECT>
 * 2: Selected hitpointIndex <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit, vehicle, 6] call ace_repair_fnc_doRepair
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_hitPointDamage", "_text", "_hitpointGroupConfig", "_hitPointClassname", "_subHitIndex"];
params ["_unit", "_vehicle", "_hitPointIndex"];
TRACE_3("params",_unit,_vehicle,_hitPointIndex);

(getAllHitPointsDamage _vehicle) params ["_allHitPoints"];
_hitPointClassname = _allHitPoints select _hitPointIndex;

// get current hitpoint damage
_hitPointDamage = _vehicle getHitIndex _hitPointIndex;

_hitPointDamage = _hitPointDamage - 0.5;
// don't use negative values for damage
_hitPointDamage = _hitPointDamage max ([_unit] call FUNC(getPostRepairDamage));

// raise event to set the new hitpoint damage
["setVehicleHitPointDamage", _vehicle, [_vehicle, _hitPointIndex, _hitPointDamage]] call EFUNC(common,targetEvent);

// Get hitpoint groups if available
_hitpointGroupConfig = configFile >> "CfgVehicles" >> typeOf _vehicle >> QGVAR(hitpointGroups);
if (isArray _hitpointGroupConfig) then {
    // Retrieve hitpoint subgroup if current hitpoint is main hitpoint of a group
    {
        _x params ["_masterHitpoint", "_subHitArray"];
        // Exit using found hitpoint group if this hitpoint is leader of any
        if (_masterHitpoint == _hitPointClassname) exitWith {
            {
                _subHitIndex = _allHitPoints find _x;
                if (_subHitIndex == -1) then {
                    ACE_LOGERROR_2("Invalid hitpoint %1 in hitpointGroups of %2",_x,_vehicle);
                } else {
                    ["setVehicleHitPointDamage", _vehicle, [_vehicle, _subHitIndex, 0]] call EFUNC(common,targetEvent);
                };
            } forEach _subHitArray;
        };
    } forEach (getArray _hitpointGroupConfig);
};

// display text message if enabled
if (GVAR(DisplayTextOnRepair)) then {
    private ["_textLocalized", "_textDefault"];

    // Find localized string
    _textLocalized = localize ([LSTRING(RepairedHitPointFully), LSTRING(RepairedHitPointPartially)] select (_hitPointDamage > 0));
    _textDefault = localize ([LSTRING(RepairedFully), LSTRING(RepairedPartially)] select (_hitPointDamage > 0));
    ([_hitPointClassname, _textLocalized, _textDefault] call FUNC(getHitPointString)) params ["_text"];

    // Display text
    [_text] call EFUNC(common,displayTextStructured);
};
