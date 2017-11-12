
class CBA_Extended_EventHandlers;

class CfgVehicles {
    class Logic;
    class Module_F: Logic {
        class ArgumentsBaseUnits {
        };
    };
    class ACE_Module;
    class ACE_moduleMedicalSettings: ACE_Module {
        scope = 2;
        displayName = CSTRING(MedicalSettings_Module_DisplayName);
        icon = QPATHTOF(UI\Icon_Module_Medical_ca.paa);
        category = "ACE_medical";
        function = QUOTE(DFUNC(moduleMedicalSettings));
        functionPriority = 1;
        isGlobal = 1;
        isSingular = 1;
        isTriggerActivated = 0;
        author = ECSTRING(common,ACETeam);

        class Arguments {
            class medicSetting {
                displayName = CSTRING(MedicalSettings_medicSetting_DisplayName);
                description = CSTRING(MedicalSettings_medicSetting_Description);
                typeName = "NUMBER";
                class values {
                    class disable {
                        name = ECSTRING(common,Disabled);
                        value = 0;
                    };
                    class normal {
                        name = ECSTRING(common,Normal);
                        value = 1;
                        default = 1;
                    };
                    class full  {
                        name = ECSTRING(common,Advanced);
                        value = 2;
                    };
                };
            };
            class increaseTrainingInLocations {
                displayName = CSTRING(MedicalSettings_increaseTrainingInLocations_DisplayName);
                description = CSTRING(MedicalSettings_increaseTrainingInLocations_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class bleedingCoefficient {
                displayName = CSTRING(MedicalSettings_bleedingCoefficient_DisplayName);
                description = CSTRING(MedicalSettings_bleedingCoefficient_Description);
                typeName = "NUMBER";
                defaultValue = 1;
            };
            class painCoefficient {
                displayName = CSTRING(MedicalSettings_painCoefficient_DisplayName);
                description = CSTRING(MedicalSettings_painCoefficient_Description);
                typeName = "NUMBER";
                defaultValue = 1;
            };

            class advancedBandages {
                displayName = CSTRING(MedicalSettings_advancedBandages_DisplayName);
                description = CSTRING(MedicalSettings_advancedBandages_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class advancedMedication {
                displayName = CSTRING(MedicalSettings_advancedMedication_DisplayName);
                description = CSTRING(MedicalSettings_advancedMedication_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class advancedDiagnose {
                displayName = CSTRING(MedicalSettings_advancedDiagnose_DisplayName);
                description = CSTRING(MedicalSettings_advancedDiagnose_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class woundReopening {
                displayName = CSTRING(MedicalSettings_enableAdvancedWounds_DisplayName);
                description = CSTRING(MedicalSettings_enableAdvancedWounds_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };

            class enableScreams {
                displayName = CSTRING(MedicalSettings_enableScreams_DisplayName);
                description = CSTRING(MedicalSettings_enableScreams_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class showPainInMenu {
                displayName = CSTRING(MedicalSettings_showPainInMenu_DisplayName);
                description = CSTRING(MedicalSettings_showPainInMenu_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class playerDamageThreshold {
                displayName = CSTRING(MedicalSettings_playerDamageThreshold_DisplayName);
                description = CSTRING(MedicalSettings_playerDamageThreshold_Description);
                typeName = "SCALAR";
                defaultValue = 1.05;
            };
            class AIDamageThreshold {
                displayName = CSTRING(MedicalSettings_AIDamageThreshold_DisplayName);
                description = CSTRING(MedicalSettings_AIDamageThreshold_Description);
                typeName = "SCALAR";
                defaultValue = 1.05;
            };
            class fatalInjuryCondition {
                displayName = CSTRING(MedicalSettings_fatalInjuryCondition_DisplayName);
                description = CSTRING(MedicalSettings_fatalInjuryCondition_Description);
                typeName = "SCALAR";
                class values {
                    class always {
                        name = ECSTRING(common,Always);
                        value = 0;
                        default = 1;
                    };
                    class incardiacarrest {
                        name = CSTRING(MedicalSettings_fatalInjuryCondition_InCardiacArrest);
                        value = 1;
                    };
                    class never {
                        name = ECSTRING(common,Never);
                        value = 1;
                    };
                };
            };
            class cardiacArrestTime {
                displayName = CSTRING(MedicalSettings_cardiacArrestTime_DisplayName);
                description = CSTRING(MedicalSettings_cardiacArrestTime_Description);
                defaultValue = 30;
                typeName = "SCALAR";
            };
            class painVisualization {
                displayName = CSTRING(MedicalSettings_medicSetting_PainVisualization_DisplayName);
                description = CSTRING(MedicalSettings_medicSetting_PainVisualization_Description);
                typeName = "SCALAR";
                class values {
                    class anyone {
                        name = CSTRING(MedicalSettings_anyone);
                        value = 0;
                        default = 1;
                    };
                    class onlymedics {
                        name = CSTRING(MedicalSettings_Medic);
                        value = 1;
                    };
                    class onlydoctors {
                        name = CSTRING(MedicalSettings_Special);
                        value = 2;
                    };
                };
            };
            class medicSetting_Epi {
                displayName = CSTRING(MedicalSettings_medicSetting_Epi_DisplayName);
                description = CSTRING(MedicalSettings_medicSetting_Epi_Description);
                typeName = "SCALAR";
                class values {
                    class anyone {
                        name = CSTRING(MedicalSettings_anyone);
                        value = 0;
                        default = 1;
                    };
                    class onlymedics {
                        name = CSTRING(MedicalSettings_Medic);
                        value = 1;
                    };
                    class onlydoctors {
                        name = CSTRING(MedicalSettings_Special);
                        value = 2;
                    };
                };
            };
            class medicSetting_Medkit {
                displayName = CSTRING(MedicalSettings_medicSetting_Medkit_DisplayName);
                description = CSTRING(MedicalSettings_medicSetting_Medkit_Description);
                typeName = "SCALAR";
                class values {
                    class anyone {
                        name = CSTRING(MedicalSettings_anyone);
                        value = 0;
                        default = 1;
                    };
                    class onlymedics {
                        name = CSTRING(MedicalSettings_Medic);
                        value = 1;
                    };
                    class onlydoctors {
                        name = CSTRING(MedicalSettings_Special);
                        value = 2;
                    };
                };
            };
            class medicSetting_PAK {
                displayName = CSTRING(MedicalSettings_medicSetting_PAK_DisplayName);
                description = CSTRING(MedicalSettings_medicSetting_PAK_Description);
                typeName = "SCALAR";
                class values {
                    class anyone {
                        name = CSTRING(MedicalSettings_anyone);
                        value = 0;
                        default = 1;
                    };
                    class onlymedics {
                        name = "Medics only";
                        value = 1;
                    };
                    class onlydoctors {
                        name = CSTRING(MedicalSettings_Special);
                        value = 2;
                    };
                };
            };
            class medicSetting_SurgicalKit {
                displayName = CSTRING(MedicalSettings_medicSetting_SurgicalKit_DisplayName);
                description = CSTRING(MedicalSettings_medicSetting_SurgicalKit_Description);
                typeName = "SCALAR";
                class values {
                    class anyone {
                        name = CSTRING(MedicalSettings_anyone);
                        value = 0;
                        default = 1;
                    };
                    class onlymedics {
                        name = CSTRING(MedicalSettings_Medic);
                        value = 1;
                    };
                    class onlydoctors {
                        name = CSTRING(MedicalSettings_Special);
                        value = 2;
                    };
                };
            };
            class consumeItem_Medkit {
                displayName = CSTRING(MedicalSettings_consumeItem_Medkit_DisplayName);
                description = CSTRING(MedicalSettings_consumeItem_Medkit_Description);
                typeName = "SCALAR";
                class values {
                    class no {
                        name = ECSTRING(common,No);
                        value = 0;
                    };
                    class yes {
                        name = ECSTRING(common,Yes);
                        value = 1;
                        default = 1;
                    };
                };
            };
            class consumeItem_PAK {
                displayName = CSTRING(MedicalSettings_consumeItem_PAK_DisplayName);
                description = CSTRING(MedicalSettings_consumeItem_PAK_Description);
                typeName = "SCALAR";
                class values {
                    class no {
                        name = ECSTRING(common,No);
                        value = 0;
                    };
                    class yes {
                        name = ECSTRING(common,Yes);
                        value = 1;
                        default = 1;
                    };
                };
            };
            class consumeItem_SurgicalKit {
                displayName = CSTRING(MedicalSettings_consumeItem_SurgicalKit_DisplayName);
                description = CSTRING(MedicalSettings_consumeItem_SurgicalKit_Description);
                typeName = "SCALAR";
                class values {
                    class no {
                        name = ECSTRING(common,No);
                        value = 0;
                    };
                    class yes {
                        name = ECSTRING(common,Yes);
                        value = 1;
                        default = 1;
                    };
                };
            };
            class useLocation_Epi {
                displayName = CSTRING(BasicMedicalSettings_useLocation_Epi_DisplayName);
                description = CSTRING(BasicMedicalSettings_useLocation_Epi_Description);
                typeName = "SCALAR";
                class values {
                    class anywhere {
                        name = ECSTRING(common,Anywhere);
                        value = 0;
                        default = 1;
                    };
                    class vehicle {
                        name = ECSTRING(common,Vehicle);
                        value = 1;
                    };
                    class facility {
                        name = CSTRING(MedicalSettings_facility);
                        value = 2;
                    };
                    class vehicleAndFacility {
                        name = CSTRING(MedicalSettings_vehicleAndFacility);
                        value = 3;
                    };
                    class disabled {
                        name = ECSTRING(common,Disabled);
                        value = 4;
                    };
                };
            };
            class useLocation_Medkit {
                displayName = CSTRING(MedicalSettings_useLocation_Medkit_DisplayName);
                description = CSTRING(MedicalSettings_useLocation_Medkit_Description);
                typeName = "SCALAR";
                class values {
                    class anywhere {
                        name = ECSTRING(common,Anywhere);
                        value = 0;
                        default = 1;
                    };
                    class vehicle {
                        name = ECSTRING(common,Vehicle);
                        value = 1;
                    };
                    class facility {
                        name = CSTRING(MedicalSettings_facility);
                        value = 2;
                    };
                    class vehicleAndFacility {
                        name = CSTRING(MedicalSettings_vehicleAndFacility);
                        value = 3;
                    };
                    class disabled {
                        name = ECSTRING(common,Disabled);
                        value = 4;
                    };
                };
            };
            class useLocation_PAK {
                displayName = CSTRING(MedicalSettings_useLocation_PAK_DisplayName);
                description = CSTRING(MedicalSettings_useLocation_PAK_Description);
                typeName = "SCALAR";
                class values {
                    class anywhere {
                        name = ECSTRING(common,Anywhere);
                        value = 0;
                        default = 1;
                    };
                    class vehicle {
                        name = ECSTRING(common,Vehicle);
                        value = 1;
                    };
                    class facility {
                        name = CSTRING(MedicalSettings_facility);
                        value = 2;
                    };
                    class vehicleAndFacility {
                        name = CSTRING(MedicalSettings_vehicleAndFacility);
                        value = 3;
                    };
                    class disabled {
                        name = ECSTRING(common,Disabled);
                        value = 4;
                    };
                };
            };
            class useLocation_SurgicalKit {
                displayName = CSTRING(MedicalSettings_useLocation_SurgicalKit_DisplayName);
                description = CSTRING(MedicalSettings_useLocation_SurgicalKit_Description);
                typeName = "SCALAR";
                class values {
                    class anywhere {
                        name = ECSTRING(common,Anywhere);
                        value = 0;
                        default = 1;
                    };
                    class vehicle {
                        name = ECSTRING(common,Vehicle);
                        value = 1;
                    };
                    class facility {
                        name = CSTRING(MedicalSettings_facility);
                        value = 2;
                    };
                    class vehicleAndFacility {
                        name = CSTRING(MedicalSettings_vehicleAndFacility);
                        value = 3;
                    };
                    class disabled {
                        name = ECSTRING(common,Disabled);
                        value = 4;
                    };
                };
            };
            class remainingDamage_Medkit {
                displayName = CSTRING(MedicalSettings_remainingDamage_Medkit_DisplayName);
                description = CSTRING(MedicalSettings_remainingDamage_Medkit_Description);
                typeName = "SCALAR";
                defaultValue = 0.1;
            };
            class allowUnconsciousAnimationOnTreatment {
                displayName = CSTRING(MedicalSettings_allowUnconsciousAnimationOnTreatment_DisplayName);
                description = CSTRING(MedicalSettings_allowUnconsciousAnimationOnTreatment_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class menuTypeStyle {
                displayName = CSTRING(menuTypeDisplay);
                description = CSTRING(menuTypeDescription);
                typeName = "SCALAR";
                isClientSettable = 1;
                class values {
                    class useSelection {
                        name = CSTRING(useSelection);
                        value = 0;
                        default = 1;
                    };
                    class useRadial {
                        name = CSTRING(useRadial);
                        value = 1;
                    };
                    class disabled {
                        name = ECSTRING(common,Disabled);
                        value = 1;
                    };
                };
            };
            class ivFlowRate {
                displayName = CSTRING(MedicalSettings_ivFlowRate_DisplayName);
                description = CSTRING(MedicalSettings_ivFlowRate_Description);
                typeName = "SCALAR";
                defaultValue = 1;
            };
            class allowSelfIV {
                displayName = CSTRING(MedicalSettings_allowSelfIV_DisplayName);
                description = CSTRING(MedicalSettings_allowSelfIV_Description);
                typeName = "SCALAR";
                class values {
                    class no {
                        name = ECSTRING(common,No);
                        value = 0;
                        default = 1;
                    };
                    class yes {
                        name = ECSTRING(common,Yes);
                        value = 1;
                    };
                };
            };
            class spontaneousWakeUpChance {
                displayName = CSTRING(MedicalSettings_spontaneousWakeUpChance_DisplayName);
                description = CSTRING(MedicalSettings_spontaneousWakeUpChance_Description);
                typeName = "SCALAR";
                defaultValue = 0;
            };
        };
    };
    class MapBoard_altis_F;
    class ACE_bodyBagObject: MapBoard_altis_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        scope = 1;
        scopeCurator = 2;
        side = -1;
        model = QPATHTOEF(apl,ace_bodybag.p3d);
        icon = "";
        displayName = CSTRING(Bodybag_Display);
        EGVAR(dragging,canDrag) = 1;
        EGVAR(dragging,dragPosition)[] = {0,1.2,0};
        EGVAR(dragging,dragDirection) = 0;
        EGVAR(cargo,size) = 1;
        EGVAR(cargo,canLoad) = 1;
        hiddenSelections[] = {"camo"};
        hiddenSelectionsTextures[] = {QPATHTOEF(apl,data\bodybag_co.paa)};
        class ACE_Actions {
            class ACE_MainActions {
                displayName = ECSTRING(interaction,MainAction);
                distance = 5;
                condition = QUOTE(true);
                statement = "";
                icon = "\a3\ui_f\data\IGUI\Cfg\Actions\eject_ca.paa";
                selection = "";
            };
        };
    };

    // Medical litter classes
    class Thing;
    class ACE_MedicalLitterBase: Thing {
        scope = 1;
        scopeCurator = 0;
        displayName = " ";
        destrType = "DestructNo";
        model = QPATHTOF(data\littergeneric.p3d);
    };
    class ACE_MedicalLitter_clean: ACE_MedicalLitterBase {
        model = QPATHTOF(data\littergeneric_clean.p3d);
    };
    class ACE_MedicalLitter_bandage1: ACE_MedicalLitterBase {
        model = QPATHTOF(data\littergeneric_bandages1.p3d);
    };
    class ACE_MedicalLitter_bandage2: ACE_MedicalLitterBase {
        model = QPATHTOF(data\littergeneric_bandages2.p3d);
    };
    class ACE_MedicalLitter_bandage3: ACE_MedicalLitterBase {
        model = QPATHTOF(data\littergeneric_bandages3.p3d);
    };
    class ACE_MedicalLitter_packingBandage: ACE_MedicalLitterBase {
        model = QPATHTOF(data\littergeneric_packingBandage.p3d);
    };
    class ACE_MedicalLitter_gloves: ACE_MedicalLitterBase {
        model = QPATHTOF(data\littergeneric_gloves.p3d);
    };
    class ACE_MedicalLitter_adenosine: ACE_MedicalLitterBase {
        model = QPATHTOF(data\littergeneric_adenosine.p3d);
    };
    class ACE_MedicalLitter_atropine: ACE_MedicalLitterBase {
        model = QPATHTOF(data\littergeneric_atropine.p3d);
    };
    class ACE_MedicalLitter_epinephrine: ACE_MedicalLitterBase {
        model = QPATHTOF(data\littergeneric_epinephrine.p3d);
    };
    class ACE_MedicalLitter_morphine: ACE_MedicalLitterBase {
        model = QPATHTOF(data\littergeneric_morphine.p3d);
    };
    class ACE_MedicalLitter_QuickClot: ACE_MedicalLitterBase {
        model = QPATHTOF(data\littergeneric_Quikclot.p3d);
    };
    class Item_Base_F;
    class ACE_fieldDressingItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Bandage_Basic_Display);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_fieldDressing,1);
        };
    };
    class ACE_packingBandageItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Packing_Bandage_Display);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_packingBandage,1);
        };
    };
    class ACE_elasticBandageItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Bandage_Elastic_Display);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_elasticBandage,1);
        };
    };
    class ACE_tourniquetItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Tourniquet_Display);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_tourniquet,1);
        };
    };
    class ACE_morphineItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Morphine_Display);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_morphine,1);
        };
    };
    class ACE_adenosineItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Adenosine_Display);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_adenosine,1);
        };
    };
    class ACE_atropineItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Atropine_Display);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_atropine,1);
        };
    };
    class ACE_epinephrineItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Epinephrine_Display);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_epinephrine,1);
        };
    };
    class ACE_plasmaIVItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Plasma_IV);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_plasmaIV,1);
        };
    };

    class ACE_bloodIVItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Blood_IV);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_bloodIV,1);
        };
    };
    class ACE_salineIVItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Saline_IV);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_salineIV,1);
        };
    };
    class ACE_quikClotItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(QuikClot_Display);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_quikclot,1);
        };
    };
    class ACE_medKitItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Med_Kit_Display);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_medKit,1);
        };
    };
    class ACE_personalAidKitItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Aid_Kit_Display);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_personalAidKit,1);
        };
    };
    class ACE_surgicalKitItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(SurgicalKit_Display);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_surgicalKit,1);
        };
    };
    class ACE_bodyBagItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Bodybag_Display);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_bodyBag,1);
        };
    };

    class ThingX;
    class ReammoBox_F: ThingX {
        class ACE_Actions;
    };
    class NATO_Box_Base: ReammoBox_F {
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions;
        };
    };
    class ACE_medicalSupplyCrate: NATO_Box_Base {
        scope = 2;
        scopeCurator = 2;
        accuracy = 1000;
        displayName = CSTRING(medicalSupplyCrate);
        model = QPATHTOF(data\ace_medcrate.p3d);
        author = ECSTRING(common,ACETeam);
        class TransportItems {
            MACRO_ADDITEM(ACE_fieldDressing,50);
            MACRO_ADDITEM(ACE_morphine,25);
            MACRO_ADDITEM(ACE_epinephrine,25);
            MACRO_ADDITEM(ACE_bloodIV,15);
            MACRO_ADDITEM(ACE_bloodIV_500,15);
            MACRO_ADDITEM(ACE_bloodIV_250,15);
            MACRO_ADDITEM(ACE_bodyBag,10);
        };
        class AnimationSources {
            class Cover {
                source = "user";
                animPeriod = 1.5;
                initPhase = 0;
                minValue = 0;
                maxValue = 1;
            };
        };
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                selection = "cover_action";

                class ACE_OpenLid {
                    displayName = CSTRING(openLid);
                    condition = QUOTE(alive _target && {_target animationPhase 'Cover' < 0.5});
                    statement = QUOTE(_target animate ARR_2(['Cover',1]));
                    showDisabled = 0;
                    priority = -1;
                };
                class ACE_CloseLid {
                    displayName = CSTRING(closeLid);
                    condition = QUOTE(alive _target && {_target animationPhase 'Cover' >= 0.5});
                    statement = QUOTE(_target animate ARR_2(['Cover',0]));
                    showDisabled = 0;
                    priority = -1;
                };
            };
        };
    };
    class ACE_medicalSupplyCrate_advanced: ACE_medicalSupplyCrate {
        displayName = CSTRING(medicalSupplyCrate_advanced);
        class TransportItems {
            MACRO_ADDITEM(ACE_fieldDressing,25);
            MACRO_ADDITEM(ACE_packingBandage,25);
            MACRO_ADDITEM(ACE_elasticBandage,25);
            MACRO_ADDITEM(ACE_tourniquet,15);
            MACRO_ADDITEM(ACE_morphine,15);
            MACRO_ADDITEM(ACE_adenosine,15);
            MACRO_ADDITEM(ACE_atropine,15);
            MACRO_ADDITEM(ACE_epinephrine,15);
            MACRO_ADDITEM(ACE_plasmaIV,7);
            MACRO_ADDITEM(ACE_plasmaIV_500,7);
            MACRO_ADDITEM(ACE_plasmaIV_250,7);
            MACRO_ADDITEM(ACE_salineIV,7);
            MACRO_ADDITEM(ACE_salineIV_500,7);
            MACRO_ADDITEM(ACE_salineIV_250,7);
            MACRO_ADDITEM(ACE_bloodIV,7);
            MACRO_ADDITEM(ACE_bloodIV_500,7);
            MACRO_ADDITEM(ACE_bloodIV_250,7);
            MACRO_ADDITEM(ACE_quikClot,20);
            MACRO_ADDITEM(ACE_medKit,20);
            MACRO_ADDITEM(ACE_personalAidKit,3);
            MACRO_ADDITEM(ACE_surgicalKit,2);
            MACRO_ADDITEM(ACE_bodyBag,5);
        };
    };
};
