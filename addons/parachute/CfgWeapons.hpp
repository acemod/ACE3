class CfgWeapons {
    class ItemWatch;
    class ACE_Altimeter: ItemWatch {
        ACE_hideItemType = "Watch";

        author = "$STR_ACE_Common_ACETeam";
        descriptionShort = CSTRING(AltimeterDescription);
        displayName = CSTRING(AltimeterDisplayName);
        picture = PATHTOF(UI\watch_altimeter.paa);
    };
};
