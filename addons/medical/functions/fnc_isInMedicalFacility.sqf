/*
 * Author: Glowbal
 * Checks if a unit is in a designated medical facility
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * ReturnValue:
 * Is in medical facility <BOOL>
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_eyePos", "_objects", "_isInBuilding", "_medicalFacility"];
params ["_unit"];

_eyePos = eyePos _unit;
_isInBuilding = false;

_medicalFacility =
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

_objects = (lineIntersectsWith [_unit modelToWorldVisual [0, 0, (_eyePos select 2)], _unit modelToWorldVisual [0, 0, (_eyePos select 2) +10], _unit]);
{
    if (((typeOf _x) in _medicalFacility) || (_x getVariable [QGVAR(isMedicalFacility),false])) exitWith {
        _isInBuilding = true;
    };
} foreach _objects;
if (!_isInBuilding) then {
    _objects = position _unit nearObjects 7.5;
    {
        if (((typeOf _x) in _medicalFacility) || (_x getVariable [QGVAR(isMedicalFacility),false])) exitWith {
            _isInBuilding = true;
        };
    } foreach _objects;
};
_isInBuilding;
