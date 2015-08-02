/*
 * Author: Garth 'L-H' de Wet, Ruthberg
 * Starts the deploy process for sandbags.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_sandbag_fnc_deploy;
 *
 * Public: No
 */
#include "script_component.hpp"

closeDialog 0;

GVAR(placer) = ACE_player;

[GVAR(placer), "ACE_Sandbag", true] call EFUNC(common,setForceWalkStatus);

GVAR(sandBag) = createVehicle ["ACE_SandbagObject_NoGeo", [0,0,0], [], 0, "NONE"];
GVAR(sandBag) enableSimulationGlobal false;

GVAR(deployPFH) = [{
    if (GVAR(placer) != ACE_player) exitWith {
        call FUNC(deployCancel);
    };
    GVAR(sandBag) setPosASL ((eyePos ACE_player) vectorAdd (positionCameraToWorld [0,0,1] vectorDiff positionCameraToWorld [0,0,0]));
    GVAR(sandBag) setDir (GVAR(deployDirection) + getDir ACE_player);
}, 0, []] call CBA_fnc_addPerFrameHandler;

[localize LSTRING(ConfirmDeployment), localize LSTRING(CancelDeployment), localize LSTRING(ScrollAction)] call EFUNC(interaction,showMouseHint);

GVAR(placer) setVariable [QGVAR(Deploy),
    [GVAR(placer), "DefaultAction",
    {GVAR(deployPFH) != -1 && !isNull (GVAR(sandBag))},
    {call FUNC(deployConfirm);}
] call EFUNC(common,AddActionEventHandler)];

GVAR(placer) setVariable [QGVAR(Cancel),
    [GVAR(placer), "zoomtemp",
    {GVAR(deployPFH) != -1 && !isNull (GVAR(sandBag))},
    {call FUNC(deployCancel);}
] call EFUNC(common,AddActionEventHandler)];
