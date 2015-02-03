/*
 * Author: commy2
 * TODO
 *
 * Arguments:
 * 0: _unit <OBJECT>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * TODO
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_1(_unit);

[_unit, "knockedOut", {
	if (local (_this select 0)) then {_this call ACE_Captives_fnc_handleKnockedOut};
}] call ACE_Core_fnc_addCustomEventhandler;

[_unit, "wokeUp", {
	if (local (_this select 0)) then {_this call ACE_Captives_fnc_handleWokeUp};
}] call ACE_Core_fnc_addCustomEventhandler;

// prevent players from throwing grenades
[_unit, "Throw", {(_this select 1) getVariable ["ACE_isCaptive", false]}, {}] call ACE_Core_fnc_addActionEventhandler;
