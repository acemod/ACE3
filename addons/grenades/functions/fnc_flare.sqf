// by commy2
#include "script_component.hpp"

params ["_projectile", "_color", "_intensity", "_timeToLive"];

private "_light";
_light = "#lightpoint" createVehicleLocal position _projectile;

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

[{deleteVehicle _this}, _light, _timeToLive, 1] call EFUNC(common,waitAndExecute);
