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
        authors[] = {"kymckay", "mharis001"};
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
            QGVAR(moduleSetMedicalFacility),
            QGVAR(moduleMedicalMenu)
        };
    };
    class GVAR(cargo): ADDON {
        units[] = {
            QGVAR(moduleLoadIntoCargo),
            QGVAR(moduleUnloadFromCargo),
            QGVAR(moduleCargoParadrop)
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
    class GVAR(fire): ADDON {
        units[] = {
            QGVAR(moduleBurn)
        };
    };
    class GVAR(trenches): ADDON {
        units[] = {
            QGVAR(moduleLayTrench)
        };
    };
    class GVAR(spectator): ADDON {
        units[] = {
            QGVAR(moduleSpectator)
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
    GVAR(fire) = "ace_fire";
    GVAR(trenches) = "ace_trenches";
    GVAR(spectator) = "ace_spectator";
};

#include "CfgFactionClasses.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "ACE_Settings.hpp"
#include "ui\RscAttributes.hpp"
