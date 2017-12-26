

#include "script_component.hpp"

params ["_projectile"];

([(getPosASL _projectile), (velocity _projectile), _seekerAngle, _seekerMaxRange, [_wavelengthMin, _wavelengthMax], _code, _projectile] call EFUNC(laser,seekerFindLaserSpot)) select 0;