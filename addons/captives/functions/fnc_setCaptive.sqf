/*
 * Author: Nic547, commy2
 * Makes a civilian unable to move.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: True to take captive, false to release captive <BOOL>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * TODO
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_unit,_state);

if (!local _unit) exitWith {[[_unit, _state, true], _fnc_scriptName, _unit] call ACE_Core_fnc_execRemoteFnc};

if (_state) then {
  if (_unit getVariable ["ACE_isCaptive", false]) exitWith {};

  _unit setVariable ["ACE_isCaptive", true, true];

  // fix anim on mission start (should work on dedicated servers)
  _unit spawn {
    [_this, "ACE_Handcuffed", true] call ACE_Core_fnc_setCaptivityStatus;

    if (_this getVariable ["ACE_isCaptive", false] && {vehicle _this == _this}) then {
      [_this] call EFUNC(common,fixLoweredRifleAnimation);
      [_this, "ACE_AmovPercMstpScapWnonDnon", 0] spawn EFUNC(common,doAnimation);
    };
  };

  _unit setVariable ["ACE_Captives_CargoIndex", vehicle _unit getCargoIndex _unit, true];

  if (_unit == ACE_player) then {
    showHUD false;
  };
} else {
  if !(_unit getVariable ["ACE_isCaptive", false]) exitWith {};

  _unit setVariable ["ACE_isCaptive", false, true];
  [_unit, "ACE_Handcuffed", false] call ACE_Core_fnc_setCaptivityStatus;
  if (vehicle _unit == _unit) then {
    [_unit, "ACE_AmovPercMstpScapWnonDnon_AmovPercMstpSnonWnonDnon", 2] call EFUNC(common,doAnimation);
  };

  if (_unit getVariable ["ACE_Captives_CargoIndex", -1] != -1) then {
    _unit setVariable ["ACE_Captives_CargoIndex", -1, true];
  };

  if (_unit == ACE_player) then {
    showHUD true;
  };
};
