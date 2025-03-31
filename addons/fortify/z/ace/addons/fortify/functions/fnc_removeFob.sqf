#include "script_component.hpp"
/*
 * Author: Dextro
 * Remove FOB to Array.
 *
 * Arguments:
 * 0: VEHICLE <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_entity] call ace_fortify_fnc_removeFob
 *
 * Public: No
 */

params ["_vehicle"];

if (_vehicle getVariable ["ace_fortify_CTIME",0] > 0) then {
    // Remove from Array
    private _index = ace_fobs find _vehicle;
    if (_index >= 0) then {
        ace_fobs deleteAt _index;
        publicVariable "ace_fobs";
    };

    // Remove Marker
    deleteMarker str(_vehicle);
};