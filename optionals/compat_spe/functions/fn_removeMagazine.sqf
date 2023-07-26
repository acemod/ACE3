/*
Author: Kerc
Removes a specific magazine from a Unit or Container
Arguments:
"_unit","_magName","_ammoCount"
Return Value:
boolean
*/

params ["_unit","_magName","_ammoCount"];

private _desiredMagArray = [_magName,_ammoCount];

private _containers = if (_unit isKindOf "CAManBase") then {
  [[uniform _unit,uniformContainer _unit],[vest _unit,vestContainer  _unit],[backpack _unit,backpackContainer  _unit]];
} else {
  [[(typeOf _unit),_unit]];
};
{
  _x params ["_type","_container"];
  private _magazinesAmmo = (magazinesammoCargo _container) apply {[toLower (_x#0),_x#1]};
  private _desiredIndex = _magazinesAmmo findIf {_x isEqualTo _desiredMagArray};
  if (_desiredIndex > -1) exitWith {
    _magazinesAmmo deleteAt _desiredIndex;
    clearMagazineCargoGlobal _container;
    if (_type in ["GroundWeaponHolder", "WeaponHolderSimulated"]) then {
      private _pos = getPosATLVisual _container;
      _container = createVehicle [_type,_pos, [], 0, "CAN_COLLIDE"];
      _container setposATL _pos;
    };
    {
      _container addMagazineAmmoCargo [_x#0, 1, _x#1];
    } forEach _magazinesAmmo;
  };

} forEach _containers;
