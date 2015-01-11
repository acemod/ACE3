// by commy2

private ["_vehicle", "_turret", "_weapons"];

_vehicle = _this select 0;

_turret = [typeOf _vehicle] call AGM_Core_fnc_getTurretCommander;

_weapons = _vehicle weaponsTurret _turret;

if (
  count _weapons > 1
  || {count _weapons > 0 && {!(_weapons select 0 in ["SmokeLauncher", "BWA3_SmokeLauncher"])}}  // @todo somebody might use custom smoke launcher weapons aswell, maybe ...
) then {
  //This doesn't work reliably for vehilces with additional weapons for the commander. Select smoke launcher instead.

  private "_index";

  // avoid infinite loop
  if !("SmokeLauncher" in _weapons) exitWith {};

  _index = 0;
  while {
    _vehicle currentWeaponTurret _turret != "SmokeLauncher"
  } do {
    [commander _vehicle, _vehicle, _index] call AGM_WeaponSelect_fnc_selectWeaponVehicle;
    _index = _index + 1;
  };
} else {
  // fire away!

  private "_logic";

  _logic = createGroup sideLogic createUnit ["Logic", [0,0,0], [], 0, "NONE"];
  _logic action ["useWeapon", _vehicle, commander _vehicle, 0];
  deleteVehicle _logic;
};
