class Mode_SemiAuto;
class CfgWeapons {
    class MissileLauncher;
    class missiles_titan: MissileLauncher {
        class Player: MissileLauncher {
            EGVAR(missileGuidance,attackProfile) = "JAV_DIR";
        };
        class TopDown: Player {
            EGVAR(missileGuidance,attackProfile) = "JAV_TOP";
        };
    };
    class missiles_titan_static: missiles_titan {};
    class GVAR(Titan_Static): missiles_titan_static {
        GVAR(baseEnabled) = 1;
        weaponInfoType = "ACE_RscOptics_javelin";
        modelOptics = QPATHTOF(data\reticle_titan.p3d);

        canLock = 0;
        magazines[] = {"1Rnd_GAT_missiles"};
        lockingTargetSound[] = {"",0,1};
        lockedTargetSound[] = {"",0,1};
    };

    class Launcher_Base_F;
    class launch_Titan_base: Launcher_Base_F {
        class Single: Mode_SemiAuto {
            EGVAR(missileGuidance,attackProfile) = "JAV_DIR";
        };
        class TopDown: Single {
            EGVAR(missileGuidance,attackProfile) = "JAV_TOP";
        };
    };
    class launch_Titan_short_base: launch_Titan_base {
        GVAR(baseEnabled) = 1;
        weaponInfoType = "ACE_RscOptics_javelin";
        modelOptics = QPATHTOF(data\reticle_titan.p3d);
    };
};
