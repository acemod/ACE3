class EGVAR(missileguidance,type_Paveway);
class EGVAR(missileguidance,type_KAB);
class CfgAmmo {
    class Bo_GBU12_LGB;
    class GVAR(12): Bo_GBU12_LGB {
        maneuvrability = 0; // no maneuvrability so that default guidance doesnt work
        class ace_missileguidance: EGVAR(missileguidance,type_Paveway) {
            enabled = 1;
        };
    };

    class Bomb_03_F;
    class GVAR(FAB250): Bomb_03_F {
        maneuvrability = 0; // no maneuvrability so that default guidance doesnt work
        class ace_missileguidance: EGVAR(missileguidance,type_KAB) {
            enabled = 1;
        };
    };
};

