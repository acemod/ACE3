class CfgVehicles {
    class ACE_Module;
    class GVAR(ModuleSettings): ACE_Module {
        scope = 2;
        displayName = "Wind Deflection";
        icon = QUOTE(PATHTOF(UI\Icon_Module_Wind_ca.paa));
        category = "ACE";
        function = QUOTE(DFUNC(initModuleSettings));
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        author = "$STR_ACE_Common_ACETeam";
        class Arguments {
            class simulationInterval {
                displayName = "Simulation Interval";
                description = "Defines the interval between every calculation step";
                typeName = "NUMBER";
                defaultValue = 0.05;
            };
            class simulationRadius {
                displayName = "Simulation Radius";
                description = "Defines the radius (in meters) in which advanced ballistics are applied";
                typeName = "NUMBER";
                defaultValue = 3000;
            };
        };
    };
};
