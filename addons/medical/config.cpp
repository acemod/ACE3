#include "script_component.hpp"

class CfgPatches
{
 class ADDON
 {
  units[] = {"ACE_medical_supply_crate_cms", "ACE_bandage_basicItem","ACE_packing_bandageItem","ACE_bandageElasticItem","ACE_tourniquetItem","ACE_splintItem","ACE_morphineItem","ACE_atropineItem","ACE_epinephrineItem","ACE_plasma_ivItem","ACE_plasma_iv_500Item","ACE_plasma_iv250Item","ACE_blood_ivItem","ACE_blood_iv_500Item","ACE_blood_iv_250Item","ACE_saline_ivItem","ACE_saline_iv_500Item","ACE_saline_iv_250Item","ACE_quikclotItem","ACE_nasopharyngeal_tubeItem","ACE_opaItem","ACE_liquidSkinItem","ACE_chestsealItem","ACE_personal_aid_kitItem"};
  weapons[] = {"ACE_surgical_kit"};
  requiredVersion = REQUIRED_VERSION;
  requiredAddons[] = {"ACE_gui","ACE_common"};
  version = VERSION;
  author[] = {$STR_ACE_Common_ACETeam, "Glowbal"};
  authorUrl = "http://csemod.com"; 
 };
};
class CfgAddons {
    class PreloadAddons {
       class ADDON {
          list[] = {QUOTE(ADDON)};
       };
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgFactionClasses.hpp"
#include "CfgWeapons.hpp"
#include "CfgSounds.hpp"
#include "CfgVehicles.hpp"
#include "ui\define.hpp"
#include "ui\menu.hpp"
#include "ui\RscTitles.hpp"
