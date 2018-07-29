/*
 * Author: Glowbal
 * Calculate the total blood loss of a unit.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * Total blood loss of unit <NUMBER>
 *
 * Example:
 * [bob] call ACE_medical_fnc_getBloodLoss
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

private _tourniquets = GET_TOURNIQUETS(_unit);
private _bodyPartBleeding = [0,0,0,0,0,0];
{
    _x params ["", "", "_bodyPart", "_amountOf", "_bleeeding"];
    if (_tourniquets select _bodyPart == 0) then {
        _bodyPartBleeding set [_bodyPart, (_bodyPartBleeding select _bodyPart) + (_amountOf * _bleeeding)];
    };
} forEach (_unit getVariable [QEGVAR(medical,openWounds), []]);

if (_bodyPartBleeding isEqualTo [0,0,0,0,0,0]) exitWith { 0 };

_bodyPartBleeding params ["_headBleeding", "_bodyBleeding", "_leftArmBleeding", "_rightArmBleeding", "_leftLegBleeding", "_rightLegBleeding"];
private _bodyBleedingRate = ((_headBleeding min 0.9) + (_bodyBleeding min 1.0)) min 1.0;
private _limbBleedingRate = ((_leftArmBleeding min 0.3) + (_rightArmBleeding min 0.3) + (_leftLegBleeding min 0.5) + (_rightLegBleeding min 0.5)) min 1.0;

// limb bleeding is scaled down based on the amount of body bleeding
_limbBleedingRate = _limbBleedingRate * (1 - _bodyBleedingRate);

private _cardiacOutput = [_unit] call FUNC(getCardiacOutput);
private _resistance = _unit getVariable [VAR_PERIPH_RES, DEFAULT_PERIPH_RES];

((_bodyBleedingRate + _limbBleedingRate) * _cardiacOutput * EGVAR(medical,bleedingCoefficient)) * (2 - (_resistance/100) min 0.1)
