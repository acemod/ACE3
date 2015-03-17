class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_Actions {
            class ACE_Weapon {
                class ACE_LinkBelt {
                    displayName = "$STR_ACE_Reload_LinkBelt";
                    distance = 2.0;
                    condition = QUOTE([ARR_2(_player, _target)] call FUNC(canLinkBelt));
                    statement = QUOTE([ARR_2(_player, _target)] call FUNC(startLinkingBelt));
                };
                class ACE_CheckAmmo {
                    displayName = "$STR_ACE_Reload_checkAmmo";
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
                class ACE_CheckAmmo {
                    displayName = "$STR_ACE_Reload_checkAmmo";
                    distance = 2.0;
                    condition = QUOTE([ARR_2(_player, _target)] call FUNC(canCheckAmmo));
                    statement = QUOTE([ARR_2(_player, _target)] call FUNC(checkAmmo));
                };
            };
        };
    };
};
