class CfgWeapons {
    class launch_Titan_short_base;
    class launch_B_Titan_short_F: launch_Titan_short_base {
        class Single;
    };
    class GVAR(base): launch_B_Titan_short_F {
        scope = 1;
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

    class GVAR(launcher_olive): GVAR(launcher) {
        GVAR(enabled) = 1;
        displayName = CSTRING(LR_olive);
        hiddenSelectionsTextures[] = {"A3\Weapons_F_Beta\Launchers\Titan\Data\Launcher_INDP_CO.paa","A3\Weapons_F_Beta\Launchers\Titan\Data\TubeM_INDP_CO.paa"};
        picture = "\A3\Weapons_F_Beta\Launchers\Titan\Data\UI\icon_launch_I_Titan_short_F_ca.paa";
    };
};

