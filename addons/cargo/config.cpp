#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"commy2", "Glowbal"};
        url = ECSTRING(main,URL);
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
    cargoLoaded = "ace_cargoLoaded";
    AddCargoByClass = "ace_addCargo";
    ServerUnloadCargo = QGVAR(serverUnload);
    UnloadCargo = "ace_unloadCargo";
    cargoAddedByClass = "ace_cargoAdded";
};
