class CfgWeapons {

    class Launcher_Base_F;
    class launch_NLAW_F: Launcher_Base_F {
        class OpticsModes {
            class optic {};
        };
    }
    class launch_NLAW_2: launch_NLAW_F {
        GVAR(enabled) = 1;
        canLock = 0;
        magazines[] = {"ACE_NLAW_F"};
        class OpticsModes: OpticsModes {
            class optic: optic {
                distanceZoomMin = 0;
                distanceZoomMax = 0;
            };
        };
    };
};
