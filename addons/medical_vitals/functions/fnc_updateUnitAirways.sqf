#include "script_component.hpp"
/*
 * Author: Glowbal
 * Update the pain suppression
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Unit's current SpO2 <NUMBER>
 * 2: Time since last update <NUMBER>
 * 3: Sync value? <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, 95, 1, true] call ace_medical_vitals_fnc_handleUnitAirways
 *
 * Public: No
 */
 
params ["_unit", "_spo2", "_deltaT", "_syncValue"];

if (_spo2 < 100 ) then {
    _syncValue = true;
};

private _newSpo2 = _spo2;
private _adjustment = 0;
private _updateDamageEffects = false;
private _pneumo = GET_PNEUMO(_unit);
private _inCrdc = IN_CRDC_ARRST(_unit);
private _blocked = GET_AIRWAY_BLOCKED(_unit);
private _collapsed = GET_AIRWAY_COLLAPSED(_unit);
private _airSupliment = _unit getVariable [QEGVAR(medical,air_supliment), 0];
private _receivingAir = alive (_unit getVariable [QEGVAR(medical,air_provider), objNull]);
private _maximumDrop = (EGVAR(medical,pneumoMultiplier) + EGVAR(medical,collapsedMultiplier) + EGVAR(medical,blockageMultiplier));

if(_blocked || _collapsed || _pneumo || _inCrdc) then {
    if(_inCrdc) then {
        _adjustment = [-0.3 , _airSupliment] select (_receivingAir);
        _multiplier = [EGVAR(medical,airwayDegradationMultiplier), EGVAR(medical,airwayRecoveryMultiplier)] select (_receivingAir);
        _adjustment = _adjustment * _multiplier;            
    } else {
        private _pneumoAdjustment = [0, 1] select _pneumo;
        private _blockedAdjustment = [0, 1] select _blocked;
        private _collapsedAdjustment = [0, 1] select _collapsed;
        private _degredationSum = (_pneumoAdjustment * EGVAR(medical,pneumoMultiplier)) + (_collapsedAdjustment * EGVAR(medical,collapsedMultiplier)) + (_blockedAdjustment * EGVAR(medical,blockageMultiplier));
        _adjustment = linearConversion [0, _maximumDrop ,_degredationSum, 0, 0.3, true];
        _adjustment = _adjustment * -EGVAR(medical,airwayDegradationMultiplier);
    };
    _newSpo2 = ((_spo2 + _deltaT * _adjustment)  max 65) min 100;
    if((_spo2 > 95 && _newSpo2 < 95) || {_spo2 > 85 && _newSpo2 < 85} || {_newSpo2 > 95 && _spo2 < 95} || {_newSpo2 > 85 && _spo2 < 85}) then {
        _updateDamageEffects = true;
    };
} else {
    // nothing impairing breathing
    if(_spo2 < 100 && !_inCrdc ) then {
        private _increaseValue = 2 * EGVAR(medical,airwayRecoveryMultiplier);
        _newSpo2 = (_spo2 + _deltaT * _increaseValue) min 100;
        if((_newSpo2 > 95 && _spo2 < 95) || {_newSpo2 > 85 && _spo2 < 85}) then {
            _updateDamageEffects = true;
        };
    };
};
_unit setVariable [VAR_SPO2, _newSpo2 , _syncValue];
if (_updateDamageEffects) then {
    [_unit] call EFUNC(medical_engine,updateDamageEffects);
};

_newSpo2