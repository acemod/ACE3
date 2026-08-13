#include "..\script_component.hpp"
/*
 * Author: johnb43
 * Makes a unit catch fire. Only call from targeted events, is applied globally.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Fire intensity <NUMBER>
 * 2: Fire instigator <OBJECT> (default: objNull)
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
TRACE_3("burn",_unit,_intensity,_instigator);

if (BURN_MIN_INTENSITY > _intensity) exitWith {
    TRACE_3("intensity is too low",_unit,_intensity,BURN_MIN_INTENSITY);
};

// Check if unit is remote (objNull is remote)
if (!local _unit) exitWith {
    TRACE_1("unit is null or not local",_unit);
};

// Check if the unit can burn (takes care of spectators and curators)
if (getNumber (configOf _unit >> "isPlayableLogic") == 1 || {!(_unit isKindOf "CAManBase")}) exitWith {
    TRACE_1("unit is virtual or not a man",_unit);
};

// If unit is invulnerable, don't burn the unit
if !(isDamageAllowed _unit && {_unit getVariable [QEGVAR(medical,allowDamage), true]}) exitWith {
    TRACE_1("unit is invulnerable",_unit);
};

private _protection = getNumber (configFile >> "CfgWeapons" >> uniform _unit >> QGVAR(protection));
if (_protection == 1) exitWith {
    TRACE_2("unit's uniform is immune to fire",_unit,uniform _unit);
};

_intensity = _intensity * (1 - _protection);

private _eyePos = eyePos _unit;

// Check if unit is mostly submerged in water
if (surfaceIsWater _eyePos && {(_eyePos select 2) < 0.1}) exitWith {
    TRACE_1("unit is in water",_unit);
};

// If unit is already burning, update intensity, but don't add another PFH
if (_unit call FUNC(isBurning)) exitWith {
    // Only allow intensity to be increased
    if (_intensity <= (_unit getVariable [QGVAR(intensity), 0])) exitWith {
        TRACE_2("unit already burning, no intensity update",_unit,_intensity);
    };

    TRACE_2("unit already burning, updating intensity",_unit,_intensity);

    _unit setVariable [QGVAR(intensity), _intensity, true];
};

TRACE_2("setting unit ablaze",_unit,_intensity);

_unit setVariable [QGVAR(intensity), _intensity, true];

// Fire simulation (fire sources are handled differently)
[QGVAR(burnSimulation), [_unit, _instigator], _unit] call CBA_fnc_targetEvent;

// Spawn effects for unit
private _burnEffectsJipID = [QGVAR(burnEffects), _unit] call CBA_fnc_globalEventJIP;
[_burnEffectsJipID, _unit] call CBA_fnc_removeGlobalEventJIP;

_unit setVariable [QGVAR(jipID), _burnEffectsJipID, true];
