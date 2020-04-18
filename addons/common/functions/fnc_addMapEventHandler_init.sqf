#define DEBUG_MODE_FULL
#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Handles DisplayLoaded event for various map displays. Save/Load compatible.
 *
 * Arguments:
 * 0: DisplayType <STRING>
 * 1: Display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["RscDisplayMainMap", findDisplay 12] call ace_common_fnc_addMapEventHandler_init
 *
 * Public: No
 */

params ["_className", "_display"];
TRACE_2("addMapEventHandler_init",_className,_display);

if (_display getVariable [QGVAR(mapEventHandlers_init), false]) exitWith { WARNING("map already init"); };

if (_className == "RscDiary") then {
    _className = switch (ctrlIDD _display) do {
        case 12: { "RscDisplayMainMap" };
        case 37: { "RscDisplayGetReady" };
        case 52: { "RscDisplayServerGetReady" };
        case 53: { "RscDisplayClientGetReady" };
        default { "" };
    };
};

private _eventVar = getText (configFile >> _className >> QEGVAR(mapEventHandlers,type));
private _mapIDCS = getArray (configFile >> _className >> QEGVAR(mapEventHandlers,IDCs));
if ((_eventVar == "") || {_mapIDCS isEqualTo []}) exitWith {
    ERROR_2("addMapEventHandler_init - unknown display %1-%2",_this,_className);
};

TRACE_3("adding EHs",_className,_eventVar,_mapIDCS);
{
    private _mapCtrl = _display displayCtrl _x;
    if (isNull _mapCtrl) exitWith {ERROR_2("map is null %1-%2",_className,_x);};
    {
        private _code = format ['if ((_this#0) getVariable ["ace_mapEventHandlers_active", true]) then { {call _x} forEach (missionNamespace getVariable ["%1%2", []]) }', _eventVar, _x];
        private _ret = _mapCtrl ctrlAddEventHandler [_x, _code];
        TRACE_3("x",_x,_code,_ret);
    } forEach ADDMAPEVENTHANDLER_EVENTS;
} forEach _mapIDCS;

_display setVariable [QGVAR(mapEventHandlers_init), true];
