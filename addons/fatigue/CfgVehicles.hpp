class CfgVehicles {
    class ACE_Module;
    class ACE_moduleFatigue: ACE_Module {
        scope = 2;
        displayName = CSTRING(module_displayName);
        icon = QUOTE(PATHTOF(UI\Icon_Module_Fatigue_ca.paa));
        category = "ACE";
        function = QFUNC(module);
        functionPriority = 1;
        isGlobal = 0;
        isSingular = 1;
        isTriggerActivated = 0;
        author = ECSTRING(common,ACETeam);

        class Arguments {
            class enabled {
                displayName = CSTRING(enabled_displayName);
                description = CSTRING(enabled_description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class staminaDrainMultiplier {
                displayName = CSTRING(staminaDrainMultiplier_displayName);
                description = CSTRING(staminaDrainMultiplier_description);
                typeName = "NUMBER";
                defaultValue = 1;
            };
            class staminaRecoveryMultiplier {
                displayName = CSTRING(staminaRecoveryMultiplier_displayName);
                description = CSTRING(staminaRecoveryMultiplier_description);
                typeName = "NUMBER";
                defaultValue = 1;
            };
            class loadEffectOnMaxStamina {
                displayName = CSTRING(loadEffectOnMaxStamina_displayName);
                description = CSTRING(loadEffectOnMaxStamina_description);
                typeName = "NUMBER";
                defaultValue = 0.1;
            };
            class canNoLongerSprint {
                displayName = CSTRING(canNoLongerSprint_displayName);
                description = CSTRING(canNoLongerSprint_description);
                typeName = "NUMBER";
                defaultValue = 0.5;
            };
            class canNoLongerRun {
                displayName = CSTRING(canNoLongerRun_displayName);
                description = CSTRING(canNoLongerRun_description);
                typeName = "NUMBER";
                defaultValue = 0;
            };
            class runCooldownAfterExhaustion {
                displayName = CSTRING(runCooldownAfterExhaustion_displayName);
                description = CSTRING(runCooldownAfterExhaustion_description);
                typeName = "NUMBER";
                defaultValue = 10;
            };
        };
        class ModuleDescription {
            description = CSTRING(module_displayName);
            sync[] = {};
        };
    };
};
