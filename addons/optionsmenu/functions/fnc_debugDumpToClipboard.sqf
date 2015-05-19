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

private ["_outputString", "_var", "_unit", "_countSent"];

#define CHARS_PER_EXT_CALL 2000
#define MIN_ARRAY_SIZE 0

_outputString = "---ACE Debug---
";

_outputString = _outputString + format ["--Performance--
diag_fps = %1
count cba_common_perFrameHandlerArray = %2
count diag_activeSQFScripts = %3
count diag_activeSQSScripts = %4
count diag_activeMissionFSMs = %5

", diag_fps, count cba_common_perFrameHandlerArray, count diag_activeSQFScripts, count diag_activeSQSScripts,count diag_activeMissionFSMs];

_outputString = _outputString + "--Player--
";
if (isNull ACE_player) then {
    _outputString = _outputString + "Null

";
} else {
    _outputString = _outputString + format ["typeOf = %1
animationState = %2

", typeOf ace_player, animationState ace_player];
};

_outputString = _outputString + format ["--Array Info (count >= %1)--
", MIN_ARRAY_SIZE];
{
    _var = missionNamespace getVariable [_x, nil];
    if(!isnil "_var" && {(typeName _var) == "ARRAY"} && {(count _var) > MIN_ARRAY_SIZE}) then {
        _outputString = _outputString + format["%1 - ARRAY SIZE: %2
", _x, (count _var)];
    };
} forEach (allVariables missionNamespace);

{
    _unit = _x;
    {
        _var = _unit getVariable [_x, nil];
        if(!isnil "_var" && {(typeName _var) == "ARRAY"} && {(count _var) > MIN_ARRAY_SIZE}) then {
            _outputString = _outputString + format["%1 on [%2] - ARRAY SIZE: %3
", _x, _unit, (count _var)];
        };
    } forEach (allVariables _unit);
} forEach allUnits;

_countSent = 0;
while {_countSent < (count _outputString)} do {
    "ace_clipboard" callExtension (_outputString select [_countSent, CHARS_PER_EXT_CALL]);
    _countSent = _countSent + CHARS_PER_EXT_CALL;
};

"ace_clipboard" callExtension "--COMPLETE--";
