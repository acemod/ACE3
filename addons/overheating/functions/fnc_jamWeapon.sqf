// based on KK_fnc_playerWeaponMulfunction from KillzoneKid
#include "script_component.hpp"

private ["_unit", "_weapon", "_jammedWeapons"];

_unit = _this select 0;
_weapon = _this select 1;

// don't jam a weapon with no rounds left
if (_unit ammo _weapon == 0) exitWith {};

_jammedWeapons = _unit getVariable [QGVAR(jammedWeapons), []];
_jammedWeapons pushBack _weapon;

_unit setVariable [QGVAR(jammedWeapons), _jammedWeapons];

// this is to re-activate the 'DefaultAction', so you can jam a weapon while full auto shooting
[_unit, _weapon] spawn {
  _unit = _this select 0;
  _weapon = _this select 1;

  _ammo = _unit ammo _weapon;

  _frame = diag_frameno;

  if (_ammo > 0) then {
    _unit setAmmo [_weapon, 0];

    waitUntil {_frame < diag_frameno};

    _unit setAmmo [_weapon, _ammo];
    //[localize "STR_ACE_Overheating_WeaponJammed"] call EFUNC(core,displayTextStructured);
  };
};

// only display the hint once, after you try to shoot an already jammed weapon
GVAR(knowAboutJam) = false;

if (_unit getVariable [QGVAR(JammingActionID), -1] == -1) then {
  private ["_condition", "_statement", "_condition2", "_statement2", "_id"];

  _condition = {
    [_this select 1] call EFUNC(core,canUseWeapon)
    && {currentMuzzle (_this select 1) in ((_this select 1) getVariable [QGVAR(jammedWeapons), []])}
    && {!(currentMuzzle (_this select 1) in ((_this select 1) getVariable [QEGVAR(safemode,safedWeapons), []]))}
  };

  _statement = {
    playSound3D ["a3\sounds_f\weapons\Other\dry9.wss", _this select 0];

    if (!(missionNamespace getVariable [QGVAR(knowAboutJam), false]) && {(_this select 1) ammo currentWeapon (_this select 1) > 0}) then {
      [localize "STR_ACE_Overheating_WeaponJammed"] call EFUNC(core,displayTextStructured);
      GVAR(knowAboutJam) = true;
    };
  };

  _condition2 = {
    currentWeapon (_this select 1) in ((_this select 1) getVariable [QGVAR(jammedWeapons), []])
  };

  _statement2 = {
    [_this select 1, currentWeapon (_this select 1), false] call FUNC(clearJam);
  };

  //_id = [_unit, format ["<t color=""#FFFF00"" >%1</t>", localize "STR_ACE_Overheating_UnjamWeapon"], "DefaultAction", _condition, _statement, _condition2, _statement2, 10] call EFUNC(core,addActionMenuEventHandler);
  _id = [_unit, "DefaultAction", _condition, _statement] call EFUNC(core,addActionEventHandler);

  _unit setVariable [QGVAR(JammingActionID), _id];
};
