#include "script_component.hpp"

private ["_pos", "_offset", "_ladder"];

removeBackpack ACE_player;

_pos = ACE_player modelToWorld [0,0,0];
_offset = if ((ACE_player call CBA_fnc_getUnitAnim select 0) == "prone") then { 1 } else {0.8};
_pos set [0, (_pos select 0) + (sin (direction ACE_player) * _offset)];
_pos set [1, (_pos select 1) + (cos (direction ACE_player) * _offset)];
_pos set [2, [ACE_player] call CBA_fnc_realHeight];

_ladder = "ACE_Tactical_Ladder" createVehicle _pos;
_ladder setPos _pos;
_ladder setDir (direction ACE_player);

ACE_player reveal _ladder;
