/**
 * fn_hasEquipment_CMS.sqf
 * @Descr: Check if the medic or patient have the right equipment for treatment.
 * @Author: Glowbal
 *
 * @Arguments: [medic OBJECT, patient OBJECT, item STRING (Classname of the item. Expects magazine type.)]
 * @Return: BOOL
 * @PublicAPI: false
 */

private ["_medic", "_patient", "_item", "_return"];
_medic = _this select 0;
_patient = _this select 1;
_item = _this select 2;

if (isnil "CSE_ALLOW_SHARED_EQUIPMENT_CMS") then {
	CSE_ALLOW_SHARED_EQUIPMENT_CMS = true;
};
if (CSE_ALLOW_SHARED_EQUIPMENT_CMS && {[_patient, _item] call cse_fnc_hasItem}) exitwith {
	true;
};

if ([_medic, _item] call cse_fnc_hasItem) exitwith {
	true;
};

_return = false;
if ([vehicle _medic] call FUNC(isMedicalVehicle_CMS) && {(vehicle _medic != _medic)}) then {
	_crew = crew vehicle _medic;
	{
		if ([_x, _medic] call FUNC(canAccessMedicalEquipment_CMS) && {([_x, _item] call cse_fnc_hasItem)}) exitwith {
			_return = true;
		};
	}foreach _crew;
};

_return