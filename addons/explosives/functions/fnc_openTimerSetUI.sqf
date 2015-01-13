/*
	Name: ACE_Explosives_fnc_openTimerSetUI

	Author: Garth de Wet (LH)

	Description:
		Opens the UI for timer setting of an explosive

	Parameters:
		0: String - Magazine

	Returns:
		Nothing

	Example:
		[player] call ACE_Explosives_fnc_openTimerSetUI;
*/
#include "script_component.hpp"
private ["_mag"];
_mag = _this select 0;
createDialog "RscACE_SelectTimeUI";
sliderSetRange [8845, 5, 900]; // 5seconds - 15minutes
sliderSetPosition [8845, 30];

buttonSetAction [8860, format[QUOTE([ACE_player, '%1', 'Timer', floor(sliderPosition 8845)] call FUNC(setupExplosive);closeDialog 0;), _mag]];
buttonSetAction [8855, format[QUOTE(['%1'] call FUNC(openTriggerSelectionUI);), _mag]];

ctrlSetText [8870, format[localize "STR_ACE_Explosives_TimerMenu",0, 30]];
