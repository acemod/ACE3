#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author[] = {"commy2", "Glowbal"};
        authorUrl = "https://ace3mod.com/";
        VERSION_CONFIG;
    };
};

#include "ACE_Settings.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "menu.hpp"

class ACE_newEvents {
    LoadCargo = "ace_loadCargo";
    cargoUnloaded = "ace_cargoUnloaded";
    displayTextStructured = "ace_displayTextStructured";
    cargoLoaded = "ace_cargoLoaded";
    AddCargoByClass = "ace_addCargoByClass";
    ServerUnloadCargo = "ace_serverUnloadCargo";
    UnloadCargo = "ace_unloadCargo";
    hideObjectGlobal = "ace_hideObjectGlobal";
    cargoAddedByClass = "ace_cargoAddedByClass";
};
