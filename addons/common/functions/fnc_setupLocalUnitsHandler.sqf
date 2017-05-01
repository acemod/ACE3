/*
 * Author: dedmen  
 * Adds the local unit event handlers. Access with array `ace_common_localUnits`.
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [] call ace_common_fnc_setupLocalUnitsHandler
 *
 * Public: No
 */
// #define DEBUG_MODE_FULL
#include "script_component.hpp"

GVAR(localUnits) = [];

//Eventhandlers to maintain array of localUnits
["CAManBase", "init", {
    params ["_unit"];
    TRACE_2("unit init",_unit,local _unit);

    if (local _unit) then {
        GVAR(localUnits) pushBack _unit;
    };
}] call CBA_fnc_addClassEventHandler;

["CAManBase", "local", {
    params ["_unit", "_local"];
    TRACE_2("unit local",_unit,_local);

    if (_local) then {
        GVAR(localUnits) pushBack _unit;
    } else {
        GVAR(localUnits) deleteAt (GVAR(localUnits) find _unit);
    };
}] call CBA_fnc_addClassEventHandler;

["CAManBase", "deleted", {
    params ["_unit"];
    TRACE_2("unit deleted",_unit,local _unit);

    if (local _unit) then {
        GVAR(localUnits) deleteAt (GVAR(localUnits) find _unit);
    };
}] call CBA_fnc_addClassEventHandler;
