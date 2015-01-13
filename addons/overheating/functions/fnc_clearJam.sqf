// by commy2
#include "script_component.hpp"

private ["_unit", "_weapon", "_skipAnim", "_jammedWeapons"];

_unit = _this select 0;
_weapon = _this select 1;
_skipAnim = _this select 2;

_jammedWeapons = _unit getVariable [QGVAR(jammedWeapons), []];

if (_weapon in _jammedWeapons) then {
  _jammedWeapons = _jammedWeapons - [_weapon];

  _unit setVariable [QGVAR(jammedWeapons), _jammedWeapons];

  if (count _jammedWeapons == 0) then {
    private "_id";

    _id = _unit getVariable [QGVAR(JammingActionID), -1];
    [_unit, "DefaultAction", _id] call EFUNC(core,removeActionEventHandler);
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

  [localize "STR_ACE_Overheating_WeaponUnjammed"] call EFUNC(core,displayTextStructured);
};
