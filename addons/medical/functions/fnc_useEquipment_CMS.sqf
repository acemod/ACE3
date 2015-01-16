/**
 * fn_useEquipment_CMS.sqf
 * @Descr: Use Equipment if any is available. Priority: 1) Medic, 2) Patient. If in vehicle: 3) Crew
 * @Author: Glowbal
 *
 * @Arguments: [medic OBJECT, patient OBJECT, item STRING (ClassName of magazine item)]
 * @Return: BOOL
 * @PublicAPI: true
 */

#include "script_component.hpp"

private ["_medic", "_patient", "_item", "_return","_crew"];
_medic = _this select 0;
_patient = _this select 1;
_item = _this select 2;

if (isnil QGVAR(setting_allowSharedEquipment)) then {
	GVAR(setting_allowSharedEquipment) = true;
};

if (GVAR(setting_allowSharedEquipment) && {[_patient, _item] call EFUNC(common,hasItem)}) exitwith {
	[[_patient, _item], QUOTE(EFUNC(common,useItem)), _patient] call BIS_fnc_MP;
	true;
};

if ([_medic, _item] call EFUNC(common,hasItem)) exitwith {
	[[_medic, _item], QUOTE(EFUNC(common,useItem)), _medic] call BIS_fnc_MP;
	true;
};

_return = false;
if ([vehicle _medic] call FUNC(isMedicalVehicle_CMS) && {vehicle _medic != _medic}) then {
	_crew = crew vehicle _medic;
	{
		if ([_x, _medic] call FUNC(canAccessMedicalEquipment_CMS) && {([_x, _item] call EFUNC(common,hasItem))}) exitwith {
			_return = true;
			[[_x, _item], QUOTE(EFUNC(common,useItem)), _x] call BIS_fnc_MP;
		};
	}foreach _crew;
};

_return