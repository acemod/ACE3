#include "script_component.hpp"
/*
 * Author: dedmen
 * Adds the local unit event handlers. 
 * Access with function `ace_common_fnc_getLocalUnits` or array `ace_common_localUnits`
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

GVAR(localUnits) = [];

// Eventhandlers to maintain array of localUnits
["CAManBase", "init", {
    params ["_unit"];
    TRACE_2("unit init",_unit,local _unit);

    if (local _unit) then {
        if (!alive _unit) exitWith {};
        GVAR(localUnits) pushBack _unit;
    };
}] call CBA_fnc_addClassEventHandler;

["CAManBase", "respawn", {
    params ["_unit"];
    TRACE_2("unit respawn",_unit,local _unit);

    if (local _unit) then {
        if (!alive _unit) exitWith {};
        GVAR(localUnits) pushBack _unit;
    };
}] call CBA_fnc_addClassEventHandler;

["CAManBase", "local", {
    params ["_unit", "_local"];
    TRACE_2("unit local",_unit,_local);

    if (_local) then {
        if (!alive _unit) exitWith {};
        GVAR(localUnits) pushBack _unit;
    } else {
        GVAR(localUnits) deleteAt (GVAR(localUnits) find _unit);
    };
}] call CBA_fnc_addClassEventHandler;

["CAManBase", "deleted", {
    params ["_unit"];
    TRACE_2("unit deleted",_unit,local _unit);

    if (local _unit) then {
        [{
            params ["_unit"];
            TRACE_3("unit deleted nextFrame",_unit,local _unit,isNull _unit);
            if (isNull _unit) then { // If it is not null then the deleted EH was Fake.
                GVAR(localUnits) = GVAR(localUnits) - [objNull];
            };
        }, [_unit]] call CBA_fnc_execNextFrame;
    };
}] call CBA_fnc_addClassEventHandler;

["CAManBase", "killed", {
    params ["_unit"];
    TRACE_2("unit killed",_unit,local _unit);

    if (local _unit) then {
        GVAR(localUnits) deleteAt (GVAR(localUnits) find _unit);
    };
}] call CBA_fnc_addClassEventHandler;
