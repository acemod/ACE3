/*
 * Author: Pabst Mirror (based on Explosive attach by Garth de Wet (LH))
 * Cancels placement of the lightObject
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * Nothing
 *
 * Public: No
 */
#include "script_component.hpp"

if (GVAR(pfeh_running)) then {
    [QGVAR(PlacementEachFrame),"OnEachFrame"] call BIS_fnc_removeStackedEventHandler;
    GVAR(pfeh_running) = false;
};
if (!isNull (GVAR(setupObject))) then {
    deleteVehicle GVAR(setupObject);
};

[GVAR(placer), QGVAR(vehAttach), false] call EFUNC(common,setForceWalkStatus);
call EFUNC(interaction,hideMouseHint);
[GVAR(placer), "DefaultAction", GVAR(placer) getVariable [QGVAR(placeActionEH),  -1]] call EFUNC(common,removeActionEventHandler);
[GVAR(placer), "MenuBack",      GVAR(placer) getVariable [QGVAR(cancelActionEH), -1]] call EFUNC(common,removeActionEventHandler);

GVAR(placer) = objNull;
GVAR(SetupPlacmentItem) = "";
GVAR(SetupPlacmentText) = "";
GVAR(setupObject) = objNull;
GVAR(SetupAttachVehicle) = objNull;
