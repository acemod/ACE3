/*
 * Author: Garth 'L-H' de Wet
 * Opens the UI for timer setting of an explosive
 *
 * Arguments:
 * 0: Magazine <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["SatchelCharge_Remote_Mag"] call ACE_Explosives_fnc_openTimerSetUI;
 *
 * Public: No
 */
#include "script_component.hpp"
private ["_mag"];
_mag = _this select 0;
createDialog "RscACE_SelectTimeUI";
sliderSetRange [8845, 5, 900]; // 5seconds - 15minutes
sliderSetPosition [8845, 30];

buttonSetAction [8860, format[QUOTE([ARR_4(ACE_player,'%1','Timer',floor sliderPosition 8845)] call FUNC(setupExplosive);closeDialog 0;), _mag]];
buttonSetAction [8855, format[QUOTE(['%1'] call FUNC(openTriggerSelectionUI);), _mag]];

ctrlSetText [8870, format[localize "STR_ACE_Explosives_TimerMenu",0, 30]];
