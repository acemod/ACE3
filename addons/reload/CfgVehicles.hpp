class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_Actions {
            class ACE_Weapon {
                class GVAR(LinkBelt) {
                    displayName = CSTRING(LinkBelt);
                    distance = 2.0;
                    condition = QUOTE(([ARR_2(_player, _target)] call FUNC(getAmmoToLinkBelt)) > 0);
                    statement = QUOTE([ARR_2(_player, _target)] call FUNC(startLinkingBelt));
                    exceptions[] = {"isNotInside"};
                };
                class GVAR(CheckAmmo) {
                    displayName = CSTRING(checkAmmo);
                    distance = 2.0;
                    condition = QUOTE([ARR_2(_player, _target)] call FUNC(canCheckAmmo));
                    statement = QUOTE([ARR_2(_player, _target)] call FUNC(checkAmmo));
                    exceptions[] = {"isNotInside", "isNotSwimming", "isNotSitting"};
                };
            };
        };
    };

    class LandVehicle;
    class StaticWeapon: LandVehicle {
        class ACE_Actions {
            class ACE_MainActions {
                class GVAR(CheckAmmo) {
                    displayName = CSTRING(checkAmmo);
                    distance = 2.0;
                    condition = QUOTE([ARR_2(_player, _target)] call FUNC(canCheckAmmo));
                    statement = QUOTE([ARR_2(_player, _target)] call FUNC(checkAmmo));
                    exceptions[] = {"isNotInside", "isNotSwimming", "isNotSitting"};
                };
            };
        };
        class ACE_SelfActions {
            class GVAR(reloadTurret) {
                displayName = "$STR_controls_tooltips_RELOAD_MAGAZINE";
                condition = QUOTE(call FUNC(canSwapTurretMagazine));
                statement = QUOTE(call FUNC(swapTurretMagazine));
            };
        };
    };

    class Tank: LandVehicle {
        class ACE_SelfActions {
            class GVAR(reloadTurret) {
                displayName = "$STR_controls_tooltips_RELOAD_MAGAZINE";
                condition = QUOTE(call FUNC(canSwapTurretMagazine));
                statement = QUOTE(call FUNC(swapTurretMagazine));
            };
        };
    };

    class Car: LandVehicle {
        class ACE_SelfActions {
            class GVAR(reloadTurret) {
                displayName = "$STR_controls_tooltips_RELOAD_MAGAZINE";
                condition = QUOTE(call FUNC(canSwapTurretMagazine));
                statement = QUOTE(call FUNC(swapTurretMagazine));
            };
        };
    };

    class Air;
    class Helicopter: Air {
        class ACE_SelfActions {
            class GVAR(reloadTurret) {
                displayName = "$STR_controls_tooltips_RELOAD_MAGAZINE";
                condition = QUOTE(call FUNC(canSwapTurretMagazine));
                statement = QUOTE(call FUNC(swapTurretMagazine));
            };
        };
    };
};
