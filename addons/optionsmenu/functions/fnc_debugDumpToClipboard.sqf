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

private ["_var", "_unit"];

#define MIN_ARRAY_SIZE 10

"ace_clipboard" callExtension "---ACE Debug---
";

"ace_clipboard" callExtension format ["--Performance--
diag_fps = %1
count ace_common_waitAndExecArray = %2
count cba_common_perFrameHandlerArray = %3 (max %4)
count diag_activeSQFScripts = %5
count diag_activeSQSScripts = %6
count diag_activeMissionFSMs = %7

", diag_fps, count ace_common_waitAndExecArray, {!isNil "_x"} count cba_common_perFrameHandlerArray, count cba_common_perFrameHandlerArray, count diag_activeSQFScripts, count diag_activeSQSScripts,count diag_activeMissionFSMs];

"ace_clipboard" callExtension "--Player--
";
if (isNull ACE_player) then {
    "ace_clipboard" callExtension "Null

";
} else {
    "ace_clipboard" callExtension format ["typeOf = %1
animationState = %2

", typeOf ace_player, animationState ace_player];
};

"ace_clipboard" callExtension format ["--Array Info (count >= %1)--
", MIN_ARRAY_SIZE];
{
    _var = missionNamespace getVariable [_x, nil];
    if(!isnil "_var" && {(typeName _var) == "ARRAY"} && {(count _var) > MIN_ARRAY_SIZE}) then {
        "ace_clipboard" callExtension format ["%1 - ARRAY SIZE: %2
", _x, (count _var)];
    };
} forEach (allVariables missionNamespace);

{
    _unit = _x;
    {
        _var = _unit getVariable [_x, nil];
        if(!isnil "_var" && {(typeName _var) == "ARRAY"} && {(count _var) > MIN_ARRAY_SIZE}) then {
            "ace_clipboard" callExtension format ["%1 on [%2] - ARRAY SIZE: %3
", _x, _unit, (count _var)];
        };
    } forEach (allVariables _unit);
} forEach allUnits;

"ace_clipboard" callExtension "--COMPLETE--";
