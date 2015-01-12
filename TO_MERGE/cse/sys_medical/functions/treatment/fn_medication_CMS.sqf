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

if (call cse_fnc_isSetTreatmentMutex_CMS) exitwith {};
[_treatingPerson,"set"] call cse_fnc_treatmentMutex_CMS;

if (!([_treatingPerson, _injuredPerson, _removeItem] call cse_fnc_hasEquipment_CMS)) exitwith { [_treatingPerson,"release"] call cse_fnc_treatmentMutex_CMS; };


_attributes = switch (_removeItem) do {
	case "cse_morphine": {
		["cse_givenMorphine",1,"Morphine"]
	};
	case "cse_atropine": {
		["cse_givenAtropine",1,"Atropine"]
	};
	case "cse_epinephrine": {
		["cse_givenEpinephrine",1,"Epinephrine"]
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
		[_treatingPerson,"AinvPknlMstpSlayWrflDnon_medic"] call cse_fnc_localAnim;
	};

	["cse_sys_medical_treatment", true, "cse\cse_sys_medical\data\icons\medication_small.paa", [1,1,1,1]] call cse_fnc_gui_displayIcon;

	CSE_ORIGINAL_POSITION_PLAYER_CMS = getPos _treatingPerson;
	if ([2,{((vehicle player != player) ||((getPos player) distance CSE_ORIGINAL_POSITION_PLAYER_CMS) < 1)}, {},{hint "Action aborted. You moved away";}] call cse_fnc_gui_loadingBar) then {
		[_treatingPerson, _injuredPerson,_removeItem] call cse_fnc_useEquipment_CMS;
		[_this, "cse_fnc_medicationLocal_CMS", _injuredPerson, false] spawn BIS_fnc_MP;
	};

	if (_prevAnim != "") then {
		_treatingPerson switchMove _prevAnim;
	};
	["cse_sys_medical_treatment", false, "cse\cse_sys_medical\data\icons\medication_small.paa", [1,1,1,1]] call cse_fnc_gui_displayIcon;
};
[_treatingPerson,"release"] call cse_fnc_treatmentMutex_CMS;