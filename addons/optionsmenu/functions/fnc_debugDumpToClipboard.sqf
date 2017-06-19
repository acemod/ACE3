/*
 * Author: PabstMirror
 * Dumps debug info to clipboard.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ACE_optionsmenu_fnc_debugDumpToClipboard
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_var", "_unit", "_outputText", "_text"];

#define MIN_ARRAY_SIZE 50

_outputText = {
    diag_log text (_this select 0);
    "ace_clipboard" callExtension ((_this select 0) + "
");
};

_text = format ["~~~~~~~~~ACE Debug~~~~~~~~~
time = %1

------Performance------
diag_fps = %2
count cba_common_waitAndExecArray = %3
count cba_common_waitUntilAndExecArray = %4
count cba_common_perFrameHandlerArray = %5 (max %6)
count diag_activeSQFScripts = %7
count diag_activeSQSScripts = %8
count diag_activeMissionFSMs = %9",
time,
diag_fps,
count cba_common_waitAndExecArray,
count cba_common_waitUntilAndExecArray,
{!isNil "_x"} count cba_common_perFrameHandlerArray, count cba_common_perFrameHandlerArray,
count diag_activeSQFScripts,
count diag_activeSQSScripts,
count diag_activeMissionFSMs];
[_text] call _outputText;


_text = format ["
------Player------
typeOf = %1
animationState = %2",
if (isNull ace_player) then {"null"} else {typeOf ace_player},
if (isNull ace_player) then {"null"} else {animationState ace_player}];
[_text] call _outputText;


_text = format ["
------ACE Settings------"];
[_text] call _outputText;


{
    _var = missionNamespace getVariable [(_x select 0), "ERROR: Not Defined"];
    _text = format ["%1 - %2", (_x select 0), _var];
    [_text] call _outputText;
} forEach EGVAR(common,settings);


_text = format ["
------Array Info (count >= %1)------", MIN_ARRAY_SIZE];
[_text] call _outputText;


{
    _var = missionNamespace getVariable [_x, nil];
    if(!isnil "_var" && {_var isEqualType []} && {(count _var) > MIN_ARRAY_SIZE}) then {
        _text = format ["%1 - ARRAY SIZE: %2", _x, (count _var)];
        [_text] call _outputText;
    };
} forEach (allVariables missionNamespace);

{
    _unit = _x;
    {
        _var = _unit getVariable [_x, nil];
        if(!isnil "_var" && {_var isEqualType []} && {(count _var) > MIN_ARRAY_SIZE}) then {
            _text = format ["%1 on [%2] - ARRAY SIZE: %3", _x, _unit, (count _var)];
            [_text] call _outputText;
        };
    } forEach (allVariables _unit);
} forEach allUnits;

"ace_clipboard" callExtension "--COMPLETE--";
