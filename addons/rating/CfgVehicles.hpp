class CfgVehicles {
    class ACE_Module;
    class ACE_moduleRatingSettings: ACE_Module {
        scope = 2;
        displayName = CSTRING(RatingSettings_Module_DisplayName);
        category = "ACE";
        function = QFUNC(moduleRatingSettings);
        functionPriority = 1;
        isGlobal = 1;
        isSingular = 1;
        isTriggerActivated = 0;
        author = ECSTRING(common,ACETeam);

        class Arguments {
            class allowNegativeRatingPlayers {
                displayName = CSTRING(RatingSettings_AllowRatingPlayers_DisplayName);
                description = CSTRING(RatingSettings_AllowRatingPlayers_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class allowNegativeRatingAi {
                displayName = CSTRING(RatingSettings_AllowRatingAi_DisplayName);
                description = CSTRING(RatingSettings_AllowRatingAi_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
        };

        class ModuleDescription {
            description = CSTRING(RatingSettings_Module_Description);
            sync[] = {};
        };
    };
};
