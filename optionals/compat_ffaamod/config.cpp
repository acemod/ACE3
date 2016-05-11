#include "script_component.hpp"
#define _ARMA_
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "CfgMagazines.hpp"
#include "CfgAmmo.hpp"
#include "CfgGlasses.hpp"
#include "Extended_Eventhandlers.hpp"

class CfgPatches {
    class ADDON {
        units[]={};
        weapons[]={"ACE_ffaa_armas_c90_used","ACE_ffaa_armas_c90_used"};
		magazines[]={"ACE_UsedTube_C90","ACE_UsedTube_C100","ACE_PreloadedMissileDummy_C90_FFAA","ACE_PreloadedMissileDummy_C100_FFAA"};
        requiredVersion=REQUIRED_VERSION;
        requiredAddons[]={"ace_common","ace_goggles","ffaa_ar_lcm","ffaa_ar_zodiac","rapel_abi","ffaa_et_ch47","ffaa_estatico","ffaa_et_tigre","ffaa_et_searcher"};
        author[]={"FFAAMOD"};
        VERSION_CONFIG;
    };
};
