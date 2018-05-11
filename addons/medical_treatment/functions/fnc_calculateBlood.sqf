/*
 * Author: Zakant
 * Calculate the blood lost and blood volume for a unit. Used from CPR to simulate a heart rate while in cardiac arrest.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params["_unit"];

// We will just simulate blood flow for now!
private _lastTimeUpdated = _unit getVariable [QEGVAR(medical,lastTimeUpdated), CBA_missionTime];
private _deltaT = CBA_missionTime - _lastTimeUpdated;

private _lastTimeValuesSynced = _unit getVariable [QEGVAR(medical,lastMomentValuesSynced), 0];
private _syncValues = (CBA_missionTime - _lastTimeValuesSynced) >= (10 + floor(random(10)));

_unit setVariable [QEGVAR(medical,lastTimeUpdated), CBA_missionTime];
if (_deltaT != 0) then {
    private _change = ([_unit, _deltaT, _syncValues] call EFUNC(medical_status,getBloodVolumeChange));
    private _bloodVolume = 0 max (GET_BLOOD_VOLUME(_unit) + _change) min DEFAULT_BLOOD_VOLUME;
    _unit setVariable [VAR_BLOOD_VOL, _bloodVolume, _syncValues];
};
