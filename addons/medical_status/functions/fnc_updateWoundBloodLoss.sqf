#include "script_component.hpp"
/*
 * Author: Glowbal
 * Update total wound bleeding based on open wounds and tourniquets
 * Wound bleeding = percentage of cardiac output lost
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player] call ace_medical_status_fnc_updateWoundBloodLoss
 *
 * Public: No
 */

params ["_unit"];

private _tourniquets = GET_TOURNIQUETS(_unit);
private _bodyPartBleeding = [0,0,0,0,0,0];
{
    _x params ["", "_bodyPart", "_amountOf", "_bleeeding"];
    if (_tourniquets select _bodyPart == 0) then {
        _bodyPartBleeding set [_bodyPart, (_bodyPartBleeding select _bodyPart) + (_amountOf * _bleeeding)];
    };
} forEach GET_OPEN_WOUNDS(_unit);

if (_bodyPartBleeding isEqualTo [0,0,0,0,0,0]) then {
    TRACE_1("updateWoundBloodLoss-none",_unit);
    _unit setVariable [VAR_WOUND_BLEEDING, 0, true];
} else {
    _bodyPartBleeding params ["_headBleeding", "_bodyBleeding", "_leftArmBleeding", "_rightArmBleeding", "_leftLegBleeding", "_rightLegBleeding"];
    private _bodyBleedingRate = ((_headBleeding min 0.9) + (_bodyBleeding min 1.0)) min 1.0;
    private _limbBleedingRate = ((_leftArmBleeding min 0.3) + (_rightArmBleeding min 0.3) + (_leftLegBleeding min 0.5) + (_rightLegBleeding min 0.5)) min 1.0;

    // limb bleeding is scaled down based on the amount of body bleeding
    _limbBleedingRate = _limbBleedingRate * (1 - _bodyBleedingRate);

    TRACE_3("updateWoundBloodLoss-bleeding",_unit,_bodyBleedingRate,_limbBleedingRate);
    _unit setVariable [VAR_WOUND_BLEEDING, _bodyBleedingRate + _limbBleedingRate, true];
};
