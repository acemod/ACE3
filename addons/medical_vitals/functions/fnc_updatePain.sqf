#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Update unit pain
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Sync value? <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, false] call ace_medical_vitals_fnc_updatePain
 *
 * Public: No
 */

params ["_unit", "_syncValues"];

// Handle pain due to tourniquets, that have been applied more than 120 s ago
private _activeTourniquets = GET_TOURNIQUETS(_unit) - [0];
if (_activeTourniquets isEqualTo []) exitWith {};

private _oldestTourniquetTime = selectMin _activeTourniquets;
private _tourniquetPainSeconds = CBA_missionTime - _oldestTourniquetTime - TOURNIQUET_MIN_TIME_FOR_PAIN;
if (_tourniquetPainSeconds <= 0) exitWith {};

[_unit, _tourniquetPainSeconds * TOURNIQUET_PAIN_PER_SECOND] call EFUNC(medical_status,adjustPainLevel);
