/*
 * Author: Nic547
 * Attaches a Captive to the player
 *
 * Arguments:
 * 0: _unit <OBJECT>
 * 1: _state <BOOL>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * -
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_unit,_state);

if !("ACE_Handcuffed" in ([_unit] call ACE_Core_fnc_getCaptivityStatus)) exitWith {
  [localize "STR_ACE_Captives_NoCaptive"] call EFUNC(common,displayTextStructured);
};

if (_state) then {
  if (player getVariable ["ACE_isEscorting", false]) exitWith {};

  [player, _unit] call EFUNC(common,claim);
  player setVariable ["ACE_isEscorting", true, true];

  _unit attachTo [player, [0, 1, 0]];

  player setVariable ["ACE_escortedUnit", _unit, true];
  _actionID = player addAction [format ["<t color='#FF0000'>%1</t>", localize "STR_ACE_Captives_StopEscorting"], "[player getVariable ['ACE_escortedUnit', objNull], false] call ACE_Captives_fnc_escortCaptive;", nil, 20, false, true, "", "!isNull (player getVariable ['ACE_escortedUnit', objNull])"];

  [_unit, _actionID] spawn {
    _unit = _this select 0;
    _actionID = _this select 1;

    while {player getVariable ["ACE_isEscorting", false]} do {
      sleep 0.2;

      if (!alive _unit || {!alive player} || {!canStand _unit} || {!canStand player} || {_unit getVariable ["ACE_isUnconscious", false]} || {player getVariable ["ACE_isUnconscious", false]} || {!isNull (attachedTo player)}) then {
        player setVariable ["ACE_isEscorting", false, true];
      };
    };
    [objNull, _unit] call EFUNC(common,claim);

    detach _unit;
    player removeAction _actionID;
  };
} else {
  player setVariable ["ACE_isEscorting", false, true];
  player setVariable ["ACE_escortedUnit", objNull, true];
};
