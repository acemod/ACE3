class CfgVehicles {
    class Logic;
    class Module_F: Logic {
        class ArgumentsBaseUnits {
        };
    };
    class ACE_Module;
    class ACE_moduleMedicalSettings: ACE_Module {
        scope = 1;
        displayName = CSTRING(MedicalSettings_Module_DisplayName);
        icon = "";
        category = "ACE";
        function = QFUNC(moduleMedicalSettings);
        functionPriority = 1;
        isGlobal = 1;
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
                        value = 2;
                    };
                };
            };
            class fatalInjuryConditionAI {
                displayName = CSTRING(MedicalSettings_fatalInjuryConditionAI_DisplayName);
                description = CSTRING(MedicalSettings_fatalInjuryConditionAI_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class unconsciousConditionAI {
                displayName = CSTRING(MedicalSettings_unconsciousConditionAI_DisplayName);
                description = CSTRING(MedicalSettings_unconsciousConditionAI_Description);
                typeName = "BOOL";
                defaultValue = 1;
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
};
