#include "script_component.hpp"

ADDON = false;

PREP(bi_moduleCurator);
PREP(bi_moduleMine);
PREP(bi_moduleProjectile);
PREP(bi_moduleRemoteControl);
PREP(contextualModules);
PREP(moduleCapture);
PREP(moduleKnockout);
PREP(moduleSurrender);
PREP(moduleZeusSettings);

if (isServer) then {
	["zeusUnitAssigned", {_this call FUNC(contextualModules)}] call EFUNC(common,addEventHandler);
};

ADDON = true;
