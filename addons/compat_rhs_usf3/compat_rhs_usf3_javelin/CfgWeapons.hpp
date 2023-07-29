class CfgWeapons {
    class launch_O_Titan_F;
    class rhs_weap_fgm148: launch_O_Titan_F {
        EGVAR(javelin,enabled) = 1;
        EGVAR(overpressure,offset) = 1.1;
        weaponInfoType = "ACE_RscOptics_javelin";
        modelOptics = "\z\ace\addons\javelin\data\reticle_titan.p3d";
        canLock = 0;
        lockingTargetSound[] = {"",0,1};
        lockedTargetSound[] = {"",0,1};
        class Single;
        class Cruise: Single {
            EGVAR(missileGuidance,attackProfile) = "JAV_DIR";
        };
        class TopDown: Single {
            EGVAR(missileGuidance,attackProfile) = "JAV_TOP";
        };
    };
};
