class CfgWeapons {
    
    class missiles_titan_static;
    class GVAR(Titan_Static): missiles_titan_static {
        modes[] = {"Player"};
        GVAR(enabled) = 1;
        weaponInfoType = "ACE_RscOptics_javelin";
        modelOptics = QPATHTOF(data\reticle_titan.p3d);

        canLock = 0;
        magazines[] = {"1Rnd_GAT_missiles"};
        lockingTargetSound[] = {"",0,1};
        lockedTargetSound[] = {"",0,1};
    };

    class launch_Titan_short_base;
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
