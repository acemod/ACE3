//#define DEBUG_MODE_FULL
#include "script_component.hpp"

private["_cargoArray", "_isRound"];

TRACE_1("", _this);
// dont open the dialog if there are no arty rounds in thebox

PARAMS_1(_ammoCrate);

GVAR(currentAmmoCrate) = _ammoCrate;
_cargoArray = getMagazineCargo _ammoCrate;
_isRound = false;
{
	_isRound = [_x, "ace_arty_howitzer_default", "CfgMagazines"] call FUNC(isKindOf);
	if (_isRound) exitWith { };
} foreach (_cargoArray select 0);
if (_isRound) then {
	createDialog "ace_arty_ammoprep_Display";
} else {
	hintSilent "No artillery munitions in this box.";
	GVAR(currentAmmoCrate) = nil;
};