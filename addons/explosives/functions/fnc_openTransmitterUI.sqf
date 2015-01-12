/*
	Name: ACE_Explosives_fnc_openTransmitterUI

	Author: Garth de Wet (LH)

	Description:
		Opens the UI for selecting the transmitter

	Parameters:
		0: OBJECT - Unit

	Returns:
		Nothing

	Example:
		[player] call ACE_Explosives_fnc_openTransmitterUI;
*/
#include "script_component.hpp"
private ["_items", "_unit", "_count", "_actions", "_config"];
_unit = _this select 0;
_items = (items _unit);

_actions = [localize "STR_ACE_Explosives_TriggerMenu", localize "STR_ACE_Explosives_SelectTrigger"]
	call EFUNC(Interaction,prepareSelectMenu);
_detonators = [_unit] call FUNC(getDetonators);
{
	_config = ConfigFile >> "CfgWeapons" >> _x;
	_actions = [
		_actions,
		getText(_config >> "displayName"),
		getText(_config >> "picture"),
		_x
	] call EFUNC(Interaction,addSelectableItem);
} count _detonators;

if (count _detonators == 0) then {
	call EFUNC(Interaction,hideMenu);
	"ACE_Explosives" call EFUNC(Interaction,openMenuSelf);
	[format[localize "STR_ACE_Explosives_NoTriggersAvailable", "player"]] call EFUNC(Core,displayTextStructured);
}else{
	[
		_actions,
		{
			[ACE_player, _this] call FUNC(openDetonateUI);
		},
		{
			call EFUNC(Interaction,hideMenu);
			if !(profileNamespace getVariable ["ACE_Interaction_AutoCloseMenu", false]) then {
				"ACE_Explosives" call EFUNC(Interaction,openMenuSelf);
			};
		}
	] call EFUNC(Interaction,openSelectMenu);
};
