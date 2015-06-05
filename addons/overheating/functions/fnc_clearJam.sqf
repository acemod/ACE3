/*
 * Author: Commy2
 * Make the unit clear the jam from a weapon
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Weapon <STRING>
 * 2: Skip anim? <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
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
    if (_weapon == primaryWeapon _unit) then {
      playSound QGVAR(fixing_rifle);
    } else {
      if (_weapon == secondaryWeapon _unit) then {
        playSound QGVAR(fixing_pistol);
      };
    };
  };

  if (GVAR(DisplayTextOnJam)) then {
    [localize LSTRING(WeaponUnjammed)] call EFUNC(common,displayTextStructured);
  };
};
