/*
	Name: ACE_Explosives_fnc_selectTrigger

	Author: Garth de Wet (LH)

	Description:
		Selects a trigger for an explosive.

	Parameters:
		0: String - Magazine
		1: String - trigger index in ACE_triggers of magazine class

	Returns:
		Nothing

	Example:
		["SatchelCharge_Remote_Mag","Timer"] call ACE_Explosives_fnc_selectTrigger;
*/
#include "\z\ace\explosives\script_component.hpp"
private ["_magazine","_trigger"];
closeDialog 0;
_magazine = _this select 0;
_trigger = _this select 1;
_config = ConfigFile >> "CfgACE_Triggers" >> _trigger;
call EFUNC(Interaction,hideMenu);

// If the onSetup function returns true, it is handled elsewhere
if (isText(_config >> "onSetup") && {[_magazine] call compile getText (_config >> "onSetup")}) exitWith {};

[ACE_player, _magazine, _trigger] call FUNC(setupExplosive);
