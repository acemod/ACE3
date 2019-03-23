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
        GVAR(enabled) = 1;
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
    class launch_Titan_short_base: launch_Titan_base {};
    class launch_B_Titan_short_F: launch_Titan_short_base {
        GVAR(enabled) = 1;
        weaponInfoType = "ACE_RscOptics_javelin";
        modelOptics = QPATHTOF(data\reticle_titan.p3d);

        canLock = 0;

        lockingTargetSound[] = {"",0,1};
        lockedTargetSound[] = {"",0,1};
    };
    class launch_B_Titan_short_tna_F: launch_B_Titan_short_F {
        GVAR(enabled) = 1;
    };
    class launch_I_Titan_short_F: launch_Titan_short_base {
        GVAR(enabled) = 1;
        weaponInfoType = "ACE_RscOptics_javelin";
        modelOptics = QPATHTOF(data\reticle_titan.p3d);

        canLock = 0;

        lockingTargetSound[] = {"",0,1};
        lockedTargetSound[] = {"",0,1};
    };
    class launch_O_Titan_short_F: launch_Titan_short_base {
        GVAR(enabled) = 1;
        weaponInfoType = "ACE_RscOptics_javelin";
        modelOptics = QPATHTOF(data\reticle_titan.p3d);

        canLock = 0;

        lockingTargetSound[] = {"",0,1};
        lockedTargetSound[] = {"",0,1};
    };
    class launch_O_Titan_short_ghex_F: launch_O_Titan_short_F {
        GVAR(enabled) = 1;
    };
    class launch_Titan_short_F: launch_Titan_short_base {
        GVAR(enabled) = 1;
        weaponInfoType = "ACE_RscOptics_javelin";
        modelOptics = QPATHTOF(data\reticle_titan.p3d);

        canLock = 0;

        lockingTargetSound[] = {"",0,1};
        lockedTargetSound[] = {"",0,1};
    };
};
