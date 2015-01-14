#include "script_component.hpp"

class CfgPatches
{
 class ADDON
 {
  units[] = {"cse_medical_supply_crate_cms", "cse_bandage_basicItem","cse_packing_bandageItem","cse_bandageElasticItem","cse_tourniquetItem","cse_splintItem","cse_morphineItem","cse_atropineItem","cse_epinephrineItem","cse_plasma_ivItem","cse_plasma_iv_500Item","cse_plasma_iv250Item","cse_blood_ivItem","cse_blood_iv_500Item","cse_blood_iv_250Item","cse_saline_ivItem","cse_saline_iv_500Item","cse_saline_iv_250Item","cse_quikclotItem","cse_nasopharyngeal_tubeItem","cse_opaItem","cse_liquidSkinItem","cse_chestsealItem","cse_personal_aid_kitItem"};
  weapons[] = {"cse_surgical_kit"};
  requiredVersion = REQUIRED_VERSION;
  requiredAddons[] = {"ACE_gui","ACE_main"};
  version = VERSION;
  author[] = {$STR_ACE_Core_ACETeam, "Glowbal"};
  authorUrl = "http://csemod.com"; // TODO website link?
 };
};
class CfgAddons {
    class PreloadAddons {
       class ADDON {
          list[] = {"ADDON"};
       };
    };
};
#include "CfgFactionClasses.hpp"
#include "CfgWeapons.hpp"
#include "CfgSounds.hpp"
#include "CfgVehicles.hpp"
#include "ui\define.hpp"
#include "ui\menu.hpp"