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


{
    private["_var"];
    _var = missionNamespace getVariable [_x, nil];
    if(!isnil "_var" && {(typeName _var) == "ARRAY"} ) then {
        "ace_clipboard" callExtension format["%1 - ARRAY SIZE: %2
", _x, (count _var)];
    };
} forEach (allVariables missionNamespace);

{
    _unit = _x;
    {
        private["_var"];
        _var = _unit getVariable [_x, nil];
        if(!isnil "_var" && {(typeName _var) == "ARRAY"} ) then {
            "ace_clipboard" callExtension format["%1 - ARRAY SIZE: %2 for %3
", _x, (count _var), _unit];
        };
    } forEach (allVariables _unit);
} forEach allUnits;


"ace_clipboard" callExtension "--COMPLETE--";
