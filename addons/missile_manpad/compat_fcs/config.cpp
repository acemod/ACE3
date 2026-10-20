#include "script_component.hpp"

class CfgPatches {
    class SUBADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {QUOTE(ADDON), "ace_fcs"};
        skipWhenMissingDependencies = 1;
        author = ECSTRING(common,ACETeam);
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
        addonRootClass = QUOTE(ADDON);
    };
};

// ensure the union of changes from FCS and manpad are present
class CfgVehicles {
    class Tank;
    class Tank_F: Tank {
        class Turrets {
            class MainTurret;
        };
    };
    class APC_Tracked_01_base_F: Tank_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
    };
    class B_APC_Tracked_01_base_F: APC_Tracked_01_base_F {};
    class B_APC_Tracked_01_AA_F: B_APC_Tracked_01_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                magazines[] = {"680Rnd_35mm_AA_shells_Tracer_Red", "ACE_120Rnd_35mm_ABM_shells_Tracer_Red", QGVAR(stinger), QGVAR(stinger)};
            };
        };
    };
    class APC_Tracked_02_base_F: Tank_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
    };
    class O_APC_Tracked_02_base_F: APC_Tracked_02_base_F {};
    class O_APC_Tracked_02_AA_F: O_APC_Tracked_02_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                magazines[] = {"680Rnd_35mm_AA_shells_Tracer_Green", "ACE_120Rnd_35mm_ABM_shells_Tracer_Green", QGVAR(stinger), QGVAR(stinger)};
            };
        };
    };
};
