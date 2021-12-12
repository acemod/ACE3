class Mode_SemiAuto;
class CfgWeapons {
    class launch_Titan_base;
	class launch_B_Titan_short_F;
	class GVAR(base): launch_B_Titan_short_F {
        class Single: Mode_SemiAuto {
            EGVAR(missileGuidance,attackProfile) = "SPIKE_TOP";
        };
    };
    class GVAR(launcher): GVAR(base) {
		scope = 2;
        GVAR(enabled) = 1;
        weaponInfoType = "ACE_RscOptics_spike";
        //modelOptics = QPATHTOF(data\reticle_titan.p3d);

        canLock = 0;

        lockingTargetSound[] = {"",0,1};
        lockedTargetSound[] = {"",0,1};

		displayName = "Spike AT";
		displayNameShort = "Spike AT";

		magazines[] = {QGVAR(lr)};
    };
};

