/**
 * fn_treatmentAirway_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */


private ["_treatingPerson","_injuredPerson","_part","_selectionName","_openWounds","_woundsArray","_highest_amount","_highestSpot"];
_injuredPerson = _this select 0;
_treatingPerson = _this select 1;
_selectionName = _this select 2;
_removeItem = _this select 3;

[format["Treatment Airway: %1",_this]] call cse_fnc_debug;

_part =	[_selectionName] call cse_fnc_getBodyPartNumber_CMS;
if (_part == 0 || _part == 1) then {
	if (call cse_fnc_isSetTreatmentMutex_CMS) exitwith {};
	[_treatingPerson] call cse_fnc_treatmentMutex_CMS;
	if (!([_treatingPerson, _injuredPerson, _removeItem] call cse_fnc_hasEquipment_CMS)) exitwith { [_treatingPerson,"release"] call cse_fnc_treatmentMutex_CMS; };

		[_treatingPerson, _injuredPerson,_removeItem] call cse_fnc_useEquipment_CMS;

		if (vehicle _treatingPerson == _treatingPerson && (vehicle _injuredPerson == _injuredPerson)) then {
			[_treatingPerson,"AinvPknlMstpSlayWrflDnon_medic"] call cse_fnc_localAnim;
		};
		_name = [_injuredPerson] call cse_fnc_getName;

		[_treatingPerson,"STR_CSE_CMS_AIRWAY","STR_CSE_CMS_YOU_TREAT_AIRWAY", 0, [_name]] call cse_fnc_sendDisplayMessageTo;

		CSE_ORIGINAL_POSITION_PLAYER_CMS = getPos _treatingPerson;
		if !([5,{((vehicle player != player) ||((getPos player) distance CSE_ORIGINAL_POSITION_PLAYER_CMS) < 1)}, {},{[player, "STR_CSE_CMS_CANCELED", ["STR_CSE_CMS_ACTION_CANCELED","STR_CSE_CMS_YOU_MOVED_AWAY"]] call cse_fnc_sendDisplayInformationTo;}] call cse_fnc_gui_loadingBar) exitwith {
				[_treatingPerson,"release"] call cse_fnc_treatmentMutex_CMS;
		};

		[_this, "cse_fnc_treatmentAirwayLocal_CMS", _injuredPerson, false] spawn BIS_fnc_MP;
		[_treatingPerson,"release"] call cse_fnc_treatmentMutex_CMS;
} else {
	hintSilent "Cannot apply item on this body part";
};
true