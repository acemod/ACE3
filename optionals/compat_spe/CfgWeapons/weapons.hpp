class PistolCore;
class RifleCore;
class Pistol: PistolCore{};
class Rifle: RifleCore{};
class Pistol_Base_F: Pistol{};
class Rifle_Base_F: Rifle{};
class Rifle_Short_Base_F: Rifle_Base_F{};
class Rifle_Long_Base_F: Rifle_Base_F{};

// MACHINE GUNS
class SPE_LMG: Rifle_Long_Base_F{};
class SPE_MG42: SPE_LMG {
    EGVAR(overheating,mrbs) = 3000;
    EGVAR(overheating,closedBolt) = 0;
    EGVAR(overheating,slowdownFactor) = 1;
    EGVAR(overheating,allowSwapBarrel) = 1;
    EGVAR(overheating,dispersion) = 0.25;
};
class SPE_MG34: SPE_LMG {
    EGVAR(overheating,mrbs) = 3000;
    EGVAR(overheating,closedBolt) = 1;
    EGVAR(overheating,slowdownFactor) = 1;
    EGVAR(overheating,allowSwapBarrel) = 1;
    EGVAR(overheating,dispersion) = 0.25;
};
class SPE_M1919A4: SPE_LMG {
    EGVAR(overheating,mrbs) = 3000;
    EGVAR(overheating,closedBolt) = 1;
    EGVAR(overheating,slowdownFactor) = 1;
    EGVAR(overheating,allowSwapBarrel) = 1;
    EGVAR(overheating,dispersion) = 0.25;
};
class SPE_M1919A6: SPE_M1919A4 {
    EGVAR(overheating,mrbs) = 3000;
    EGVAR(overheating,closedBolt) = 1;
    EGVAR(overheating,slowdownFactor) = 1;
    EGVAR(overheating,allowSwapBarrel) = 1;
    EGVAR(overheating,dispersion) = 0.25;
};
class SPE_M1918A2_BAR: SPE_LMG {
    EGVAR(overheating,mrbs) = 3000;
    EGVAR(overheating,closedBolt) = 0;
    EGVAR(overheating,slowdownFactor) = 1;
    EGVAR(overheating,allowSwapBarrel) = 1;
    EGVAR(overheating,dispersion) = 0.25;
};
class SPE_FM_24_M29: SPE_LMG {
    EGVAR(overheating,mrbs) = 3000;
    EGVAR(overheating,closedBolt) = 1;
    EGVAR(overheating,slowdownFactor) = 1;
    EGVAR(overheating,allowSwapBarrel) = 1;
    EGVAR(overheating,dispersion) = 0.25;
};

// SUB MACHINE GUNS
class SPE_SMG: Rifle_Short_Base_F{};
class SPE_MP40: SPE_SMG {
    EGVAR(overheating,closedBolt) = 1;
};
class SPE_Sten_Mk2: SPE_SMG {
    EGVAR(overheating,closedBolt) = 0;
};
class SPE_Sten_Mk2_Suppressed: SPE_Sten_Mk2 {
    EGVAR(overheating,closedBolt) = 0;
};
class SPE_M1A1_Thompson: SPE_SMG {
    EGVAR(overheating,closedBolt) = 0;
};
class SPE_M3_GreaseGun: SPE_SMG {
    EGVAR(overheating,closedBolt) = 0;
};
