/*
 * Author: Garth 'L-H' de Wet, Ruthberg
 * Cancels sandbag deployment
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_sandbag_fnc_deployCancle;
 *
 * Public: No
 */
#include "script_component.hpp"

if (isNull GVAR(placer)) exitWith {};

[GVAR(deployPFH)] call cba_fnc_removePerFrameHandler;

if (!isNull (GVAR(sandBag))) then {
    deleteVehicle GVAR(sandBag);
    GVAR(sandBag) = objNull;
};

[GVAR(placer), "ACE_Explosives", false] call EFUNC(Common,setForceWalkStatus);

GVAR(sandBag) = objNull;
GVAR(placer) = objNull;

call EFUNC(interaction,hideMouseHint);
[GVAR(placer), "DefaultAction", GVAR(placer) getVariable [QGVAR(Deploy),  -1]] call EFUNC(Common,removeActionEventHandler);
[GVAR(placer), "zoomtemp",      GVAR(placer) getVariable [QGVAR(Cancel), -1]] call EFUNC(Common,removeActionEventHandler);
