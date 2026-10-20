class CfgWeapons {
    class launch_Titan_short_base;
    class launch_Titan_short_blk_F: launch_Titan_short_base {
        EGVAR(javelin,enabled) = 1;
        weaponInfoType = "ACE_RscOptics_javelin";
        modelOptics = QPATHTOEF(javelin,data\reticle_titan.p3d);

        canLock = 0;

        lockingTargetSound[] = {"",0,1};
        lockedTargetSound[] = {"",0,1};
    };

    class launch_O_Titan_short_camo_F: launch_Titan_short_base {
        EGVAR(javelin,enabled) = 1;
        weaponInfoType = "ACE_RscOptics_javelin";
        modelOptics = QPATHTOEF(javelin,data\reticle_titan.p3d);

        canLock = 0;

        lockingTargetSound[] = {"",0,1};
        lockedTargetSound[] = {"",0,1};
    };
};
