class CfgWeapons {
    class ItemWatch;
    class ACE_Altimeter: ItemWatch {
        ACE_hideItemType = "Watch";

        author = ECSTRING(common,ACETeam);
        descriptionShort = CSTRING(AltimeterDescription);
        displayName = CSTRING(AltimeterDisplayName);
        picture = QPATHTOF(UI\watch_altimeter.paa);
    };
};
