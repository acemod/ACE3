params ["_weaponPlatform","_ammo",["_isSelected",false]];
private _unit = (call SPE_fnc_findPlayer);
private _canPrepare = false;
if (alive _unit && alive _weaponPlatform  && (vehicle _unit == _unit || vehicle _unit == _weaponPlatform)) then
{
  private _mags = magazines _weaponPlatform;
  private _defaultMags = getArray (configFile >> "CfgVehicles" >> (typeOf _weaponPlatform) >> "Turrets" >> "MainTurret" >> "magazines");
  if (({_x in _defaultMags} count _mags) > 1) exitwith {};


  _ammo = toLower _ammo;
  private _selectedMagazine = toLower (_unit getVariable ["SPE_Static_Weapon_Magazine",""]);
  _canPrepare = (_isSelected isEqualTo (_selectedMagazine == _ammo));

};
_canPrepare
