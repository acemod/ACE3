#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Condition for being dazed
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Returns:
 * <BOOL>
 *
 * Example:
 * [player] call ace_medical_status_fnc_canBecomeDazed
 *
 * Public: No
 */

if (EGVAR(medical,dazedChance) == 0) exitWith { false };

params ["_unit"];

// only for players
if (_unit != ACE_player) exitWith { false };
// skip if in a vic or odd animation
if (!isNull objectParent _unit) exitWith { false };
if (!isTouchingGround _unit) exitWith { false };
if (surfaceIsWater position _unit) exitWith { false };

// less restrictive than hasStableVitals
if (GET_BLOOD_VOLUME(_unit) < BLOOD_VOLUME_CLASS_3_HEMORRHAGE) exitWith { false };
if IN_CRDC_ARRST(_unit) exitWith { false };

private _bloodPressure = GET_BLOOD_PRESSURE(_unit);
_bloodPressure params ["_bloodPressureL", "_bloodPressureH"];
if (_bloodPressureL < 50 || {_bloodPressureH < 60}) exitWith { false };

private _heartRate = GET_HEART_RATE(_unit);
if (_heartRate < 40) exitWith { false };

true
