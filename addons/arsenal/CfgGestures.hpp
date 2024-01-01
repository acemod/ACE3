class CfgGesturesMale {
    skeletonName = "OFP2_ManSkeleton";
    class Default;
    class States {
        class GestureNod;
        class GVAR(stop): GestureNod {
            file = "a3\anims_f\data\anim\sdr\gst\gestureEmpty.rtm";
            disableWeapons = 0;
            disableWeaponsLong = 0;
            enableOptics = 1;
            mask = "empty";
        };
    };
};

class CfgMovesBasic {
    class DefaultDie;
    class ManActions {
        GVAR(stop) = QGVAR(stop);
    };
    class Actions {
        class Default;
        class NoActions: ManActions {
            GVAR(stop)[] = {QGVAR(stop), "Gesture"};
        };
    };
};
