/*
 * Author: PabstMirror
 * Interface to allow external modules to safely adjust pain levels.
 *
 * Arguments:
 * 0: The patient <OBJECT>
 * 1: Added ammount of pain (can be negative) <NUMBER>
 *
 * Return Value:
 * The new pain level <NUMBER>
 *
 * Example:
 * [guy, 0.5] call ace_medical_fnc_adjustPainLevel
 *
 * Public: Yes
 */
#include "script_component.hpp"

private ["_pain"];

params ["_unit", "_addedPain"];

//Only run on local units:
if (!local _unit) exitWith {ERROR("unit is not local");};

//Ignore if medical system disabled:
if (GVAR(level) == 0) exitWith {};

_pain = _unit getVariable [QGVAR(pain), 0];

_pain = _pain + _addedPain;
if (GVAR(level) == 1) then {_pain = _pain min 1;}; //for basic, cap at 1
_pain = _pain max 0;

_unit setVariable [QGVAR(pain), _pain];

//Start up the vital watching (if not already running)
[_unit] call FUNC(addToInjuredCollection);

_pain
