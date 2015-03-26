class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_RepackMagazines {
                displayName = "$STR_ACE_MagazineRepack_RepackMagazines";
                condition = QUOTE(true);
                exceptions[] = {"isNotInside"};
                statement = QUOTE([_player] call FUNC(openSelectMagazineUI));
                showDisabled = 0;
                priority = -2;
                icon = QUOTE(PATHTOF(UI\repack_ca.paa));
                hotkey = "R";
            };
        };
    };
};
