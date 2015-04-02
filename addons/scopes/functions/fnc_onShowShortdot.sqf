// by commy2

disableSerialization;
#include "script_component.hpp"

private ["_scope", "_control"];

_scope = _this select 0;

([QGVAR(reticle)] call BIS_fnc_rscLayer) cutRsc ["ACE_Shortdot_Reticle", "PLAIN", 0, false];

_control = uiNamespace getVariable "ACE_ctrlShortdotReticle";

_control ctrlSetText QUOTE(PATHTOF(data\reticles\ace_shortdot_reticle_1.paa));

GVAR(shownShortdot) = true;

[FUNC(onDrawShortdot), 0, [_control, _scope]] call CBA_fnc_addPerFrameHandler;
