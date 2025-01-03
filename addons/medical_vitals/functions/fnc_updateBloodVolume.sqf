#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Update unit blood volume
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Time since last update <NUMBER>
 * 2: Sync value? <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, 5, false] call ace_medical_vitals_fnc_updateBloodVolume
 *
 * Public: No
 */

params ["_unit", "_deltaT", "_syncValues"];

private _bleeding = -_deltaT * GET_BLOOD_LOSS(_unit);
private _ivChange = [_unit, _deltaT, _syncValues] call FUNC(consumeIVs);

private _bloodVolume = GET_BLOOD_VOLUME(_unit) + _bleeding + _ivChange;
_bloodVolume = 0 max _bloodVolume min DEFAULT_BLOOD_VOLUME;

// @todo: replace this and the rest of the setVariable with EFUNC(common,setApproximateVariablePublic)
_unit setVariable [VAR_BLOOD_VOL, _bloodVolume, _syncValues];
