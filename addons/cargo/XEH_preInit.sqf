#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.sqf"

GVAR(initializedItemClasses) = [];
GVAR(initializedVehicleClasses) = [];
GVAR(cargoHolderTypes) = ["Car", "Air", "Tank", "Ship", "Cargo_base_F", "Land_PaperBox_closed_F"];
GVAR(disableParadropEffectsClasstypes) = ["Car_F"];

ADDON = true;
