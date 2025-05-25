#include "..\script_component.hpp"
/*
 * Author: mrschick
 * Cycles the "Active Trigger" of a unit and shows a hint that displays the new active trigger.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call ace_explosives_fnc_cycleActiveTrigger
 *
 * Public: No
 */

params ["_unit"];
TRACE_1("params",_unit);

if (!alive _unit) exitWith {};

private _detonators = _unit call FUNC(getDetonators);

// Remove ACE_Cellphone from list, as it should never be the active trigger due to having its own keybind
_detonators deleteAt (_detonators findIf {_x == "ACE_Cellphone"});

// Reset Active Trigger if none available
if (_detonators isEqualTo []) exitWith {
    GVAR(activeTrigger) = "";
};

private _activeTrigger = GVAR(activeTrigger);
private _index = _detonators findIf {_x == _activeTrigger};
private _count = count _detonators;

_activeTrigger = if (_activeTrigger != "" && {_index != -1} && {_count > 1}) then {
    // If active trigger is set and among current detonators, switch to the next one
    if (_index < _count - 1) then {
        _index = _index + 1;
    } else {
        _index = 0;
    };

    _detonators select _index
} else {
    // Assign first detonator in list as the active one
    _detonators select 0
};

GVAR(activeTrigger) = _activeTrigger;
private _triggerConfig = configFile >> "CfgWeapons" >> _activeTrigger;
private _triggerName = getText (_triggerConfig >> "displayName");
private _triggerIcon = getText (_triggerConfig >> "picture");

[format ["%1: %2", LLSTRING(ActiveTrigger), _triggerName], _triggerIcon] call EFUNC(common,displayTextPicture);
