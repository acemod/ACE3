class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class GVAR(white): ACE_ItemCore {
        scope = 2;
        author = ECSTRING(common,ACETeam);
        descriptionShort = CSTRING(description);
        descriptionUse = CSTRING(description);
        displayName = CSTRING(white);
        picture = QPATHTOF(data\ui\flags\red_item_icon.paa);

        GVAR(texture) = "\a3\data_f\flags\flag_white_co.paa";
        GVAR(actionIconPlace) = QPATHTOF(data\ui\flags\white_icon.paa);
        GVAR(actionIconCarry) = QPATHTOF(data\ui\flags\white_carry_icon.paa);

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;
        };
    };
    class GVAR(red): GVAR(white) {
        displayName = CSTRING(red);
        picture = QPATHTOF(data\ui\flags\red_item_icon.paa);

        GVAR(texture) = "\a3\data_f\flags\flag_red_co.paa";
        GVAR(actionIconPlace) = QPATHTOF(data\ui\flags\red_place_icon.paa);
        GVAR(actionIconCarry) = QPATHTOF(data\ui\flags\red_carry_icon.paa);
    };
    class GVAR(blue): GVAR(white) {
        displayName = CSTRING(blue);
        picture = QPATHTOF(data\ui\flags\blue_item_icon.paa);

        GVAR(texture) = "\a3\data_f\flags\Flag_blue_co.paa";
        GVAR(actionIconPlace) = QPATHTOF(data\ui\flags\blue_place_icon.paa);
        GVAR(actionIconCarry) = QPATHTOF(data\ui\flags\blue_carry_icon.paa);
    };
    class GVAR(green): GVAR(white) {
        displayName = CSTRING(green);
        picture = QPATHTOF(data\ui\flags\green_item_icon.paa);

        GVAR(texture) = "\a3\data_f\flags\flag_green_co.paa";
        GVAR(actionIconPlace) = QPATHTOF(data\ui\flags\green_place_icon.paa);
        GVAR(actionIconCarry) = QPATHTOF(data\ui\flags\green_carry_icon.paa);
    };
    class GVAR(yellow): GVAR(white) {
        displayName = CSTRING(yellow);
        picture = QPATHTOF(data\ui\flags\yellow_item_icon.paa);

        GVAR(texture) = QPATHTOF(data\Flag_yellow_co.paa);
        GVAR(actionIconPlace) = QPATHTOF(data\ui\flags\yellow_place_icon.paa);
        GVAR(actionIconCarry) = QPATHTOF(data\ui\flags\yellow_carry_icon.paa);
    };
};
