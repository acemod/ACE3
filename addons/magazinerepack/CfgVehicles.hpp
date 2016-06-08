class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_RepackMagazines {
                displayName = CSTRING(RepackMagazines);
                condition = QUOTE(true);
                exceptions[] = {"isNotInside", "isNotSitting"};
                insertChildren = QUOTE(_this call FUNC(getMagazineChildren));
                priority = -2;
                icon = QPATHTOF(UI\repack_ca.paa);
            };
        };
    };
};
