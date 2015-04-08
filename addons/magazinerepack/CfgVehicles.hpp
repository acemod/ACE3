class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_RepackMagazines {
                displayName = "$STR_ACE_MagazineRepack_RepackMagazines";
                condition = QUOTE(true);
                exceptions[] = {"isNotInside"};
                insertChildren = QUOTE(_this call FUNC(getMagazineChildren));
                priority = -2;
                icon = QUOTE(PATHTOF(UI\repack_ca.paa));
            };
        };
    };
};
