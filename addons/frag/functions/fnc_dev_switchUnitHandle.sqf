#include "script_component.hpp"
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
params ["_lVic", "_cVic"];


if (_cVic isEqualTo objNull || {!local _cVic || _lVic isEqualTo _cVic}) exitWith {};


private _aID = missionNamespace getVariable [QGVAR(dev_clearTraceAction), -1];
if (_aID > -1 && {_lVic isNotEqualTo objNull}) then
{
    _lVic removeAction _aID;
};

_aID = _cVic addAction
[
    "Reset Lines",
    FUNC(dev_clearTraces),
    nil,        // arguments
    1.5,        // priority
    true,        // showWindow
    false,        // hideOnUse
    "",            // shortcut
    "true",        // condition
    8            
];

missionNamespace getVariable [QGVAR(dev_clearTraceAction), _aID];