/*
 * Author: commy2
 *
 * Returns all turned on lights of any vehicle or streetlamp.
 *
 * Arguments:
 * 0: A vehicle, not the classname (Object)
 *
 * Return Value:
 * All burning lights (Array)
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vehicle"];

if (!isLightOn _vehicle) exitWith {[]};

private ["_reflectorsWithSelections", "_lights", "_hitpoints"];

_reflectorsWithSelections = [[_vehicle], FUNC(getReflectorsWithSelections), uiNamespace, format [QEGVAR(cache,%1_%2), QUOTE(DFUNC(getReflectorsWithSelections)), typeOf _vehicle], 1E11] call FUNC(cachedCall);
//_reflectorsWithSelections = [_vehicle] call FUNC(getReflectorsWithSelections);

_lights = _reflectorsWithSelections select 0;
_hitpoints = _reflectorsWithSelections select 1;

private "_turnedOnLights";
_turnedOnLights = [];
{
    if (_vehicle getHit _x <= 0.9) then {
        _turnedOnLights pushBack (_lights select _forEachIndex);
    };

} forEach _hitpoints;

_turnedOnLights
