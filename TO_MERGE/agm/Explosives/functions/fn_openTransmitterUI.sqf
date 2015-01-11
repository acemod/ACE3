/*
	Name: AGM_Explosives_fnc_openTransmitterUI
	
	Author: Garth de Wet (LH)
	
	Description:
		Opens the UI for selecting the transmitter
	
	Parameters:
		0: OBJECT - Unit
	
	Returns:
		Nothing
	
	Example:
		[player] call AGM_Explosives_fnc_openTransmitterUI;
*/
private ["_items", "_unit", "_count", "_actions", "_config"];
_unit = _this select 0;
_items = (items _unit);

_actions = [localize "STR_AGM_Explosives_TriggerMenu", localize "STR_AGM_Explosives_SelectTrigger"] call AGM_Interaction_fnc_prepareSelectMenu;
_detonators = [_unit] call AGM_Explosives_fnc_getDetonators;
{
	_config = ConfigFile >> "CfgWeapons" >> _x;
	_actions = [
		_actions,
		getText(_config >> "displayName"),
		getText(_config >> "picture"),
		_x
	] call AGM_Interaction_fnc_AddSelectableItem;
} count _detonators;

if (count _detonators == 0) then {
	call AGM_Interaction_fnc_hideMenu;
	"AGM_Explosives" call AGM_Interaction_fnc_openMenuSelf;
	[format[localize "STR_AGM_Explosives_NoTriggersAvailable", "player"]] call AGM_Core_fnc_displayTextStructured;
}else{
	[
		_actions,
		{
			[AGM_player, _this] call AGM_Explosives_fnc_openDetonateUI;
		},
		{
			call AGM_Interaction_fnc_hideMenu;
			if !(profileNamespace getVariable ["AGM_Interaction_AutoCloseMenu", false]) then {
				"AGM_Explosives" call AGM_Interaction_fnc_openMenuSelf;
			};
		}
	] call AGM_Interaction_fnc_openSelectMenu;
};
