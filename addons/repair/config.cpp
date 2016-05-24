#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {"ACE_Wheel", "ACE_Track"};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author[] = {"commy2", "Glowbal", "Jonpas"};
        authorUrl = "https://ace3mod.com";
        VERSION_CONFIG;
    };
};

#include "ACE_Repair.hpp"
#include "ACE_Settings.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgActions.hpp"
#include "CfgVehicles.hpp"
#include "CfgEden.hpp"

class ACE_newEvents {
    setWheelHitPointDamage = QGVAR(setWheelHitPointDamage);
    setVehicleHitPointDamage = QGVAR(setVehicleHitPointDamage);
    setVehicleDamage = QGVAR(setVehicleDamage);
    fixPosition = "ace_fixPosition";
    displayTextStructured = "ace_displayTextStructured";
    engineOn = "ace_engineOn";
    fixCollision = "ace_fixCollision";
    AddCargoByClass = "ace_addCargoByClass";
};
