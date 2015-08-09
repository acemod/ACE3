// by commy2
#include "script_component.hpp"

params ["_item", "_position", ["_damage", 0]];
TRACE_3("params",_item,_position,_damage);

// randomized end position
_position = _position vectorAdd [1 - random 2, 1 - random 2, 0];

_item = createVehicle [_item, _position, [], 0, "NONE"];
_item setPosASL _position;

["fixCollision", _item] call EFUNC(common,localEvent);
["fixPosition", _item] call EFUNC(common,localEvent);

_item setDamage _damage;
