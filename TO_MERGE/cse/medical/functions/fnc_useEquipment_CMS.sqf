/**
 * fn_useEquipment_CMS.sqf
 * @Descr: Use Equipment if any is available. Priority: 1) Medic, 2) Patient. If in vehicle: 3) Crew
 * @Author: Glowbal
 *
 * @Arguments: [medic OBJECT, patient OBJECT, item STRING (ClassName of magazine item)]
 * @Return: BOOL
 * @PublicAPI: true
 */

private ["_medic", "_patient", "_item", "_return","_crew"];
_medic = _this select 0;
_patient = _this select 1;
_item = _this select 2;

if (isnil "CSE_ALLOW_SHARED_EQUIPMENT_CMS") then {
	CSE_ALLOW_SHARED_EQUIPMENT_CMS = true;
};

if (CSE_ALLOW_SHARED_EQUIPMENT_CMS && {[_patient, _item] call cse_fnc_hasItem}) exitwith {
	[[_patient, _item], "cse_fnc_useItem", _patient] call BIS_fnc_MP;
	true;
};

if ([_medic, _item] call cse_fnc_hasItem) exitwith {
	[[_medic, _item], "cse_fnc_useItem", _medic] call BIS_fnc_MP;
	true;
};

_return = false;
if ([vehicle _medic] call FUNC(isMedicalVehicle_CMS) && {vehicle _medic != _medic}) then {
	_crew = crew vehicle _medic;
	{
		if ([_x, _medic] call FUNC(canAccessMedicalEquipment_CMS) && {([_x, _item] call cse_fnc_hasItem)}) exitwith {
			_return = true;
			[[_x, _item], "cse_fnc_useItem", _x] call BIS_fnc_MP;
		};
	}foreach _crew;
};

_return