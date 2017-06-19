/*
 * Author: Glowbal
 * Checks if a unit is in a designated medical facility
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * Is in medical facility <BOOL>
 *
 * Example:
 * [player] call ace_medical_fnc_isInMedicalFacility
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit"];

//Cache the results as this function could be called rapidly
(_unit getVariable [QGVAR(cacheInFacility), [-9, false]]) params ["_expireTime", "_lastResult"];
if (CBA_missionTime < _expireTime) exitWith {_lastResult};

private _eyePos = eyePos _unit;
private _isInBuilding = false;

private _medicalFacility =
    [
        "TK_GUE_WarfareBFieldhHospital_Base_EP1",
        "TK_GUE_WarfareBFieldhHospital_EP1",
        "TK_WarfareBFieldhHospital_Base_EP1",
        "TK_WarfareBFieldhHospital_EP1",
        "US_WarfareBFieldhHospital_Base_EP1",
        "US_WarfareBFieldhHospital_EP1",
        "MASH_EP1",
        "MASH",
        "Land_A_Hospital",
        "CDF_WarfareBFieldhHospital",
        "GUE_WarfareBFieldhHospital",
        "INS_WarfareBFieldhHospital",
        "RU_WarfareBFieldhHospital",
        "USMC_WarfareBFieldhHospital"
    ];

private _objects = (lineIntersectsWith [_unit modelToWorldVisual [0, 0, (_eyePos select 2)], _unit modelToWorldVisual [0, 0, (_eyePos select 2) +10], _unit]);
{
    if (((typeOf _x) in _medicalFacility) || (_x getVariable [QGVAR(isMedicalFacility),false])) exitWith {
        _isInBuilding = true;
    };
} forEach _objects;
if (!_isInBuilding) then {
    _objects = _unit nearObjects 7.5;
    {
        if (((typeOf _x) in _medicalFacility) || (_x getVariable [QGVAR(isMedicalFacility),false])) exitWith {
            _isInBuilding = true;
        };
    } forEach _objects;
};

//Save the results (with a 1 second expiry)
_unit setVariable [QGVAR(cacheInFacility), [CBA_missionTime + 1, _isInBuilding]];

_isInBuilding;
