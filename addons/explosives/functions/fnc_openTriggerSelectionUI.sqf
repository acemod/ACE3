/*
 * Author: Garth 'L-H' de Wet
 * Opens the UI for explosive trigger selection
 *
 * Arguments:
 * 0: Explosive Magazine <STRING>
 * 1: Explosive <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [lbData [8866, lbCurSel 8866], _explosive] call ACE_Explosives_fnc_openTriggerSelectionUI;
 *
 * Public: No
 */
#include "script_component.hpp"
private ["_magazine", "_hasRequiredItems","_triggerTypes", "_actions", "_detonators", "_required", "_magTriggers"];
_magazine = _this select 0;
_detonators = [ACE_player] call FUNC(getDetonators);

_triggerTypes = [_magazine] call FUNC(triggerType);
_magTriggers = ConfigFile >> "CfgMagazines" >> _magazine >> "ACE_Triggers";
_actions = [localize "STR_ACE_Explosives_TriggerMenu", localize "STR_ACE_Explosives_SelectTrigger"]
	call EFUNC(interaction,prepareSelectMenu);
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
		] call EFUNC(interaction,addSelectableItem);
		_count = _count + 1;
	};
} count _triggerTypes;

if (_count == 0) then {
	[format[localize "STR_ACE_Explosives_NoTriggersAvailable",
		getText(configFile >> "CfgMagazines" >> _magazine >> "DisplayName")]] call EFUNC(Common,displayTextStructured);
}else{
	GVAR(explosive) = _this select 1;
	[
		_actions,
		{
			[GVAR(explosive),_this select 1, _this select 0] call FUNC(selectTrigger);
		},
		{closeDialog 0;GVAR(explosive) = objNull;}
	] call EFUNC(interaction,openSelectMenu);
};
