/*
  Name: FUNC(placeCancel)
  
  Author(s):
    Pabst Mirror (based on Explosive attach by Garth de Wet (LH))
  
  Description:
    Cancels placement of the lightObject
  
  Parameters:
    Nothing
  
  Returns:
    Nothing
  
  Example:
    call FUNC(placeCancel);
*/
#include "script_component.hpp"

if (GVAR(pfeh_running)) then {
  [QGVAR(PlacementEachFrame),"OnEachFrame"] call BIS_fnc_removeStackedEventHandler;
  GVAR(pfeh_running) = false;
};
if (!isNull (GVAR(setupObject))) then {
  deleteVehicle GVAR(setupObject);
};
GVAR(SetupPlacmentItem) = "";
GVAR(SetupPlacmentText) = "";
GVAR(setupObject) = objNull;
GVAR(SetupAttachVehicle) = objNull;


[GVAR(placer), QGVAR(vehAttach), false] call EFUNC(common,setForceWalkStatus);
call EFUNC(interaction,hideMouseHint);
[GVAR(placer), "DefaultAction", GVAR(placer) getVariable [QGVAR(placeActionEH),  -1]] call EFUNC(common,removeActionEventHandler);
[GVAR(placer), "MenuBack",      GVAR(placer) getVariable [QGVAR(cancelActionEH), -1]] call EFUNC(common,removeActionEventHandler);

GVAR(placer) = objNull;
