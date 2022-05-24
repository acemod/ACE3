class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class GVAR(white): ACE_ItemCore {
        GVAR(vehicle) = GVAR(white);
        author = ECSTRING(common,ACETeam);
        scope = 2;
        displayName = CSTRING(white);
        model = QPATHTOF(data\ace_markerpole.p3d);
        picture = QPATHTOF(ui\white_ca.paa);
        icon = "iconObject_1x10";
        mapSize = 0.2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };

    class GVAR(black): GVAR(white) {
        GVAR(vehicle) = GVAR(black);
        displayName = CSTRING(black);
        picture = QPATHTOF(ui\black_ca.paa);
    };
    class GVAR(red): GVAR(white) {
        GVAR(vehicle) = GVAR(red);
        displayName = CSTRING(red);
        picture = QPATHTOF(ui\red_ca.paa);
    };
    class GVAR(green): GVAR(white) {
        GVAR(vehicle) = GVAR(green);
        displayName = CSTRING(green);
        picture = QPATHTOF(ui\green_ca.paa);
    };
    class GVAR(blue): GVAR(white) {
        GVAR(vehicle) = GVAR(blue);
        displayName = CSTRING(blue);
        picture = QPATHTOF(ui\blue_ca.paa);
    };
    class GVAR(yellow): GVAR(white) {
        GVAR(vehicle) = GVAR(yellow);
        displayName = CSTRING(yellow);
        picture = QPATHTOF(ui\yellow_ca.paa);
    };
    class GVAR(orange): GVAR(white) {
        GVAR(vehicle) = GVAR(orange);
        displayName = CSTRING(orange);
        picture = QPATHTOF(ui\orange_ca.paa);
    };
    class GVAR(purple): GVAR(white) {
        GVAR(vehicle) = GVAR(purple);
        displayName = CSTRING(purple);
        picture = QPATHTOF(ui\purple_ca.paa);
    };
};
