#include "script_component.hpp"
/*
 * Author: commy2
 * Returns all turned on lights of any vehicle or streetlamp.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * All burning lights <ARRAY>
 *
 * Example:
 * [car] call ace_common_fnc_getTurnedOnLights
 *
 * Public: Yes
 */

params ["_vehicle"];

if (!isLightOn _vehicle) exitWith {[]};

private _reflectorsWithSelections = [[_vehicle], FUNC(getReflectorsWithSelections), uiNamespace, format [QEGVAR(cache,%1_%2), QUOTE(DFUNC(getReflectorsWithSelections)), typeOf _vehicle], 1E11] call FUNC(cachedCall);
//_reflectorsWithSelections = [_vehicle] call FUNC(getReflectorsWithSelections);

_reflectorsWithSelections params ["_lights", "_hitpoints"];

private _turnedOnLights = [];

{
    if (_vehicle getHit _x <= 0.9) then {
        _turnedOnLights pushBack (_lights select _forEachIndex);
    };
} forEach _hitpoints;

_turnedOnLights
