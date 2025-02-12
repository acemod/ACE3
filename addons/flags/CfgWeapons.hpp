class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class GVAR(white): ACE_ItemCore {
        scope = 2;
        author = ECSTRING(common,ACETeam);
        descriptionShort = CSTRING(Description);
        descriptionUse = CSTRING(Description);

        displayName = CSTRING(White);
        picture = QPATHTOF(data\pictures\white_item.paa);

        GVAR(texture) = "\a3\data_f\flags\flag_white_co.paa";
        GVAR(carrier) = QGVAR(carrier_white);
        GVAR(actionIconPlace) = QPATHTOF(data\icons\place\white_place_icon.paa);
        GVAR(actionIconCarry) = QPATHTOF(data\icons\carry\white_carry_icon.paa);

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 6.6; // Assuming 300g
        };
    };
    class GVAR(red): GVAR(white) {
        displayName = CSTRING(Red);
        picture = QPATHTOF(data\pictures\red_item.paa);

        GVAR(texture) = "\a3\data_f\flags\flag_red_co.paa";
        GVAR(carrier) = QGVAR(carrier_red);
        GVAR(actionIconPlace) = QPATHTOF(data\icons\place\red_place_icon.paa);
        GVAR(actionIconCarry) = QPATHTOF(data\icons\carry\red_carry_icon.paa);
    };
    class GVAR(blue): GVAR(white) {
        displayName = CSTRING(Blue);
        picture = QPATHTOF(data\pictures\blue_item.paa);

        GVAR(texture) = "\a3\data_f\flags\Flag_blue_co.paa";
        GVAR(carrier) = QGVAR(carrier_blue);
        GVAR(actionIconPlace) = QPATHTOF(data\icons\place\blue_place_icon.paa);
        GVAR(actionIconCarry) = QPATHTOF(data\icons\carry\blue_carry_icon.paa);
    };
    class GVAR(green): GVAR(white) {
        displayName = CSTRING(Green);
        picture = QPATHTOF(data\pictures\green_item.paa);

        GVAR(texture) = "\a3\data_f\flags\flag_green_co.paa";
        GVAR(carrier) = QGVAR(carrier_green);
        GVAR(actionIconPlace) = QPATHTOF(data\icons\place\green_place_icon.paa);
        GVAR(actionIconCarry) = QPATHTOF(data\icons\carry\green_carry_icon.paa);
    };
    class GVAR(yellow): GVAR(white) {
        displayName = CSTRING(Yellow);
        picture = QPATHTOF(data\pictures\yellow_item.paa);

        GVAR(texture) = QPATHTOF(data\Flag_yellow_co.paa);
        GVAR(carrier) = QGVAR(carrier_yellow);
        GVAR(actionIconPlace) = QPATHTOF(data\icons\place\yellow_place_icon.paa);
        GVAR(actionIconCarry) = QPATHTOF(data\icons\carry\yellow_carry_icon.paa);
    };
    class GVAR(orange): GVAR(white) {
        displayName = CSTRING(Orange);
        picture = QPATHTOF(data\pictures\orange_item.paa);

        GVAR(texture) = QPATHTOF(data\flag_orange_co.paa);
        GVAR(carrier) = QGVAR(carrier_orange);
        GVAR(actionIconPlace) = QPATHTOF(data\icons\place\orange_place_icon.paa);
        GVAR(actionIconCarry) = QPATHTOF(data\icons\carry\orange_carry_icon.paa);
    };
    class GVAR(purple): GVAR(white) {
        displayName = CSTRING(Purple);
        picture = QPATHTOF(data\pictures\purple_item.paa);

        GVAR(texture) = QPATHTOF(data\flag_purple_co.paa);
        GVAR(carrier) = QGVAR(carrier_purple);
        GVAR(actionIconPlace) = QPATHTOF(data\icons\place\purple_place_icon.paa);
        GVAR(actionIconCarry) = QPATHTOF(data\icons\carry\purple_carry_icon.paa);
    };
    class GVAR(black): GVAR(white) {
        displayName = CSTRING(Black);
        picture = QPATHTOF(data\pictures\black_item.paa);

        GVAR(texture) = QPATHTOF(data\flag_black_co.paa);
        GVAR(carrier) = QGVAR(carrier_black);
        GVAR(actionIconPlace) = QPATHTOF(data\icons\place\black_place_icon.paa);
        GVAR(actionIconCarry) = QPATHTOF(data\icons\carry\black_carry_icon.paa);
    };
};
