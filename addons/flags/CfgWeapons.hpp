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
        GVAR(actionIconPlace) = QPATHTOF(data\icons\place\white_place_icon.paa);
        GVAR(actionIconCarry) = QPATHTOF(data\icons\carry\white_carry_icon.paa);

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;
        };
    };
    class GVAR(red): GVAR(white) {
        displayName = CSTRING(Red);
        picture = QPATHTOF(data\pictures\red_item.paa);

        GVAR(texture) = "\a3\data_f\flags\flag_red_co.paa";
        GVAR(actionIconPlace) = QPATHTOF(data\icons\place\red_place_icon.paa);
        GVAR(actionIconCarry) = QPATHTOF(data\icons\carry\red_carry_icon.paa);
    };
    class GVAR(blue): GVAR(white) {
        displayName = CSTRING(Blue);
        picture = QPATHTOF(data\pictures\blue_item.paa);

        GVAR(texture) = "\a3\data_f\flags\Flag_blue_co.paa";
        GVAR(actionIconPlace) = QPATHTOF(data\icons\place\blue_place_icon.paa);
        GVAR(actionIconCarry) = QPATHTOF(data\icons\carry\blue_carry_icon.paa);
    };
    class GVAR(green): GVAR(white) {
        displayName = CSTRING(Green);
        picture = QPATHTOF(data\pictures\green_item.paa);

        GVAR(texture) = "\a3\data_f\flags\flag_green_co.paa";
        GVAR(actionIconPlace) = QPATHTOF(data\icons\place\green_place_icon.paa);
        GVAR(actionIconCarry) = QPATHTOF(data\icons\carry\green_carry_icon.paa);
    };
    class GVAR(yellow): GVAR(white) {
        displayName = CSTRING(Yellow);
        picture = QPATHTOF(data\pictures\yellow_item.paa);

        GVAR(texture) = QPATHTOF(data\Flag_yellow_co.paa);
        GVAR(actionIconPlace) = QPATHTOF(data\icons\place\yellow_place_icon.paa);
        GVAR(actionIconCarry) = QPATHTOF(data\icons\carry\yellow_carry_icon.paa);
    };
};
