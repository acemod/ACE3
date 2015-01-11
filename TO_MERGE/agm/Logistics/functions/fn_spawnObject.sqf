// by commy2

private ["_item", "_position", "_damage"];

_item = _this select 0;
_position = _this select 1;
_damage = _this select 2;

if (isNil "_damage") then {_damage = 0};

_position = _position findEmptyPosition [0, 4, _item];
if (count _position == 0) then {_position = _this select 1};
_position set [2, 0];

_item = createVehicle [_item, _position, [], 0, "NONE"];
_item setDamage _damage;
_item
