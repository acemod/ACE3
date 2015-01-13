/**
 * fn_medication_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */


private ["_treatingPerson","_injuredPerson","_selectionName","_removeItem","_patient","_attributes","_value", "_prevAnim"];
_injuredPerson = _this select 0;
_treatingPerson = _this select 1;
_selectionName = _this select 2;
_removeItem = _this select 3;

if (call FUNC(isSetTreatmentMutex_CMS)) exitwith {};
[_treatingPerson,"set"] call FUNC(treatmentMutex_CMS);

if (!([_treatingPerson, _injuredPerson, _removeItem] call FUNC(hasEquipment_CMS))) exitwith { [_treatingPerson,"release"] call FUNC(treatmentMutex_CMS); };


_attributes = switch (_removeItem) do {
	case "cse_morphine": {
		[QGVAR(givenMorphine),1,"Morphine"]
	};
	case "cse_atropine": {
		[QGVAR(givenAtropine),1,"Atropine"]
	};
	case "cse_epinephrine": {
		[QGVAR(givenEpinephrine),1,"Epinephrine"]
	};
	case "cse_antiBiotics": {
		[]
	};
	default {[]};
};

if (count _attributes > 1) then {
	_prevAnim = "";
	if (vehicle _treatingPerson == _treatingPerson && (vehicle _injuredPerson == _injuredPerson) && !(stance _treatingPerson == "PRONE")) then {
		if (primaryWeapon _treatingPerson == "") then {
			_prevAnim = animationState _treatingPerson;
		};
		[_treatingPerson,"AinvPknlMstpSlayWrflDnon_medic"] call EFUNC(common,localAnim);
	};

	["cse_sys_medical_treatment", true, "cse\cse_sys_medical\data\icons\medication_small.paa", [1,1,1,1]] call EFUNC(gui,displayIcon);

	GVAR(ORIGINAL_POSITION_PLAYER) = getPos _treatingPerson;
	if ([2,{((vehicle player != player) ||((getPos player) distance GVAR(ORIGINAL_POSITION_PLAYER)) < 1)}, {},{hint "Action aborted. You moved away";}] call EFUNC(gui,loadingBar)) then {
		[_treatingPerson, _injuredPerson,_removeItem] call FUNC(useEquipment_CMS);
		[_this, "FUNC(medicationLocal_CMS)", _injuredPerson, false] spawn BIS_fnc_MP;
	};

	if (_prevAnim != "") then {
		_treatingPerson switchMove _prevAnim;
	};
	["cse_sys_medical_treatment", false, "cse\cse_sys_medical\data\icons\medication_small.paa", [1,1,1,1]] call EFUNC(gui,displayIcon);
};
[_treatingPerson,"release"] call FUNC(treatmentMutex_CMS);