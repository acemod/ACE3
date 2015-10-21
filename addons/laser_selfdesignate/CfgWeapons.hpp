class CfgWeapons {
    // Disable locking unless newb mode
    class LauncherCore;
    class RocketPods: LauncherCore {
        // canLock = 1;
    };

    class missiles_DAGR: RocketPods {
        canLock = 1;
    };
};
