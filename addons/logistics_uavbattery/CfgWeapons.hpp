class CfgWeapons {
    class CBA_MiscItem_ItemInfo;
    class ACE_ItemCore;

    class ACE_UAVBattery: ACE_ItemCore {
        scope = 2;
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(Battery_Name);
        descriptionShort = CSTRING(Battery_Description);
        model = QPATHTOF(data\ace_battery.p3d);
        picture = QPATHTOF(ui\UAV_battery_ca.paa);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 20;
        };
    };
};
