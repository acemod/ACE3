/*
	Name: AGM_Explosives_fnc_openTriggerSelectionUI
	
	Author: Garth de Wet (LH)
	
	Description:
		Opens the UI for explosive trigger selection
	
	Parameters: 
		0: String - explosive magazine
	
	Returns:
		Nothing
	
	Example:
		[lbData [8866, lbCurSel 8866]] call AGM_Explosives_fnc_openTriggerSelectionUI;
*/
private ["_magazine", "_hasRequiredItems","_triggerTypes", "_actions", "_detonators", "_required", "_magTriggers"];
_magazine = _this select 0;
_detonators = [AGM_player] call AGM_Explosives_fnc_getDetonators;

_triggerTypes = [_magazine] call AGM_Explosives_fnc_TriggerType;
_magTriggers = ConfigFile >> "CfgMagazines" >> _magazine >> "AGM_Triggers";
_actions = [localize "STR_AGM_Explosives_TriggerMenu", localize "STR_AGM_Explosives_SelectTrigger"] call AGM_Interaction_fnc_prepareSelectMenu;
_count = 0;
{
	_required = getArray (_x >> "requires");
	_hasRequiredItems = true;
	{
		if !(_x in _detonators) exitWith {
			_hasRequiredItems = false;
		};
	} count _required;
	if (_hasRequiredItems) then {
		_actions = [
			_actions,
			if(isText(_magTriggers >> configName _x >> "displayName"))then{getText(_magTriggers >> configName _x >> "displayName")}else{getText(_x >> "displayName")},
			if(isText(_magTriggers >> configName _x >> "picture"))then{getText(_magTriggers >> configName _x >> "picture")}else{getText(_x >> "picture")},
			[configName _x, _magazine]
		] call AGM_Interaction_fnc_AddSelectableItem;
		_count = _count + 1;
	};
} count _triggerTypes;

if (_count == 0) then {
	[AGM_player] call AGM_Explosives_fnc_openPlaceUI;
	[format[localize "STR_AGM_Explosives_NoTriggersAvailable", getText(configFile >> "CfgMagazines" >> _magazine >> "DisplayName")]] call AGM_Core_fnc_displayTextStructured;
}else{
	[
		_actions,
		{
			[_this select 1, _this select 0] call AGM_Explosives_fnc_selectTrigger;
		},
		{[AGM_player] call AGM_Explosives_fnc_openPlaceUI;}
	] call AGM_Interaction_fnc_openSelectMenu;
};
