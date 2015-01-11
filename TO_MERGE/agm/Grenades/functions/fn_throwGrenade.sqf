/*
 * Author: commy2
 *
 * Adjust the grenades throwing direction and speed to the selected throwing mode.
 * 
 * Argument:
 * input from "Fired" eventhandler
 * 
 * Return value:
 * Nothing
 */

private ["_unit", "_weapon", "_projectile"];

_unit = _this select 0;
_weapon = _this select 1;
_projectile = _this select 6;

if (_weapon != "Throw") exitWith {};

private "_mode";

_mode = missionNamespace getVariable ["AGM_Grenades_Mode", 0];

if (_mode != 0) then {
  private "_velocity";

  _velocity = velocity _projectile;

  switch (_mode) do {
    //high throw
    case 1 : {
      _velocity = [
        0.5 * (_velocity select 0),
        0.5 * (_velocity select 1),
        [0, 0, 0] distance (_velocity vectorMultiply 0.5)
      ];
    };
    //precise throw
    case 2 : {
      _velocity = (_unit weaponDirection _weapon) vectorMultiply (vectorMagnitude _velocity);
    };
    //roll grande
    case 3 : {
      //@todo
    };
    //drop grenade
    case 4 : {
      _velocity = [0, 0, 0];
    };
  };

  _projectile setVelocity _velocity;
};

if (typeOf _projectile == "AGM_G_M84") then {
  _this spawn {
    _projectile = _this select 6;

    sleep getNumber (configFile >> "CfgAmmo" >> typeOf _projectile >> "fuseDistance");

    if (alive _projectile) then {
      playSound3D ["A3\Sounds_F\weapons\Explosion\explosion_mine_1.wss", _projectile, false, getPosASL _projectile, 5, 1.2, 400];

      _affected = _projectile nearEntities ["CAManBase", 50];
      {
        [[_x, _projectile], "AGM_Grenades_fnc_flashbangEffect", _x] call AGM_Core_fnc_execRemoteFnc;
      } forEach _affected;
    };
  };
};
