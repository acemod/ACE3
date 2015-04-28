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
            class enabled {
                displayName = "Wind Deflection";
                description = "Enables wind deflection";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class vehicleEnabled {
                displayName = "Vehicle Enabled";
                description = "Enables wind deflection for static/vehicle gunners";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class simulationInterval {
                displayName = "Simulation Interval";
                description = "Defines the interval between every calculation step";
                typeName = "NUMBER";
                defaultValue = 0.05;
            };
            class simulationRadius {
                displayName = "Simulation Radius";
                description = "Defines the radius around the player (in meters) at which projectiles are wind deflected";
                typeName = "NUMBER";
                defaultValue = 3000;
            };
        };
    };
};
