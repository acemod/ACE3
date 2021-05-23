class CfgVehicles {
    class StaticWeapon;
    class StaticMGWeapon: StaticWeapon {
        class Turrets;
    };
    class B_Ship_MRLS_01_base_F: StaticMGWeapon {
        class AnimationSources;
        class Turrets: Turrets {
            class MainTurret;
        };
    };
    // Use a custom ACE variant due to custom interface for launching
    class GVAR(vls_c): B_Ship_MRLS_01_base_F {
        displayName = CSTRING(vls_c);
        scope = 2;
        scopeCurator = 2;
        side = 1;
        faction = "BLU_F";
        crew = "B_UAV_AI";
        class AnimationSources: AnimationSources {
            class Missiles_revolving {
                source = "ammo";
                weapon = QGVAR(c);
                animPeriod = 0.001;
            };
        };
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = {
                    QGVAR(c)
                };
                magazines[] = {
                    QGVAR(c)
                };
            };
        };
    };
    class GVAR(vls_d): B_Ship_MRLS_01_base_F {
        displayName = CSTRING(vls_d);
        scope = 2;
        scopeCurator = 2;
        side = 1;
        faction = "BLU_F";
        crew = "B_UAV_AI";
        class AnimationSources: AnimationSources {
            class Missiles_revolving {
                source = "ammo";
                weapon = QGVAR(d);
                animPeriod = 0.001;
            };
        };
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = {
                    QGVAR(d)
                };
                magazines[] = {
                    QGVAR(d)
                };
            };
        };
    };
};