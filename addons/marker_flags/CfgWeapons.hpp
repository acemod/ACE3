class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class GVAR(white): ACE_ItemCore {
        GVAR(vehicle) = GVAR(white);
        author = ECSTRING(common,ACETeam);
        scope = 2;
        displayName = CSTRING(white);
        model = "\a3\Structures_F_Orange\Signs\Special\FlagMarker_F.p3d";
        picture = PATHTOF(ui\white_ca.paa);
        icon = "iconObject_1x10";
        mapSize = 0.2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };

    class GVAR(black): GVAR(white) {
        GVAR(vehicle) = GVAR(black);
        displayName = CSTRING(black);
        picture = PATHTOF(ui\black_ca.paa);
    };
    class GVAR(red): GVAR(white) {
        GVAR(vehicle) = GVAR(red);
        displayName = CSTRING(red);
        picture = PATHTOF(ui\red_ca.paa);
    };
    class GVAR(green): GVAR(white) {
        GVAR(vehicle) = GVAR(green);
        displayName = CSTRING(green);
        picture = PATHTOF(ui\green_ca.paa);
    };
    class GVAR(blue): GVAR(white) {
        GVAR(vehicle) = GVAR(blue);
        displayName = CSTRING(blue);
        picture = PATHTOF(ui\blue_ca.paa);
    };
    class GVAR(yellow): GVAR(white) {
        GVAR(vehicle) = GVAR(yellow);
        displayName = CSTRING(yellow);
        picture = PATHTOF(ui\yellow_ca.paa);
    };
    class GVAR(orange): GVAR(white) {
        GVAR(vehicle) = GVAR(orange);
        displayName = CSTRING(orange);
        picture = PATHTOF(ui\orange_ca.paa);
    };
    class GVAR(purple): GVAR(white) {
        GVAR(vehicle) = GVAR(purple);
        displayName = CSTRING(purple);
        picture = PATHTOF(ui\purple_ca.paa);
    };
};
