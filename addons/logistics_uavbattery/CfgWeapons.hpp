class CfgWeapons {
    class InventoryItem_Base_F;
    class ACE_ItemCore;

    class ACE_UAVBattery: ACE_ItemCore {
        scope = 2;
        displayName = CSTRING(Battery_Name);
        descriptionShort = CSTRING(Battery_Description);
        model = QPATHTOF(data\ace_battery.p3d);
        picture = QPATHTOF(ui\UAV_battery_ca.paa);
        class ItemInfo: InventoryItem_Base_F {
            mass = 20;
        };
    };
};
