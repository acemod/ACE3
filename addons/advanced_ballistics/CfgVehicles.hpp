class CfgVehicles {
    class ACE_Module;
    class GVAR(ModuleSettings): ACE_Module {
        scope = 2;
        displayName = "Advanced Ballistics";
        icon = QUOTE(PATHTOF(UI\Icon_Module_Wind_ca.paa));
        category = "ACE";
        function = QUOTE(DFUNC(initModuleSettings));
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        author = "Ruthberg";
        class Arguments {
            class enabled {
                displayName = "Advanced Ballistics";
                description = "Enables advanced ballistics";
                typeName = "BOOL";
                defaultValue = 0;
            };
            class alwaysSimulateForSnipers {
                displayName = "Always Enabled For Snipers";
                description = "Always enables advanced ballistics when high power optics are used";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class disabledInFullAutoMode {
                displayName = "Disabled In FullAuto Mode";
                description = "Disables the advanced ballistics during full auto fire";
                typeName = "BOOL";
                defaultValue = 0;
            };
            class onlyActiveForLocalPlayers {
                displayName = "Disabled For Non Local Players";
                description = "Disables the advanced ballistics for bullets coming from other players (enable this if you encounter frame drops during heavy firefights in multiplayer)";
                typeName = "BOOL";
                defaultValue = 1;
            };
            /* // TODO: We currently do not have firedEHs on vehicles
            class vehicleGunnerEnabled {
                displayName = "Enabled For Vehicle Gunners";
                description = "Enables advanced ballistics for vehicle gunners";
                typeName = "BOOL";
                defaultValue = 0;
            };
            */
            class ammoTemperatureEnabled {
                displayName = "Enable Ammo Temperature Simulation";
                description = "Muzzle velocity varies with ammo temperature";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class barrelLengthInfluenceEnabled {
                displayName = "Enable Barrel Length Simulation";
                description = "Muzzle velocity varies with barrel length";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class bulletTraceEnabled {
                displayName = "Enable Bullet Trace Effect";
                description = "Enables a bullet trace effect to high caliber bullets (only visible when looking through high power optics)";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class simulationInterval {
                displayName = "Simulation Interval";
                description = "Defines the interval between every calculation step";
                typeName = "NUMBER";
                defaultValue = 0.0;
            };
            class simulationRadius {
                displayName = "Simulation Radius";
                description = "Defines the radius around the player (in meters) at which advanced ballistics are applied to projectiles";
                typeName = "NUMBER";
                defaultValue = 3000;
            };
        };
    };
};
