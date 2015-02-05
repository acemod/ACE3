/*
 * Author: Nic547
 * Attaches a Captive to the _unit
 *
 * Arguments:
 * 0: _unit-Player <OBJECT>
 * 1: target <OBJECT>
 * 2: _state <BOOL>
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

PARAMS_3(_unit,_target,_state);

if !("ACE_Handcuffed" in ([_target] call EFUNC(common,getCaptivityStatus))) exitWith {
  [localize "STR_ACE_Captives_NoCaptive"] call EFUNC(common,displayTextStructured);
};

if (_state) then {
  if (_unit getVariable [QGVAR(isEscorting), false]) exitWith {};

  [_unit, _target] call EFUNC(common,claim);
  _unit setVariable [QGVAR(isEscorting), true, true];

  _target attachTo [_unit, [0, 1, 0]];

  _unit setVariable ["ACE_escortedUnit", _target, true];
  _actionID = _unit addAction [format ["<t color='#FF0000'>%1</t>", localize "STR_ACE_Captives_StopEscorting"], "[_unit getVariable ['ACE_escortedUnit', objNull], false] call ACE_Captives_fnc_escortCaptive;", nil, 20, false, true, "", "!isNull (_unit getVariable ['ACE_escortedUnit', objNull])"];

  [_target, _actionID] spawn {
    _target = _this select 0;
    _actionID = _this select 1;

    while {_unit getVariable [QGVAR(isEscorting), false]} do {
      sleep 0.2;

      if (!alive _target || {!alive _unit} || {!canStand _target} || {!canStand _unit} || {_target getVariable ["ACE_isUnconscious", false]} || {_unit getVariable ["ACE_isUnconscious", false]} || {!isNull (attachedTo _unit)}) then {
        _unit setVariable [QGVAR(isEscorting), false, true];
      };
    };
    [objNull, _target] call EFUNC(common,claim);

    detach _target;
    _unit removeAction _actionID;
  };
} else {
  _unit setVariable [QGVAR(isEscorting), false, true];
  _unit setVariable ["ACE_escortedUnit", objNull, true];
};
