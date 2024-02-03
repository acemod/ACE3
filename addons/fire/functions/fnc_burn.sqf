#include "..\script_component.hpp"
/*
 * Author: tcvm, johnb43
 * Makes object catch fire. Only call from targeted events, is applied globally.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
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
    EGVAR(common,runAtSettingsInitialized) pushBack [FUNC(burn), _this];
};

if (!GVAR(enabled)) exitWith {};

params ["_unit", "_intensity", ["_instigator", objNull]];

// Check if unit is remote (objNull is remote)
if (!local _unit) exitWith {};

// Check if the unit can burn (takes care of spectators and curators)
if (getNumber (configOf _unit >> "isPlayableLogic") == 1) exitWith {};

// If unit is invulnerable, don't burn unit
if !(isDamageAllowed _unit && {_unit getVariable [QEGVAR(medical,allowDamage), true]}) exitWith {};

// If unit is already burning, don't burn more
if (_unit call FUNC(isBurning)) exitWith {};

_unit setVariable [QGVAR(intensity), _intensity, true];

// Fire simulation
private _burnSimulationJipID = [QGVAR(burnSimulation), [_unit, _instigator], format [QGVAR(burnSimulation_%1), hashValue _unit]] call CBA_fnc_globalEventJIP;
[_burnSimulationJipID, _unit] call CBA_fnc_removeGlobalEventJIP;

// Spawn effects for unit
private _burnEffectsJipID = [QGVAR(burnEffects), _unit, format [QGVAR(burnEffects_%1), hashValue _unit]] call CBA_fnc_globalEventJIP;
[_burnEffectsJipID, _unit] call CBA_fnc_removeGlobalEventJIP;

_unit setVariable [QGVAR(jipIDs), [_burnSimulationJipID, _burnEffectsJipID], true];

// Play screams and optional weapon dropping
if (_unit call EFUNC(common,isAwake)) then {
    [_unit, false] call FUNC(burnReaction);
};
