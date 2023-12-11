#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

GVAR(initializedItemClasses) = [];
GVAR(initializedVehicleClasses) = [];
GVAR(cargoHolderTypes) = ["Car", "Air", "Tank", "Ship", "Cargo_base_F", "Land_PaperBox_closed_F"] apply {_x call EFUNC(common,getConfigName)}; // make sure they are config case
GVAR(disableParadropEffectsClasstypes) = ["Car_F"] apply {_x call EFUNC(common,getConfigName)};

if (isServer) then {
    ["All", "Deleted", LINKFUNC(handleDestroyed)] call CBA_fnc_addClassEventHandler;
};

["All", "Killed", LINKFUNC(handleDestroyed)] call CBA_fnc_addClassEventHandler;

ADDON = true;
