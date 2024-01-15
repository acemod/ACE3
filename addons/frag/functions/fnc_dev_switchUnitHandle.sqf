#include "..\script_component.hpp"
/*
 * Author: Lambda.Tiger
 * Handle for debug actions when switching units
 *
 * Arguments:
 * 0: Last unit <OBJECT>
 * 1: Current unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit0, player] call ace_frag_fnc_dev_switchUnitHandle;
 *
 * Public: No
 */
params ["_lastUnit", "_currentUnit"];

if (isNull _currentUnit || {_lastUnit isEqualTo _currentUnit}) exitWith {};
if (!local _currentUnit) exitWith {
    [
        {local _currentUnit},
        FUNC(dev_switchUnitHandle),
        _this,
        5
    ] call CBA_fnc_waitUntilAndExecute;
};


private _actionID = missionNamespace getVariable [QGVAR(dev_clearTraceAction), -1];
if (_actionID > -1 && {!isNull _lastUnit}) then {
    _lastUnit removeAction _actionID;
};

_actionID = _currentUnit addAction [
    "Reset Lines",
    FUNC(dev_clearTraces),
    nil,
    1.5,
    true,
    false,
    "",
    "true",
    8
];

missionNamespace getVariable [QGVAR(dev_clearTraceAction), _actionID];
