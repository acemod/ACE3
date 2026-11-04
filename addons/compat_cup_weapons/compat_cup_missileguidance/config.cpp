#include "script_component.hpp"

class CfgPatches {
    class SUBADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "ace_missileguidance",
            "CUP_Weapons_LoadOrder"
        };
        skipWhenMissingDependencies = 1;
        author = ECSTRING(common,ACETeam);
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
        addonRootClass = QUOTE(ADDON);
    };
};
 
#include "\z\ace\addons\missileguidance\script_missileBases.hpp"
#include "CfgAmmo.hpp"

class CfgWeapons { //todo
    class Launcher_Base_F;
    class CUP_launch_FIM92Stinger_Loaded: Launcher_Base_F {
        canLock = 0;
        EGVAR(missile_manpad,enabled) = 1;
        EGVAR(missile_manpad,lockAngle) = 3;
        EGVAR(missile_manpad,lockingTimeMin) = 2;
        EGVAR(missile_manpad,lockingTimeMax) = 4;
        EGVAR(missile_manpad,lockingSound) = QEGVAR(missile_manpad,stinger_locking);
        EGVAR(missile_manpad,lockedSound) = QEGVAR(missile_manpad,stinger_locked);
    };
};
