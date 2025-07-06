class EGVAR(missileguidance,type_Vikhr);
class CfgAmmo {
    class M_Scalpel_AT;
    class GVAR(9k121): M_Scalpel_AT {
        author = "tcvm";
        maneuvrability = 0;

        irLock = 0;
        laserLock = 0;
        manualControl = 0;

        class ace_missileguidance: EGVAR(missileguidance,type_Vikhr) {
            enabled = 1;
        };
    };
};

