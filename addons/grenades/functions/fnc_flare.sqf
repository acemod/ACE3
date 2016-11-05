/*
 * Author: commy2
 * Makes flare shine.
 *
 * Arguments:
 * 0: The flare <OBJECT>
 * 1: Color of flare <ARRAY>
 * 2: Intensity of flare <NUMBER>
 * 3: Flare lifetime <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_nade, [0.5,0.5,0.5], 0.5, 60] call ace_grenades_fnc_flare
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_projectile", "_color", "_intensity", "_timeToLive"];

private _light = "#lightpoint" createVehicleLocal position _projectile;

_light setLightColor _color;
_light setLightAmbient _color;
_light setLightIntensity _intensity;
_light setLightBrightness 0.8;

_light setLightUseFlare true;
_light setLightFlareSize 3.0;
_light setLightFlareMaxDistance 1000;

_light setLightDayLight true;

_light lightAttachObject [_projectile, [0,0,0]];
//_light attachTo [_projectile, [0,0,0]];

[{deleteVehicle _this}, _light, _timeToLive] call CBA_fnc_waitAndExecute;
