/*
Author: Kerc
Corrects position of unit when they dismount static weapon
Arguments:
0: unit
Return Value:
none
*/

/////////////////////////////////////////////////////////////////////////////////////////////
// Main - executed local to the weapon
//////////////////////////////////////////////////////////////////////////////////////////

params
[
	["_weaponPlatform",objNull,[objNull]],
	["_position",""],
    ["_unit",objNull,[objNull]],
    ["_animation","AmovPpneMstpSnonWnonDnon"]
];

private _dir = vectorDir _weaponPlatform;
_unit setVectorDir _dir;
if (alive _unit && vehicle _unit == _unit) then {_unit switchMove _animation;};
/* private _pos = _weaponPlatform modelToWorldVisualWorld [0,-2.5,0];
_unit setposasl _pos; */
