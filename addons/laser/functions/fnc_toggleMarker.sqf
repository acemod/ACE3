#include "script_component.hpp"
/*
 * Author: LorenLuke
 * Toggles the marker laser mode for any laser-designating unit/vehicle;
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [vehicle player] call ace_laser_fnc_toggleMarker
 *
 * Public: No
 */
 

params ["_vehicle"];

private _found = false;
{
    _x params ["_unit", "_sourceName", "_selectedWeapon", "_selectedTurret", "_pilotLaser", "_active"];
    if (_unit == _vehicle) exitWith {
        _found = true;
        if(_active) then {["ace_markerOff", _vehicle] call CBA_fnc_globalEvent} else {["ace_markerOn", _vehicle] call CBA_fnc_globalEvent};
    };
} forEach GVAR(laserMarkers);

if (! _found) then {
    ["ace_markerOn", _vehicle] call CBA_fnc_globalEvent;
};