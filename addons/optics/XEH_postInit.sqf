// by commy2
#include "script_component.hpp"

// init RSC
([QGVAR(reticle)] call BIS_fnc_rscLayer) cutRsc ["ACE_Shortdot_Reticle", "PLAIN", 0, false];

GVAR(isUsingOptic) = false;
["cameraViewChanged", {_this call FUNC(handleCameraViewChanged)}] call EFUNC(common,addEventHandler);

GVAR(usedOptics) = [["","",{}],["","",{}],["","",{}]];
["playerInventoryChanged", {_this call FUNC(handlePlayerInventoryChanged)}] call EFUNC(common,addEventHandler);

addMissionEventHandler ["Draw3D", {call FUNC(onDraw3D)}];
