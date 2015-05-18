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

_outputString = "Array Variable Count':
";

{
    private["_var"];
    _var = missionNamespace getVariable [_x, nil];
    if(!isnil "_var" && {(typeName _var) == "ARRAY"} ) then {
        _outputString = _outputString + format["%1 - ARRAY SIZE: %2
", _x, (count _var)];
    };
} forEach (allVariables missionNamespace);

{
    _unit = _x;
    {
        private["_var"];
        _var = missionNamespace getVariable [_x, nil];
        if(!isnil "_var" && {(typeName _var) == "ARRAY"} ) then {
            _outputString = _outputString + text format["%1 - ARRAY SIZE: %2 for %3
", _x, (count _var), _unit];
        };
    } forEach (allVariables _unit);
} forEach allUnits;


FUNC(clipboardExport) = {
    private["_chunks"];
    _chunks = [];

    _chunks = [_this select 0, "-"] call CBA_fnc_split;

    {
        private["_chunk"];
        _chunk = _x + ";";
        "ace_clipboard" callExtension format["%1", _chunk];
    } forEach _chunks;

    "ace_clipboard" callExtension "--COMPLETE--";
};


[_outputString] call FUNC(clipboardExport);

