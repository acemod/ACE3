class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class GVAR(white): ACE_ItemCore {
        GVAR(vehicle) = QGVAR(white);
        GVAR(icon) = QPATHTOF(ui\icons\white_place_icon.paa);
        author = ECSTRING(common,ACETeam);
        scope = 2;
        displayName = CSTRING(white);
        model = QPATHTOF(data\ace_markerpole.p3d);
        picture = QPATHTOF(ui\white_ca.paa);
        icon = "iconObject_1x10";
        mapSize = 0.2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0.5;
        };
    };

    class GVAR(black): GVAR(white) {
        GVAR(vehicle) = QGVAR(black);
        GVAR(icon) = QPATHTOF(ui\icons\black_place_icon.paa);
        displayName = CSTRING(black);
        picture = QPATHTOF(ui\black_ca.paa);
    };
    class GVAR(red): GVAR(white) {
        GVAR(vehicle) = QGVAR(red);
        GVAR(icon) = QPATHTOF(ui\icons\red_place_icon.paa);
        displayName = CSTRING(red);
        picture = QPATHTOF(ui\red_ca.paa);
    };
    class GVAR(green): GVAR(white) {
        GVAR(vehicle) = QGVAR(green);
        GVAR(icon) = QPATHTOF(ui\icons\green_place_icon.paa);
        displayName = CSTRING(green);
        picture = QPATHTOF(ui\green_ca.paa);
    };
    class GVAR(blue): GVAR(white) {
        GVAR(vehicle) = QGVAR(blue);
        GVAR(icon) = QPATHTOF(ui\icons\blue_place_icon.paa);
        displayName = CSTRING(blue);
        picture = QPATHTOF(ui\blue_ca.paa);
    };
    class GVAR(yellow): GVAR(white) {
        GVAR(vehicle) = QGVAR(yellow);
        GVAR(icon) = QPATHTOF(ui\icons\yellow_place_icon.paa);
        displayName = CSTRING(yellow);
        picture = QPATHTOF(ui\yellow_ca.paa);
    };
    class GVAR(orange): GVAR(white) {
        GVAR(vehicle) = QGVAR(orange);
        GVAR(icon) = QPATHTOF(ui\icons\orange_place_icon.paa);
        displayName = CSTRING(orange);
        picture = QPATHTOF(ui\orange_ca.paa);
    };
    class GVAR(purple): GVAR(white) {
        GVAR(vehicle) = QGVAR(purple);
        GVAR(icon) = QPATHTOF(ui\icons\purple_place_icon.paa);
        displayName = CSTRING(purple);
        picture = QPATHTOF(ui\purple_ca.paa);
    };
};
