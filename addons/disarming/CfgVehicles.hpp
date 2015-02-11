class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_Actions {
            class ACE_Disarm {
                displayName = "Disarm >>";
                distance = 3;
                condition = QUOTE([ARR_2(_player, _target)] call FUNC(canDisarm));
                statement = "";
                showDisabled = 0;
                priority = 3.2;
                // icon = PATHTOF(UI\team\team_management_ca.paa);
                subMenu[] = {"ACE_Disarm", 0};
                // hotkey = "M";
                enableInside = 0;

                class ACE_primaryweapononly {
                    displayName = "primaryweapononly";
                    distance = 3;
                    condition = QUOTE([ARR_3(_player, _target, 'primaryweapononly')] call FUNC(canDisarm));
                    statement = QUOTE([ARR_3(_player, _target, 'primaryweapononly')] call FUNC(startDisarmCaller));
                    exceptions[] = {};
                    showDisabled = 1;
                    priority = 80085;
                    // icon = QUOTE(PATHTOF(UI\handcuff_ca.paa));
                    // hotkey = "C";
                };
                class ACE_secondaryweapononly: ACE_primaryweapononly {
                    displayName = "secondaryweapononly";
                    condition = QUOTE([ARR_3(_player, _target, 'secondaryweapononly')] call FUNC(canDisarm));
                    statement = QUOTE([ARR_3(_player, _target, 'secondaryweapononly')] call FUNC(startDisarmCaller));
                    priority = 80084;
                };
                class ACE_handgunweapononly: ACE_primaryweapononly {
                    displayName = "handgunweapononly";
                    condition = QUOTE([ARR_3(_player, _target, 'handgunweapononly')] call FUNC(canDisarm));
                    statement = QUOTE([ARR_3(_player, _target, 'handgunweapononly')] call FUNC(startDisarmCaller));
                    priority = 80083;
                };
                class ACE_backpack: ACE_primaryweapononly {
                    displayName = "handgunweapononly";
                    condition = QUOTE([ARR_3(_player, _target, 'backpack')] call FUNC(canDisarm));
                    statement = QUOTE([ARR_3(_player, _target, 'backpack')] call FUNC(startDisarmCaller));
                    priority = 80082;
                };
                class ACE_alldangerous: ACE_primaryweapononly {
                    displayName = "alldangerous";
                    condition = QUOTE([ARR_3(_player, _target, 'alldangerous')] call FUNC(canDisarm));
                    statement = QUOTE([ARR_3(_player, _target, 'alldangerous')] call FUNC(startDisarmCaller));
                    priority = 80081;
                };
                class ACE_strip: ACE_primaryweapononly {
                    displayName = "strip";
                    condition = QUOTE([ARR_3(_player, _target, 'strip')] call FUNC(canDisarm));
                    statement = QUOTE([ARR_3(_player, _target, 'strip')] call FUNC(startDisarmCaller));
                    priority = 80080;
                };

            };
        };
    };
};
