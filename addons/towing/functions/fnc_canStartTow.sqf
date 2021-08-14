#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Condition for whether or not we can tow from this object
 *
 * Arguments:
 * 0: Unit wanting to start towing <OBJECT>
 * 1: Vehicle to tow from <OBJECT>
 *
 * Return Value:
 * Whether or not we can start towing <BOOLEAN>
 *
 * Example:
 * [player, cursorObject] call ace_towing_fnc_canStartTow
 *
 * Public: No
 */
params ["_unit", "_target"];

private _hasRope = (
    [_unit, "ACE_Rope12"] call EFUNC(common,hasItem) || 
    { [_unit, "ACE_Rope15"] call EFUNC(common,hasItem)) } ||
    { [_unit, "ACE_Rope15"] call EFUNC(common,hasItem)) } ||
    { [_unit, "ACE_Rope18"] call EFUNC(common,hasItem)) } || 
    { [_unit, "ACE_Rope27"] call EFUNC(common,hasItem)) } ||
    { [_unit, "ACE_Rope36"] call EFUNC(common,hasItem)) }
);

!(_target getVariable [QGVAR(towing), false]) && _hasRope;
