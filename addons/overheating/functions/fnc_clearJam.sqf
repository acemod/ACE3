/*
 * Author: Commy2
 *
 * Clears the jam from a weapon
 *
 * Argument:
 * 0: Last temperature (number)
 * 1: Barrel mass (number)
 * 2: Time (number)
 *
 * Return value:
 * New temperature (number)
 */
#include "\z\ace\addons\overheating\script_component.hpp"

EXPLODE_3_PVT(_this,_unit,_weapon,_skipAnim);

private ["_jammedWeapons"];
_jammedWeapons = _unit getVariable [QGVAR(jammedWeapons), []];

if (_weapon in _jammedWeapons) then {
  _jammedWeapons = _jammedWeapons - [_weapon];

  _unit setVariable [QGVAR(jammedWeapons), _jammedWeapons];

  if (count _jammedWeapons == 0) then {
    private "_id";

    _id = _unit getVariable [QGVAR(JammingActionID), -1];
    [_unit, "DefaultAction", _id] call EFUNC(common,removeActionEventHandler);
    _unit setVariable [QGVAR(JammingActionID), -1];
  };

  if !(_skipAnim) then {
    private "_clearJamAction";

    _clearJamAction = getText (configFile >> "CfgWeapons" >> _weapon >> "ACE_clearJamAction");

    if (_clearJamAction == "") then {
      _clearJamAction = getText (configFile >> "CfgWeapons" >> _weapon >> "reloadAction");
    };

    _unit playActionNow _clearJamAction;
  };
  if (_weapon == primaryWeapon _unit) then {
    playSound QGVAR(fixing_rifle);
  } else {
    if (_weapon == secondaryWeapon _unit) then {
      playSound QGVAR(fixing_pistol);
    };
  };
  [localize "STR_ACE_Overheating_WeaponUnjammed"] call EFUNC(common,displayTextStructured);
};
