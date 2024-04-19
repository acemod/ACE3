#include "script_component.hpp"

#pragma hemtt flag pe23_ignore_has_include
#if __has_include("\z\ace\addons\nomedical\script_component.hpp")
#define PATCH_SKIP "No Medical"
#endif

#ifdef PATCH_SKIP
ACE_PATCH_NOT_LOADED(ADDON,PATCH_SKIP)
#else
class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {"ACE_fieldDressingItem","ACE_packingBandageItem","ACE_elasticBandageItem","ACE_tourniquetItem","ACE_splintItem","ACE_painkillersItem","ACE_morphineItem","ACE_adenosineItem","ACE_epinephrineItem","ACE_plasmaIVItem","ACE_bloodIVItem","ACE_salineIVItem","ACE_quikClotItem","ACE_personalAidKitItem","ACE_surgicalKitItem","ACE_sutureItem","ACE_bodyBagItem","ACE_medicalSupplyCrate","ACE_medicalSupplyCrate_advanced"};
        weapons[] = {"ACE_fieldDressing","ACE_packingBandage","ACE_elasticBandage","ACE_tourniquet","ACE_splint","ACE_painkillers","ACE_morphine","ACE_adenosine","ACE_epinephrine","ACE_plasmaIV","ACE_plasmaIV_500","ACE_plasmaIV_250","ACE_bloodIV","ACE_bloodIV_500","ACE_bloodIV_250","ACE_salineIV","ACE_salineIV_500","ACE_salineIV_250","ACE_quikclot","ACE_personalAidKit","ACE_surgicalKit","ACE_suture","ACE_bodyBag","ACE_bodyBag_blue","ACE_bodyBag_white"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_medical_status", "ace_medical_damage", "ace_apl"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Glowbal", "KoffeinFlummi", "Arcanum"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "ACE_Medical_Treatment.hpp"
#include "ACE_Medical_Treatment_Actions.hpp"
#include "ACE_Medical_Facilities.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgReplacementItems.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "Cfg3DEN.hpp"
#include "CfgMagazines.hpp"

#endif
