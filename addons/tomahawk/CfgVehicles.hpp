class CfgVehicles {
    class StaticWeapon;
    class StaticMGWeapon: StaticWeapon {
        class Turrets;
    };
    class B_Ship_MRLS_01_base_F: StaticMGWeapon {
        class Turrets: Turrets {
            class MainTurret;
        };
    };
    // Use a custom ACE variant due to custom interface for launching
    class GVAR(vls): B_Ship_MRLS_01_base_F {
        displayName = "[ACE] Mk41 VLS";
        class AnimationSources {
            class Missiles_revolving {
                source = "ammo";
                source = "revolving";
                weapon = QGVAR(c);
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
};