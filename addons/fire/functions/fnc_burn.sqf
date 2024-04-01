#include "..\script_component.hpp"
/*
 * Author: johnb43
 * Makes a unit catch fire. Only call from targeted events, is applied globally.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Intensity of fire <NUMBER>
 * 2: Instigator of fire <OBJECT> (default: objNull)
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, 4] call ace_fire_fnc_burn
 *
 * Public: No
 */

if (!EGVAR(common,settingsInitFinished)) exitWith {
    EGVAR(common,runAtSettingsInitialized) pushBack [LINKFUNC(burn), _this];
};

if (!GVAR(enabled)) exitWith {};

params ["_unit", "_intensity", ["_instigator", objNull]];

if (BURN_MIN_INTENSITY > _intensity) exitWith {};

// Check if unit is remote (objNull is remote)
if (!local _unit) exitWith {};

// Check if the unit can burn (takes care of spectators and curators)
if (getNumber (configOf _unit >> "isPlayableLogic") == 1 || {!(_unit isKindOf "CAManBase")}) exitWith {};

// If unit is invulnerable, don't burn the unit
if !(isDamageAllowed _unit && {_unit getVariable [QEGVAR(medical,allowDamage), true]}) exitWith {};

private _eyePos = eyePos _unit;

// Check if unit is mostly submerged in water
if (surfaceIsWater _eyePos && {(_eyePos select 2) < 0.1}) exitWith {};

// If unit is already burning, update intensity, but don't add another PFH
if (_unit call FUNC(isBurning)) exitWith {
    _unit setVariable [QGVAR(intensity), _intensity, true];
};

_unit setVariable [QGVAR(intensity), _intensity, true];

// Fire simulation (objects are handled differently)
[QGVAR(burnSimulation), [_unit, _instigator], _unit] call CBA_fnc_targetEvent;

// Spawn effects for unit
private _burnEffectsJipID = [QGVAR(burnEffects), _unit] call CBA_fnc_globalEventJIP;
[_burnEffectsJipID, _unit] call CBA_fnc_removeGlobalEventJIP;

_unit setVariable [QGVAR(jipID), _burnEffectsJipID, true];
