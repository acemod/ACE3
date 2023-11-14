class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class GVAR(checkAmmo) {
                    displayName = CSTRING(checkAmmo);
                    condition = QUOTE(GVAR(showCheckAmmoSelf) && {_player call FUNC(canCheckAmmoSelf)});
                    statement = QUOTE(call FUNC(checkAmmo));
                    exceptions[] = {"isNotInside", "isNotSwimming", "isNotSitting"};
                };
            };
        };

        class ACE_Actions {
            class ACE_Weapon {
                class GVAR(linkBelt) {
                    displayName = CSTRING(linkBelt);
                    distance = 2;
                    condition = QUOTE(([ARR_2(_player,_target)] call FUNC(getAmmoToLinkBelt)) > 0);
                    statement = QUOTE([ARR_2(_player,_target)] call FUNC(startLinkingBelt));
                    exceptions[] = {"isNotInside"};
                };
                class GVAR(checkAmmo) {
                    displayName = CSTRING(checkAmmo);
                    distance = 2;
                    condition = QUOTE(call FUNC(canCheckAmmo));
                    statement = QUOTE(call FUNC(checkAmmo));
                    exceptions[] = {"isNotInside", "isNotSwimming", "isNotSitting"};
                };
            };
        };
    };

    class LandVehicle;
    class StaticWeapon: LandVehicle {
        class ACE_Actions {
            class ACE_MainActions {
                class GVAR(checkAmmo) {
                    displayName = CSTRING(checkAmmo);
                    distance = 2;
                    condition = QUOTE(call FUNC(canCheckAmmo));
                    statement = QUOTE(call FUNC(checkAmmo));
                    exceptions[] = {"isNotInside", "isNotSwimming", "isNotSitting"};
                };
            };
        };
    };
};
