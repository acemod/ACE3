//#define DEBUG_MODE_FULL
#include "script_component.hpp"

private["_surface", "_direct"];

EXPLODE_9_PVT((_this select 0),_unit,_shooter,_bullet,_position,_velocity,_selection,_ammo,_direction,_radius);
_surface = (_this select 0) select 9;
_direct = (_this select 0) select 10;


// Dispatch the damage to the remote machine of the target vehicle
if(!local _target) exitWith { [QGVAR(hp), _target, _this] call EFUNC(common,clientEvent); };

//
// This is running on the vehicle owner system
//
//_objects = [_unit, _shooter, _bullet, _ammo];
//_spatial = [_position, _velocity, _direction, _radius, _surface];
//[_objects, _spatial, _selection, _direct] call FUNC(doHit);
_this call FUNC(doHit);