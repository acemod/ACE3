#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[] = {"KoffeinFlummi", "CAA-Picard"};
        authorUrl = "https://github.com/KoffeinFlummi/";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"

class CfgWeapons {
    class ItemCore;
    class Uniform_Base: ItemCore {
        AGM_GForceCoef = 1;
    };

    class U_B_PilotCoveralls: Uniform_Base {
        AGM_GForceCoef = 0.8;
    };
    class U_I_pilotCoveralls: Uniform_Base {
        AGM_GForceCoef = 0.8;
    };
    class U_O_PilotCoveralls: Uniform_Base {
        AGM_GForceCoef = 0.8;
    };
};

class CfgVehicles {
    class Man;
    class CAManBase: Man {
        AGM_GForceCoef = 1;
    };

    class B_Soldier_05_f;
    class B_Pilot_F: B_Soldier_05_f {
        AGM_GForceCoef = 0.75;
    };
    class I_Soldier_04_F;
    class I_pilot_F: I_Soldier_04_F {
        AGM_GForceCoef = 0.75;
    };
    class O_helipilot_F;
    class O_Pilot_F: O_helipilot_F {
        AGM_GForceCoef = 0.75;
    };
};
