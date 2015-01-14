//Waits for the grenade fuze to trigger and 'explode'

#include "script_component.hpp"

_projectile = (_this select 0) select 0;
_waitUntilTime = (_this select 0) select 1;

if (_waitUntilTime > time) exitWith {};

//remove frameEH
[(_this select 1)] call cba_fnc_removePerFrameHandler;

if (alive _projectile) then {
  playSound3D ["A3\Sounds_F\weapons\Explosion\explosion_mine_1.wss", _projectile, false, getPosASL _projectile, 5, 1.2, 400];

  _affected = _projectile nearEntities ["CAManBase", 50];
  {
    // [[_x, _projectile], "ACE_Grenades_fnc_flashbangEffect", _x] call ACE_Core_fnc_execRemoteFnc;
    [QGVAR(flashbangExplosionEvent), [_x, _projectile]] call EFUNC(common,globalEvent);
  } forEach _affected;
};