#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {
            QGVAR(moduleConfigurePylons),
            QGVAR(moduleDefendArea),
            QGVAR(moduleEditableObjects),
            QGVAR(moduleGlobalSetSkill),
            QGVAR(moduleGroupSide),
            QGVAR(moduleLoadIntoCargo),
            QGVAR(modulePatrolArea),
            QGVAR(moduleSearchArea),
            QGVAR(moduleSearchNearby),
            QGVAR(moduleGarrison),
            QGVAR(moduleUnGarrison),
            QGVAR(moduleTeleportPlayers),
            QGVAR(moduleToggleNvg),
            QGVAR(moduleToggleFlashlight),
            QGVAR(moduleSimulation),
            QGVAR(moduleSuppressiveFire),
            QGVAR(AddFullArsenal),
            QGVAR(RemoveFullArsenal),
            QGVAR(moduleTeleportPlayers),
            QGVAR(moduleHeal),
            QGVAR(moduleSuicideBomber),
            QGVAR(AddFullAceArsenal),
            QGVAR(RemoveFullAceArsenal)
        };
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common", "ace_ai"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"SilentSpike", "mharis001"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };

    // Use additional CfgPatches to contextually remove modules from zeus
    class GVAR(captives): ADDON {
        units[] = {
            QGVAR(moduleCaptive),
            QGVAR(moduleSurrender)
        };
    };
    class GVAR(medical): ADDON {
        units[] = {
            QGVAR(moduleUnconscious),
            QGVAR(moduleSetMedic),
            QGVAR(moduleSetMedicalVehicle),
            QGVAR(moduleSetMedicalFacility)
        };
    };
    class GVAR(cargo): ADDON {
        units[] = {
            QGVAR(moduleLoadIntoCargo)
        };
    };
    class GVAR(repair): ADDON {
        units[] = {
            QGVAR(moduleSetEngineer),
            QGVAR(moduleSetRepairVehicle),
            QGVAR(moduleSetRepairFacility)
        };
    };
    class GVAR(cargoAndRepair): ADDON {
        units[] = {
            QGVAR(moduleAddSpareTrack),
            QGVAR(moduleAddSpareWheel)
        };
    };
    class GVAR(fastroping): ADDON {
        units[] = {
            QGVAR(moduleAddOrRemoveFRIES)
        };
    };
    class GVAR(pylons): ADDON {
        units[] = {
            QGVAR(moduleConfigurePylons)
        };
    };
    class GVAR(arsenal): ADDON {
        units[] = {
            QGVAR(AddFullAceArsenal),
            QGVAR(RemoveFullAceArsenal)
        };
    };
};

class ACE_Curator {
    GVAR(captives) = "ace_captives";
    GVAR(medical) = "ace_medical";
    GVAR(cargo) = "ace_cargo";
    GVAR(repair) = "ace_repair";
    GVAR(cargoAndRepair)[] = {"ace_cargo", "ace_repair"};
    GVAR(fastroping) = "ace_fastroping";
    GVAR(pylons) = "ace_pylons";
    GVAR(arsenal) = "ace_arsenal";
};

#include "CfgFactionClasses.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "ACE_Settings.hpp"
#include "ui\RscAttributes.hpp"
