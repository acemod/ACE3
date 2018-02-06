#include "script_component.hpp"

class CfgPatches {
     class ADDON {
        name = COMPONENT_NAME;
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_missileguidance"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"xrufix"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
        ammo[] = {
            GVAR(L),
            "ace_kh25ml"
        };
        magazines[] = {
            QGVAR(L_magazine_x1),
            QGVAR(L_pylonmissile_x1),
            QGVAR(L_pylonmissile_x2),
            QGVAR(L_pylonRack_1Rnd),
            QGVAR(L_PylonRack_3Rnd),
            QGVAR(L_PylonRack_x1),
            QGVAR(L_PylonRack_x2),
            "ace_kh25ml_magazine_x1",
            "ace_kh25ml_pylonmissile_x1",
            "ace_kh25ml_pylonmissile_int_x1"
        };
        weapons[] = {
            GVAR(L_Launcher_Plane),
            GVAR(L_Launcher),
            "ace_kh25ml_launcher"
        };
        units[] = {};
     };
};


class SensorTemplateLaser;

#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"
#include "CfgWeapons.hpp"
#include "ACE_GuidanceConfig.hpp"
