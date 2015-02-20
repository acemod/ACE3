class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_Actions {
            class ACE_WeaponsActions {
                selection = "weapon";
                displayName = "Weapon";
                distance = 2;
                condition = QUOTE([ARR_2(_player, _target)] call FUNC(canLinkBelt));
                class ACE_LinkBelt {
                    displayName = "$STR_ACE_Reload_LinkBelt";
                    distance = 2;
                    condition = QUOTE([ARR_2(_player, _target)] call FUNC(canLinkBelt));
                    statement = QUOTE([ARR_2(_player, _target)] call FUNC(startLinkingBelt));
                };
            };
        };
    };
};
