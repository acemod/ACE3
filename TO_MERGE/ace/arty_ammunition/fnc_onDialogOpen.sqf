//#define DEBUG_MODE_FULL
#include "script_component.hpp"

uinamespace setVariable ["ace_arty_ammoprep_Display", _this select 0];

[_this, GVAR(currentAmmoCrate)] spawn {
	waitUntil {
		!isNull (findDisplay 754)
	};
	call FUNC(populateRoundsList);
	call FUNC(populateChargeList);
	call FUNC(setDialogParameters);
};

GVAR(shellSpawnDir) = 1;
GVAR(isDialogOpen) = true;
