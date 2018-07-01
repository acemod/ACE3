class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_RepackMagazines {
                displayName = CSTRING(RepackMagazines);
                condition = QUOTE(true);
                exceptions[] = {"isNotInside", "isNotSwimming", "isNotSitting"};
                insertChildren = QUOTE(_this call FUNC(getMagazineChildren));
                icon = QPATHTOEF(common,UI\repack_ca.paa);
            };
        };
    };
};
