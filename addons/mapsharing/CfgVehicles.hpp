class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_ShareMap {
                displayName = "Share Map";
                condition = QUOTE([_player] call FUNC(canShareMap));
                statement = QUOTE([_player] call FUNC(doShareMap));
                exceptions[] = {QEGVAR(common,notOnMap)};
                showDisabled = 0;
                priority = 45;
                icon = PATHTOF(UI\bear_ca.paa);
                enableInside = 1;
            };
        };
        class ACE_Actions {
            class ACE_OpenSharedMap {
                displayName = "Open Shared Map";
                condition = QUOTE([ARR_2(_player,_target)] call FUNC(canOpenSharedMap));
                statement = QUOTE([ARR_2(_player,_target)] call FUNC(doOpenSharedMap));
                showDisabled = 0;
                priority = 45;
                icon = PATHTOF(UI\bear_ca.paa);
                enableInside = 1;
            };
        };
    };
};
