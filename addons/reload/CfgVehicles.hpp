class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_Actions {
            class ACE_Weapon {
                class GVAR(LinkBelt) {
                    displayName = "$STR_ACE_Reload_LinkBelt";
                    distance = 2.0;
                    condition = QUOTE([ARR_2(_player, _target)] call FUNC(canLinkBelt));
                    statement = QUOTE([ARR_2(_player, _target)] call FUNC(startLinkingBelt));
                };
                class GVAR(CheckAmmo) {
                    displayName = "$STR_ACE_Reload_checkAmmo";
                    distance = 2.0;
                    condition = QUOTE([ARR_2(_player, _target)] call FUNC(canCheckAmmo));
                    statement = QUOTE([ARR_2(_player, _target)] call FUNC(checkAmmo));
                };
            };
        };

        class ACE_SelfActions {
            class GVAR(CheckAmmo) {
                displayName = "$STR_ACE_Reload_checkAmmo";
                condition = QUOTE([ARR_2(_player, _target)] call FUNC(canCheckAmmoHover));
                insertChildren = QUOTE(_this call FUNC(checkAmmoHover));
                exceptions[] = {"isNotInside"};
            };
        };
    };

    class LandVehicle;
    class StaticWeapon: LandVehicle {
        class ACE_Actions {
            class ACE_MainActions {
                class GVAR(CheckAmmo) {
                    displayName = "$STR_ACE_Reload_checkAmmo";
                    distance = 2.0;
                    condition = QUOTE([ARR_2(_player, _target)] call FUNC(canCheckAmmoHover));
                    insertChildren = QUOTE(_this call FUNC(checkAmmoHover));
                };
            };
        };
    };

    class StaticMortar: StaticWeapon {};
    class Mortar_01_base_F: StaticMortar {
        class ACE_Actions {
            class ACE_MainActions {
                class GVAR(CheckAmmo) {
                    displayName = "$STR_ACE_Reload_checkAmmo";
                    distance = 2.0;
                    condition = QUOTE([ARR_2(_player, _target)] call FUNC(canCheckAmmoHover));
                    insertChildren = QUOTE(_this call FUNC(checkAmmoHover));
                };
            };
        };
    };
};
