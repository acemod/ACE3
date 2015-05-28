/*
 * Author: Garth 'L-H' de Wet
 * Opens the UI for timer setting of an explosive
 *
 * Arguments:
 * 0: Explosive <OBJECT>
 * 1: Magazine <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_explosive, "SatchelCharge_Remote_Mag"] call ACE_Explosives_fnc_openTimerSetUI;
 *
 * Public: No
 */
#include "script_component.hpp"
EXPLODE_2_PVT(_this,_explosive,_mag);
createDialog "RscACE_SelectTimeUI";
sliderSetRange [8845, 5, 900]; // 5seconds - 15minutes
sliderSetPosition [8845, 30];

GVAR(explosive) = _explosive;

DFUNC(SetTimer) = {
    [
        ACE_player,
        getPosATL GVAR(explosive),
        GVAR(explosive) getVariable QGVAR(Direction),
        GVAR(explosive) getVariable QGVAR(class),
        "Timer",
        [floor sliderPosition 8845],
        GVAR(explosive)
    ] call FUNC(placeExplosive);
    closeDialog 0;
};

buttonSetAction [8860, QUOTE(call DFUNC(SetTimer);)];
buttonSetAction [8855, QUOTE(closeDialog 0;)];

ctrlSetText [8870, format[localize LSTRING(TimerMenu),0, 30]];
