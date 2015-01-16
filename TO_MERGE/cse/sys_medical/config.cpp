#define _ARMA_
class CfgPatches
{
 class cse_sys_medical
 {
  units[] = {"cse_medical_supply_crate_cms", "cse_bandage_basicItem","cse_packing_bandageItem","cse_bandageElasticItem","cse_tourniquetItem","cse_splintItem","cse_morphineItem","cse_atropineItem","cse_epinephrineItem","cse_plasma_ivItem","cse_plasma_iv_500Item","cse_plasma_iv250Item","cse_blood_ivItem","cse_blood_iv_500Item","cse_blood_iv_250Item","cse_saline_ivItem","cse_saline_iv_500Item","cse_saline_iv_250Item","cse_quikclotItem","cse_nasopharyngeal_tubeItem","cse_opaItem","cse_liquidSkinItem","cse_chestsealItem","cse_personal_aid_kitItem"};
  weapons[] = {"cse_surgical_kit"};
  requiredVersion = 0.1;
  requiredAddons[] = {"cse_gui","cse_main"};
  version = "0.10.0_rc";
  author[] = {"Combat Space Enhancement"};
  authorUrl = "http://csemod.com";
 };
};
class CfgAddons {
    class PreloadAddons {
       class cse_sys_medical {
          list[] = {"cse_sys_medical"};
       };
    };
};
#include "CfgFactionClasses.h"
#include "CfgFunctions.h"

// TODO To be removed at a later stage, as it is being replaced by items (CfgWeapons.h). Will stay around for backwards compatability for now.
// #include "CfgMagazines.h"

// Replacing the old magazine approach by items.
#include "CfgWeapons.h"


#include "CfgSounds.h"
#include "CfgVehicles.h"
#include "CfgHints.h"
#include "Combat_Space_Enhancement.h"
#include "ui\define.hpp"
#include "ui\menu.hpp"