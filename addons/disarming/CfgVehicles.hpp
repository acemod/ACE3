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

                class ACE_removeWeapons {
                    displayName = "Remove Weapons";
                    distance = 3;
                    condition = QUOTE([ARR_3(_player, _target, 'weapons')] call FUNC(canDisarm));
                    statement = QUOTE([ARR_3(_player, _target, 'weapons')] call FUNC(startDisarmCaller));
                    exceptions[] = {};
                    showDisabled = 1;
                    priority = 2.4;
                    // icon = QUOTE(PATHTOF(UI\handcuff_ca.paa));
                    // hotkey = "C";
                };
                class ACE_removeBackpack {
                    displayName = "Remove Backpack";
                    distance = 3;
                    condition = QUOTE([ARR_3(_player, _target, 'backpack')] call FUNC(canDisarm));
                    statement = QUOTE([ARR_3(_player, _target, 'backpack')] call FUNC(startDisarmCaller));
                    exceptions[] = {};
                    showDisabled = 1;
                    priority = 2.4;
                    // icon = QUOTE(PATHTOF(UI\handcuff_ca.paa));
                    // hotkey = "C";
                };
                class ACE_removeUniform {
                    displayName = "Remove Uniform";
                    distance = 3;
                    condition = QUOTE([ARR_3(_player, _target, 'uniform')] call FUNC(canDisarm));
                    statement = QUOTE([ARR_3(_player, _target, 'uniform')] call FUNC(startDisarmCaller));
                    exceptions[] = {};
                    showDisabled = 1;
                    priority = 2.4;
                    // icon = QUOTE(PATHTOF(UI\handcuff_ca.paa));
                    // hotkey = "C";
                };
            };
        };
    };
};
