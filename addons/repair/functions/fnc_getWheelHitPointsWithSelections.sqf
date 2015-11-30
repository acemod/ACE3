/*
 * Author: commy2
 * Returns the wheel hitpoints and their selections.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * 0: Wheel hitpoints <ARRAY>
 * 1: Wheel hitpoint selections in model coordinates <ARRAY>
 *
 * Example:
 * [unit, vehicle, "hitpoint"] call ace_repair_fnc_getWheelHitPointsWithSelections
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vehicle"];
TRACE_1("params",_vehicle);

// get the vehicles wheel config
private "_wheels";
_wheels = configFile >> "CfgVehicles" >> typeOf _vehicle >> "Wheels";

// exit with nothing if the vehicle has no wheels class
if !(isClass _wheels) exitWith {[[],[]]};

// get all wheels and read selections from config
private ["_selections", "_bones"];

_wheels = "true" configClasses _wheels;

_selections = [];
_bones = [];
{
    _selections pushBack getText (_x >> "center");

    private "_bone";
    _bone = getText (_x >> "boneName");

    _bone = toArray _bone;
    _bone resize count "wheel_X_Y";  // this is a requirement for physx. Should work for all addon vehicles.
    _bone = toString _bone;

    _bones pushBack _bone;
} forEach _wheels;

// get hitpoints with their fire geometry selections
private ["_hitPointsWithSelections", "_hitPoints", "_hitPointSelections"];

_hitPointsWithSelections = [_vehicle] call EFUNC(common,getHitPointsWithSelections);

_hitPoints = _hitPointsWithSelections select 0;
_hitPointSelections = _hitPointsWithSelections select 1;

// assign hitpoints to correct wheel selection by comparing bone name and fire geometry selection
private ["_wheelHitPoints", "_wheelHitPointSelections"];

_wheelHitPoints = [];
_wheelHitPointSelections = [];
{
    private "_bone";
    _bone = _x;

    private "_index";

    _index = -1;
    {
        if (_bone != "" && {_x find _bone == 0}) exitWith {  // same as above. Requirement for physx.
            _index = _forEachIndex;
        };
    } forEach _hitPointSelections;

    if (_index != -1) then {
        _wheelHitPoints pushBack (_hitPoints select _index);
        _wheelHitPointSelections pushBack (_selections select _forEachIndex);
    };

} forEach _bones;

[_wheelHitPoints, _wheelHitPointSelections]
