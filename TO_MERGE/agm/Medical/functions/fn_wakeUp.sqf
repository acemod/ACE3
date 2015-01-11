/*
 * By: KoffeinFlummi
 *
 * Wakes an unconscious player up.
 *
 * Arguments:
 * 0: Unconscious unit (Object)
 *
 * Return Values:
 * None
 */

private ["_unit", "_position"];

_unit = _this select 0;

// Hand it off to local unit
if !(local _unit) exitWith {
  [_this, "AGM_Medical_fnc_wakeUp", _unit] call AGM_Core_fnc_execRemoteFnc;
};

_unit enableAI "MOVE";
//_unit enableAI "ANIM";
_unit enableAI "TARGET";
_unit enableAI "AUTOTARGET";
_unit enableAI "FSM";
_unit disableConversation false;

if !(_unit getVariable ["AGM_NoRadio_isMuted", false]) then {
  [_unit] call AGM_Core_fnc_unmuteUnit;
};

_unit setVariable ["AGM_Unconscious", False, True]; // deprecated since 0.95
_unit setVariable ["AGM_isUnconscious", False, True];
_unit setVariable ["AGM_canTreat", True, True];

_unit setVariable ["tf_globalVolume", 1];
_unit setVariable ["tf_voiceVolume", 1, True];
_unit setVariable ["tf_unable_to_use_radio", False, True];

_unit setVariable ["acre_sys_core_isDisabled", False, True];
_unit setVariable ["acre_sys_core_globalVolume", 1];

if (_unit == AGM_player) then {
  [False] call AGM_Core_fnc_disableUserInput;
};

[_unit, "AGM_Unconscious", False] call AGM_Core_fnc_setCaptivityStatus;

// handle parachute
if (vehicle _unit == _unit) then {
  _unit setVariable ["AGM_OriginalAnim", "", True];
};

[_unit, _unit getVariable "AGM_OriginalAnim", 2, True] call AGM_Core_fnc_doAnimation;

[_unit, "wokeUp", [_unit]] call AGM_Core_fnc_callCustomEventHandlersGlobal;

if !(scriptDone (_unit getVariable "AGM_UnconsciousnessTimer")) then {
  terminate (_unit getVariable "AGM_UnconsciousnessTimer");
};
if !(scriptDone (_unit getVariable "AGM_WakeUpTimer")) then {
  terminate (_unit getVariable "AGM_WakeUpTimer");
};
