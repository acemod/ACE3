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
                };
                class GVAR(CheckAmmo) {
                    displayName = CSTRING(checkAmmo);
                    distance = 2.0;
                    condition = QUOTE([ARR_2(_player, _target)] call FUNC(canCheckAmmo));
                    statement = QUOTE([ARR_2(_player, _target)] call FUNC(checkAmmo));
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
                };
            };
        };
    };
};
