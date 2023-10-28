class CfgWeapons {
    class Launcher_Base_F;
    class CUP_launch_Javelin: Launcher_Base_F {
        ace_javelin_enabled = 1;
        weaponInfoType = "ACE_RscOptics_javelin";
        modelOptics = QPATHTOEF(javelin,data\reticle_titan.p3d);
        canLock = 0;
        lockingTargetSound[] = {"", 0, 1};
        lockedTargetSound[] = {"", 0, 1};
        ace_overpressure_angle = 30;
        ace_overpressure_range = 2;
        ace_overpressure_damage = 0.5;
    };
};
