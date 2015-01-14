/**
 * fn_inMedicalFacility_CMS.sqf
 * @Descr:  Checks if a unit is in a designated medical facility
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: BOOL true if unit is in a building or under a roof.
 * @PublicAPI: true
 */

#include "script_component.hpp"

private ["_unit","_eyePos","_objects","_isInBuilding","_medicalFacility"];
_unit = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_Param;

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

_objects = (lineIntersectsWith [_unit modelToWorld [0, 0, (_eyePos select 2)], _unit modelToWorld [0, 0, (_eyePos select 2) +10], _unit]);
{
	if (((typeOf _x) in _medicalFacility) || (_x getVariable [QGVAR(isMedicalFacility),false])) exitwith {
		_isInBuilding = true;
	};
}foreach _objects;
if (!_isInBuilding) then {
	_objects = position _unit nearObjects 7.5;
	{
		if (((typeOf _x) in _medicalFacility) || (_x getVariable [QGVAR(isMedicalFacility),false])) exitwith {
			_isInBuilding = true;
		};
	}foreach _objects;
};
_isInBuilding