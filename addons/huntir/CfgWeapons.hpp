
class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class ACE_HuntIR_monitor: ACE_ItemCore {
        scope = 2;
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(monitor_displayName);
        picture = QPATHTOF(UI\w_huntir_monitor_ca.paa);
        descriptionShort = CSTRING(monitor_displayName);
        model = QPATHTOF(data\ace_huntir_monitor.p3d);

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 20;
        };
    };

    class GrenadeLauncher;
    class UGL_F: GrenadeLauncher {
        magazines[] += {"ACE_HuntIR_M203"};
    };
    // Added to the GL_3GL_F in subconfig
};
