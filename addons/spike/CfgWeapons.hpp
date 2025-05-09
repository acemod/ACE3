class CfgWeapons {
    class launch_Titan_short_base;
    class launch_B_Titan_short_F: launch_Titan_short_base {
        class Single;
    };
    class GVAR(base): launch_B_Titan_short_F {
        class Single: Single {
            EGVAR(missileGuidance,attackProfile) = "SPIKE_TOP";
        };
    };
    class GVAR(launcher): GVAR(base) {
        scope = 2;
        GVAR(enabled) = 1;
        weaponInfoType = "ACE_RscOptics_spike";
        modelOptics = QPATHTOF(data\reticle_titan.p3d);

        canLock = 0;

        lockingTargetSound[] = {"",0,1};
        lockedTargetSound[] = {"",0,1};

        displayName = CSTRING(LR);
        displayNameShort = CSTRING(LR_Short);

        magazines[] = {QGVAR(lr)};
        magazineWell[] = {};
    };
};

