
class CfgWeapons {
    class ACE_ItemCore;
    class InventoryItem_Base_F;

    class ACE_HuntIR_monitor: ACE_ItemCore {
        scope = 2;
        displayName = CSTRING(monitor_displayName);
        picture = QPATHTOF(UI\w_huntir_monitor_ca.paa);
        descriptionShort = CSTRING(monitor_displayName);
        model = QPATHTOF(data\ace_huntir_monitor.p3d);

        class ItemInfo: InventoryItem_Base_F {
            mass = 20;
        };
    };

    class GrenadeLauncher;
    class UGL_F: GrenadeLauncher {
        magazines[] += {"ACE_HuntIR_M203"};
    };
    // Added to the GL_3GL_F in subconfig
};
