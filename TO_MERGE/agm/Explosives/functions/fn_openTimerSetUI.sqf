/*
	Name: AGM_Explosives_fnc_openTimerSetUI
	
	Author: Garth de Wet (LH)
	
	Description:
		Opens the UI for timer setting of an explosive
	
	Parameters: 
		0: String - Magazine
	
	Returns:
		Nothing
	
	Example:
		[player] call AGM_Explosives_fnc_openTimerSetUI;
*/
private ["_mag"];
_mag = _this select 0;
createDialog "RscAGM_SelectTimeUI";
sliderSetRange [8845, 5, 900]; // 5seconds - 15minutes
sliderSetPosition [8845, 30];

buttonSetAction [8860, format["[AGM_player, '%1', 'Timer', floor(sliderPosition 8845)] call AGM_Explosives_fnc_SetupExplosive;closeDialog 0;", _mag]];
buttonSetAction [8855, format["['%1'] call AGM_Explosives_fnc_openTriggerSelectionUI;", _mag]];

ctrlSetText [8870, format[localize "STR_AGM_Explosives_TimerMenu",0, 30]];
