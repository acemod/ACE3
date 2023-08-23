#include "script_component.hpp"
/*
 * Author: Pterolatypus
 * Calculate the stroke volume.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 *    stroke volume (ml) <NUMBER>
 *
 * Example:
 * [player] call ace_medical_status_fnc_getStrokeVolume
 *
 * Public: No
 */

// Value taken from https://doi.org/10.1093%2Feurheartj%2Fehl336
// as 94/95 ml ± 15 ml
#define VENTRICLE_STROKE_VOL 95e-3

params ["_unit"];

private _heartRate = GET_HEART_RATE(_unit);
private _bloodVolumeRatio = GET_BLOOD_VOLUME(_unit) / DEFAULT_BLOOD_VOLUME;
_unit getVariable [VAR_BLOOD_PRESS, DEFAULT_BLOOD_PRESSURE] params ["_bpLow", "_bpHigh", "_bpMean"];

// Blood is pushed into the heart by Central Venous Pressure
// Approximated here using blood volume and (arterial) blood pressure
private _fillPressure = 0.7*_bloodVolumeRatio + 0.3*_bpMean/DEFAULT_BP_MEAN;
// Afterload (the force the heart must overcome to pump blood) depends primarily on systolic bp
private _afterload = _bpHigh/DEFAULT_BP_HIGH;
// TODO: Force of the heart contraction is influenced by medication.
private _contractility = 1;

// End diastolic volume (volume the heart fills to) based on filling pressure and time available to fill
private _fillTime = DEFAULT_HEART_RATE/_heartRate;
private _fillPortion = 1 - exp (-3*_fillTime);
private _edv = _fillPortion * _fillPressure * 1.053 * 1.5 * VENTRICLE_STROKE_VOL;

// End systolic volume (volume the heart contracts to) is based on afterload and contractility
private _esv = _afterload/_contractility * 0.5*VENTRICLE_STROKE_VOL;

private _strokeVol = (_edv - _esv) max 0;

#ifdef DEBUG_MODE_FULL
if (_unit getVariable [QGVAR(trace_strokevol), false]) then {
	TRACE_10("Stroke volume trace",_bpHigh,_bpMean,_heartRate,_fillPressure,_fillTime,_fillPortion,_afterload,_edv,_esv,_strokeVol);
}
#endif
_strokeVol