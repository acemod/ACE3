class CfgVehicles {
    class ACE_Module;
    class GVAR(ModuleSettings): ACE_Module {
        scope = 2;
        displayName = "$STR_ACE_WEATHER_WINDDEFLECTION_DISPLAYNAME"; //WIND DEFLECTION
        icon = QUOTE(PATHTOF(UI\Icon_Module_Wind_ca.paa));
        category = "ACE";
        function = QUOTE(DFUNC(initModuleSettings));
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        author = "$STR_ACE_Common_ACETeam";
        class Arguments {
            class enabled {
                displayName = "$STR_ACE_WEATHER_DEFLECTIONMODULE_DISPLAYNAME";
                description = "$STR_ACE_WEATHER_DEFLECTIONMODULE_DESCRIPTION";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class vehicleEnabled {
                displayName = "$STR_ACE_WEATHER_VEHICLEENABLED_DISPLAYNAME";
                description = "$STR_ACE_WEATHER_VEHICLEENABLED_DESCRIPTION";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class simulationInterval {
                displayName = "$STR_ACE_WEATHER_SIMULATIONINTERVAL_DISPLAYNAME";
                description = "$STR_ACE_WEATHER_SIMULATIONINTERVAL_DESCRIPTION";
                typeName = "NUMBER";
                defaultValue = 0.05;
            };
            class simulationRadius {
                displayName = "$STR_ACE_WEATHER_SIMULATIONRADIUS_DISPLAYNAME";
                description = "$STR_ACE_WEATHER_SIMULATIONRADIUS_DESCRIPTION";
                typeName = "NUMBER";
                defaultValue = 3000;
            };
        };
		class ModuleDescription {
			description = "$STR_ACE_WEATHER_WINDDEFLECTION_DESCRIPTION";
		};
    };
};