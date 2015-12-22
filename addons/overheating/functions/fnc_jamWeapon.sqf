/*
 * Author: Commy2, based on KK_fnc_playerWeaponMulfunction from KillzoneKid
 * Jam the weapon
 *
 * Argument:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 *
 * Return value:
 * None
 *
 * Public: No
 */
#include "\z\ace\addons\overheating\script_component.hpp"

EXPLODE_2_PVT(_this,_unit,_weapon);

// don't jam a weapon with no rounds left
if (_unit ammo _weapon == 0) exitWith {};

private ["_jammedWeapons"];
_jammedWeapons = _unit getVariable [QGVAR(jammedWeapons), []];
_jammedWeapons pushBack _weapon;

_unit setVariable [QGVAR(jammedWeapons), _jammedWeapons];


// this is to re-activate the 'DefaultAction', so you can jam a weapon while full auto shooting
_fnc_stopCurrentBurst = {
  EXPLODE_2_PVT(_this,_params,_pfhId);
  EXPLODE_4_PVT(_params,_unit,_weapon,_ammo,_startFrame);

  // Skip the first execution of the PFH
  if (diag_frameno == _startFrame) exitWith {};

  // Remove the PFH on the second execution
  [_pfhId] call CBA_fnc_removePerFrameHandler;

  _unit setAmmo [_weapon, _ammo];
};

// Stop current burst
_ammo = _unit ammo _weapon;
if (_ammo > 0) then {
    _unit setAmmo [_weapon, 0];
    [_fnc_stopCurrentBurst, 0, [_unit, _weapon, _ammo, diag_frameno]] call CBA_fnc_addPerFrameHandler;
};

// only display the hint once, after you try to shoot an already jammed weapon
GVAR(knowAboutJam) = false;

if (_unit getVariable [QGVAR(JammingActionID), -1] == -1) then {
  private ["_condition", "_statement", "_condition2", "_statement2", "_id"];

  _condition = {
    [_this select 1] call EFUNC(common,canUseWeapon)
    && {currentMuzzle (_this select 1) in ((_this select 1) getVariable [QGVAR(jammedWeapons), []])}
    && {!(currentMuzzle (_this select 1) in ((_this select 1) getVariable [QEGVAR(safemode,safedWeapons), []]))}
  };

  _statement = {
    playSound3D ["a3\sounds_f\weapons\Other\dry9.wss", _this select 0];

    if (!(missionNamespace getVariable [QGVAR(knowAboutJam), false]) && {(_this select 1) ammo currentWeapon (_this select 1) > 0} && {GVAR(DisplayTextOnJam)}) then {
      [localize LSTRING(WeaponJammed)] call EFUNC(common,displayTextStructured);
      GVAR(knowAboutJam) = true;
    };
  };

  _condition2 = {
    currentWeapon (_this select 1) in ((_this select 1) getVariable [QGVAR(jammedWeapons), []])
  };

  _statement2 = {
    [_this select 1, currentWeapon (_this select 1), false] call FUNC(clearJam);
  };

  //_id = [_unit, format ["<t color=""#FFFF00"" >%1</t>", localize LSTRING(UnjamWeapon)], "DefaultAction", _condition, _statement, _condition2, _statement2, 10] call EFUNC(common,addActionMenuEventHandler);
  _id = [_unit, "DefaultAction", _condition, _statement] call EFUNC(common,addActionEventHandler);

  _unit setVariable [QGVAR(JammingActionID), _id];
};
