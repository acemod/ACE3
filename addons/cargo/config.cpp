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
    displayTextStructured = "ace_displayTextStructured";
    AddCargoByClass = "ace_addCargoByClass";
    ServerUnloadCargo = "ace_serverUnloadCargo";
    displayTextStructured = "ace_displayTextStructured";
    displayTextStructured = "ace_displayTextStructured";
    UnloadCargo = "ace_unloadCargo";
    displayTextStructured = "ace_displayTextStructured";
    LoadCargo = "ace_loadCargo";
    hideObjectGlobal = "ace_hideObjectGlobal";
    AddCargoByClass = "ace_addCargoByClass";
    cargoAddedByClass = "ace_cargoAddedByClass";
};