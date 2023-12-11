class Mode_SemiAuto;

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
        class Single: Mode_SemiAuto {
            EGVAR(missileGuidance,attackProfile) = QGVAR(directAttack);
        };
        class Overfly: Single {
            EGVAR(missileGuidance,attackProfile) = QGVAR(overflyTopAttack);
        };
    };
};
