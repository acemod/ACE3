// by commy2
#include "script_component.hpp"

private ["_item", "_position", "_damage"];

_item = _this select 0;
_position = _this select 1;
_damage = _this select 2;

if (isNil "_damage") then {_damage = 0};

// randomized end position
_position = _position vectorAdd [1 - random 2, 1 - random 2, 0];

_item = createVehicle [_item, _position, [], 0, "NONE"];
_item setPosASL _position;

["fixCollision", _item] call EFUNC(common,localEvent);
["fixPosition", _item] call EFUNC(common,localEvent);

_item setDamage _damage;
