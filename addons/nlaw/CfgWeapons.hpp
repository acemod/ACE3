class CfgWeapons {
    class Launcher_Base_F;
    class launch_NLAW_F: Launcher_Base_F {
        GVAR(enabled) = 1;
        canLock = 1;
        class OpticsModes {
            class optic {
                distanceZoomMin = 0;
                distanceZoomMax = 0;
            };
        };
    };
};
