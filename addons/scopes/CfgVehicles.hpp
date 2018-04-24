class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class GVAR(adjustZero) {
                    // Updates the zero reference
                    displayName = CSTRING(AdjustZero);
                    condition = QUOTE([ACE_player] call FUNC(canAdjustZero));
                    statement = QUOTE([ACE_player] call FUNC(adjustZero));
                    showDisabled = 0;
                    priority = 0.2;
                    //icon = QPATHTOF(UI\...); // TODO
                    exceptions[] = {"notOnMap", "isNotInside", "isNotSwimming", "isNotSitting"};
                };
                class GVAR(resetZero) {
                    // Updates the zero reference
                    displayName = CSTRING(ResetZero);
                    condition = QUOTE([ACE_player] call FUNC(canResetZero));
                    statement = QUOTE([ACE_player] call FUNC(resetZero));
                    showDisabled = 0;
                    priority = 0.2;
                    //icon = QPATHTOF(UI\...); // TODO
                    exceptions[] = {"notOnMap", "isNotInside", "isNotSwimming", "isNotSitting"};
                };
            };
        };
    };
    class ACE_Module;
    class GVAR(ModuleSettings): ACE_Module {
        scope = 1;
        displayName = CSTRING(DisplayName);
        //icon = ""; // needs an icon
        category = "ACE";
        function = QUOTE(DFUNC(initModuleSettings));
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        author = ECSTRING(common,ACETeam);
        class Arguments {
            class enabled {
                displayName = CSTRING(enabled_DisplayName);
                description = CSTRING(enabled_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class forceUseOfAdjustmentTurrets {
                displayName = CSTRING(forceUseOfAdjustmentTurrets_DisplayName);
                description = CSTRING(forceUseOfAdjustmentTurrets_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class correctZeroing {
                displayName = CSTRING(correctZeroing_DisplayName);
                description = CSTRING(correctZeroing_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class overwriteZeroRange {
                displayName = CSTRING(overwriteZeroRange_DisplayName);
                description = CSTRING(overwriteZeroRange_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class defaultZeroRange {
                displayName = CSTRING(defaultZeroRange_DisplayName);
                description = CSTRING(defaultZeroRange_Description);
                typeName = "NUMBER";
                defaultValue = 100;
            };
            class zeroReferenceTemperature {
                displayName = CSTRING(zeroReferenceTemperature_DisplayName);
                description = CSTRING(zeroReferenceTemperature_Description);
                typeName = "NUMBER";
                defaultValue = 15;
            };
            class zeroReferenceBarometricPressure {
                displayName = CSTRING(zeroReferenceBarometricPressure_DisplayName);
                description = CSTRING(zeroReferenceBarometricPressure_Description);
                typeName = "NUMBER";
                defaultValue = 1013.25;
            };
            class zeroReferenceHumidity {
                displayName = CSTRING(zeroReferenceHumidity_DisplayName);
                description = CSTRING(zeroReferenceHumidity_Description);
                typeName = "NUMBER";
                defaultValue = 0.0;
            };
            class deduceBarometricPressureFromTerrainAltitude {
                displayName = CSTRING(deduceBarometricPressureFromTerrainAltitude_DisplayName);
                description = CSTRING(deduceBarometricPressureFromTerrainAltitude_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class simplifiedZeroing {
                displayName = CSTRING(simplifiedZeroing_displayName);
                description = CSTRING(simplifiedZeroing_description);
                typeName = "BOOL";
                defaultValue = 0;
            };
        };
        class ModuleDescription {
            description = CSTRING(Description);
        };
    };
};
