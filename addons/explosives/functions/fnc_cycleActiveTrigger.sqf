#include "..\script_component.hpp"
/*
 * Author: mrschick
 * Cycles the "Active Trigger" of a unit and shows a CBA Hint that displays the new Active Trigger.
 *
 * Arguments:
 * 0: Target Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_player] call ACE_Explosives_fnc_cycleActiveTrigger;
 *
 * Public: No
 */

params ["_unit"];
TRACE_1("params",_unit);

private _detonators = _unit call FUNC(getDetonators);

// Remove ACE_Cellphone from list, as it should never be the active trigger due to having its own keybind
_detonators deleteAt (_detonators find "ACE_Cellphone");

// Reset Active Trigger if none available
if (_detonators isEqualTo []) exitWith {
    GVAR(activeTrigger) = "";
};

private _activeTrigger = GVAR(activeTrigger);
private _index = _detonators find _activeTrigger;

if (_activeTrigger != "" && {_index != -1} && {count(_detonators) > 1}) then {
    // If active trigger is set and among current detonators, switch to the next one
    if (_index < count(_detonators) - 1) then {
        _index = _index + 1;
    } else {
        _index = 0;
    };
    _activeTrigger = _detonators select _index;
} else {
    // Assign first detonator in list as the active one
    _activeTrigger = _detonators select 0;
};

GVAR(activeTrigger) = _activeTrigger;
private _triggerName = getText (configFile >> "CfgWeapons" >> (_activeTrigger) >> "displayName");
private _triggerIcon = getText (configFile >> "CfgWeapons" >> (_activeTrigger) >> "picture");

[
    [format ["%1:", LLSTRING(ActiveTrigger)]],
    [_triggerName],
    [_triggerIcon, 1.8],
    true
] call CBA_fnc_notify;
