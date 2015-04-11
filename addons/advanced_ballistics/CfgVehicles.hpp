class CfgVehicles {
    class Module_F;
    class GVAR(Module): Module_F {
        author = "Ruthberg";
        category = "ACE";
        displayName = "Advanced Ballistics";
        scope = 2;
        isGlobal = 1;
        icon = QUOTE(PATHTOF(UI\Icon_Module_Wind_ca.paa));
        class Arguments {
            class enabled {
                displayName = "Advanced Ballistics";
                description = "Enable Advanced Ballistics?";
                typeName = "BOOL";
                defaultValue = 0;
            };
            class enableAmmoTemperatureSimulation {
                displayName = "Enable Ammo Temperature";
                description = "Muzzle velocity varies with ammo temperature";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class enableBarrelLengthSimulation {
                displayName = "Enable Barrel Length";
                description = "Muzzle velocity varies with barrel length";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class enableBulletTraceEffect {
                displayName = "Enable Bullet Trace";
                description = "Enables the bullet trace effect";
                typeName = "BOOL";
                defaultValue = 1;
            };
        };
    };
};
