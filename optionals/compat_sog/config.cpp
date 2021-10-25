#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {
            QGVAR(box_81mm_he),
            QGVAR(box_81mm_wp),
            QGVAR(box_81mm_chem),
            QGVAR(box_81mm_lume),
            QGVAR(box_60mm_he),
            QGVAR(box_60mm_wp),
            QGVAR(box_60mm_lume),
            QGVAR(box_82mm_he),
            QGVAR(box_82mm_wp),
            QGVAR(box_82mm_lume)
        };
        weapons[] = {
            QGVAR(m2_carry),
            QGVAR(m1919a4_carry),
            QGVAR(m1919a6_carry),
            QGVAR(m60_carry),
            QGVAR(tow_carry),
            QGVAR(dshkm_carry),
            QGVAR(dshkm_shield_carry),
            QGVAR(dshkm_AA_carry),
            QGVAR(rpd_carry),
            QGVAR(pk_carry),
            QGVAR(mortar_m29_carry),
            QGVAR(mortar_m2_carry),
            QGVAR(mortar_type53_carry)
        };
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"vn_weapons", "vn_emm_main_menu", "weapons_f_vietnam_c", "ace_trenches"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"BaerMitUmlaut", "veteran29"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "ACE_CSW_Groups.hpp"
#include "CfgAmmo.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgGlasses.hpp"
#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "EMM_mainMenu_CfgMenus.hpp"
