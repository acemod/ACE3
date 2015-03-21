#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {QGVAR(fieldDressingItem), QGVAR(packingBandageItem), QGVAR(elasticBandageItem), QGVAR(tourniquetItem), QGVAR(morphineItem), QGVAR(atropineItem), QGVAR(epinephrineItem), QGVAR(plasmaIVItem), QGVAR(bloodIVItem), QGVAR(salineIVItem), QGVAR(quikclotItem), QGVAR(personalAidKitItem), QGVAR(surgicalKitItem), QGVAR(bodyBagItem)};
        weapons[] = {QGVAR(fieldDressing), QGVAR(packingBandage), QGVAR(elasticBandage), QGVAR(tourniquet), QGVAR(morphine), QGVAR(atropine), QGVAR(epinephrine), QGVAR(plasmaIV), QGVAR(plasmaIV_500), QGVAR(plasmaIV_250), QGVAR(bloodIV), QGVAR(bloodIV_500), QGVAR(bloodIV_250), QGVAR(salineIV), QGVAR(salineIV_500), QGVAR(salineIV_250), QGVAR(quikclot), QGVAR(personalAidKit), QGVAR(surgicalKit), QGVAR(bodyBag)};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {ace_common, ace_interaction};
        author[] = {"Glowbal", "KoffienFlummi"};
        authorUrl = "";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgFactionClasses.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "CFgSounds.hpp"
#include "ACE_Medical_Treatments.hpp"
#include "ACE_Settings.hpp"
#include "UI\RscTitles.hpp"
#include "UI\triagecard.hpp"
