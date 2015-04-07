/*
 * Author: Garth 'L-H' de Wet
 * Cancels placement of the explosive
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ACE_Explosives_fnc_place_Cancel;
 *
 * Public: Yes
 */
#include "script_component.hpp"
if (GVAR(pfeh_running)) then {
    [QGVAR(Placement),"OnEachFrame"] call CALLSTACK(BIS_fnc_removeStackedEventHandler);
    GVAR(pfeh_running) = false;
};
if (!isNull (GVAR(Setup))) then {
    deleteVehicle GVAR(Setup);
};
GVAR(Setup) = objNull;
if (isNil {GVAR(placer)}) then {
    GVAR(placer) = objNull;
};
[GVAR(placer), "ACE_Explosives", false] call EFUNC(Common,setForceWalkStatus);
GVAR(placer) = objNull;
call EFUNC(interaction,hideMouseHint);
[ACE_player, "DefaultAction", ACE_player getVariable [QGVAR(Place),  -1]] call EFUNC(Common,removeActionEventHandler);
[ACE_player, "zoomtemp",      ACE_player getVariable [QGVAR(Cancel), -1]] call EFUNC(Common,removeActionEventHandler);
