class CfgWeapons {
    class Launcher;
    class MissileLauncher;

    class Launcher_Base_F: Launcher {
        class WeaponSlotsInfo;
    };

    // @TODO: AA by default, motherfuckers
    class missiles_titan: MissileLauncher {

    };

    class missiles_titan_at: missiles_titan { };
    class GVAR(Titan_Static): missiles_titan_at {
        GVAR(enabled) = 1;
        weaponInfoType = "ACE_RscOptics_javelin";
        modelOptics = QPATHTOF(data\reticle_titan.p3d);

        canLock = 0;
        magazines[] = {"1Rnd_GAT_missiles"};
        lockingTargetSound[] = {"",0,1};
        lockedTargetSound[] = {"",0,1};
    };

    // @TODO: AA by default, motherfuckers
    class launch_Titan_base: Launcher_Base_F {};

    class launch_Titan_short_base: launch_Titan_base {  };

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
