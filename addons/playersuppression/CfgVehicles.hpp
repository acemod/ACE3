class CfgVehicles {

    class Logic;
    class Module_F: Logic {
        class ArgumentsBaseUnits {
        };
    };
    class ACE_Module;
    // TODO localization for all the modules
    class ACE_playerSuppressionEnable: ACE_Module {
        scope = 2;
        displayName = "Player Suppression";
        category = "ACE";
        function = QFUNC(modulePlayerSuppression);
        isGlobal = 1;
        author = "$STR_ACE_Common_ACETeam";
        class Arguments {
            class intensity {
                displayName  = "Intensity";
                description  = "Intensity of the suppression effect, default 1";
                typeName     = "NUMBER";
                defaultValue = 1;
            };
        };			
    };
};

