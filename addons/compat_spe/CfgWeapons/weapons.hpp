// MACHINE GUNS
class SPE_LMG;
class SPE_MG42: SPE_LMG {
    ACE_barrelTwist = 304.8;
    ACE_barrelLength = 533;
    EGVAR(overheating,mrbs) = 3000;
    EGVAR(overheating,closedBolt) = 0;
    EGVAR(overheating,slowdownFactor) = 1;
    EGVAR(overheating,allowSwapBarrel) = 1;
    EGVAR(overheating,dispersion) = 0.25;
};
class SPE_MG34: SPE_LMG {
    ACE_barrelTwist = 101.6;
    ACE_barrelLength = 627;
    EGVAR(overheating,mrbs) = 3000;
    EGVAR(overheating,closedBolt) = 0;
    EGVAR(overheating,slowdownFactor) = 1;
    EGVAR(overheating,allowSwapBarrel) = 1;
    EGVAR(overheating,dispersion) = 0.25;
};
class SPE_M1919A4: SPE_LMG {
    ACE_barrelTwist = 254;
    ACE_barrelLength = 610;
    EGVAR(overheating,mrbs) = 3000;
    EGVAR(overheating,closedBolt) = 1;
    EGVAR(overheating,slowdownFactor) = 1;
    EGVAR(overheating,allowSwapBarrel) = 1;
    EGVAR(overheating,dispersion) = 0.25;
};
class SPE_M1919A6: SPE_M1919A4 {
    ACE_barrelTwist = 254;
    ACE_barrelLength = 610;
    EGVAR(overheating,mrbs) = 3000;
    EGVAR(overheating,closedBolt) = 1;
    EGVAR(overheating,slowdownFactor) = 1;
    EGVAR(overheating,allowSwapBarrel) = 1;
    EGVAR(overheating,dispersion) = 0.25;
};
class SPE_M1918A2_BAR: SPE_LMG {
    ACE_barrelTwist = 254; // unknown set to 1:10
    ACE_barrelLength = 610;
    EGVAR(overheating,mrbs) = 3000;
    EGVAR(overheating,closedBolt) = 0;
    EGVAR(overheating,slowdownFactor) = 1;
    EGVAR(overheating,allowSwapBarrel) = 0;
    EGVAR(overheating,dispersion) = 0.25;
};
class SPE_FM_24_M29: SPE_LMG {
    ACE_barrelTwist = 254;
    ACE_barrelLength = 635;
    EGVAR(overheating,mrbs) = 3000;
    EGVAR(overheating,closedBolt) = 0;
    EGVAR(overheating,slowdownFactor) = 1;
    EGVAR(overheating,allowSwapBarrel) = 1;
    EGVAR(overheating,dispersion) = 0.25;
};

// RIFLES
class SPE_RIFLE;
class SPE_G43: SPE_RIFLE {
    EGVAR(overheating,JamChance) = 0.0003;
    ACE_barrelTwist = 254; // unknown set to 1:10
    ACE_barrelLength = 550;
};
class SPE_K98: SPE_RIFLE {
    EGVAR(overheating,JamChance) = 0.0003;
    ACE_barrelTwist = 254; // unknown set to 1:10
    ACE_barrelLength = 550;
};
class SPE_M1_Carbine: SPE_RIFLE {
    EGVAR(overheating,JamChance) = 0.0003;
    ACE_barrelTwist = 254; // unknown set to 1:10
    ACE_barrelLength = 460;
};
class SPE_M1_Garand: SPE_RIFLE {
    EGVAR(overheating,JamChance) = 0.0003;
    ACE_barrelTwist = 254;
    ACE_barrelLength = 609.6;
};
class SPE_M1903A3_Springfield: SPE_RIFLE {
    ACE_barrelTwist = 254;
    ACE_barrelLength = 610;
};
class SPE_No3_Mk1_Enfield: SPE_RIFLE {
    ACE_barrelTwist = 254;
    ACE_barrelLength = 640;
};

// ASSAULT RIFLE
class SPE_STG44: SPE_RIFLE {
    EGVAR(overheating,JamChance) = 0.0015;
    ACE_barrelTwist = 254; // unknown set to 1:10
    ACE_barrelLength = 420;
};

// SCOPED RIFLES
class SPE_SRIFLE;
class SPE_K98ZF39: SPE_SRIFLE {
    ACE_barrelTwist = 240;
    ACE_barrelLength = 600;
    ACE_scopeZeroRange = 100;
    ACE_ScopeAdjust_Vertical[] = {-4, 30};
    ACE_ScopeAdjust_Horizontal[] = {-6, 6};
    ACE_ScopeAdjust_VerticalIncrement = 0.1;
    ACE_ScopeAdjust_HorizontalIncrement = 0.1;
    discreteDistance[] = {100};
    discreteDistanceInitIndex = 0;
    ACE_railHeightAboveBore = 1.8;  // Distance between center of bore and rail in centimeters
    ACE_scopeHeightAboveRail = 3.8;  // Distance between center of scope and rail in centimeters
    EGVAR(overheating,closedBolt) = 1;
};
class SPE_M1903A4_Springfield: SPE_SRIFLE {
    ACE_barrelTwist = 254;
    ACE_barrelLength = 610;
    ACE_scopeZeroRange = 100;
    ACE_ScopeAdjust_Vertical[] = {-4, 30};
    ACE_ScopeAdjust_Horizontal[] = {-6, 6};
    ACE_ScopeAdjust_VerticalIncrement = 0.1;
    ACE_ScopeAdjust_HorizontalIncrement = 0.1;
    discreteDistance[] = {100};
    discreteDistanceInitIndex = 0;
    ACE_railHeightAboveBore = 1.8;
    ACE_scopeHeightAboveRail = 3.8;
    EGVAR(overheating,closedBolt) = 1;
};

// SUB MACHINE GUNS
class SPE_SMG;
class SPE_MP40: SPE_SMG {
    ACE_barrelTwist = 203.2;
    ACE_barrelLength = 251;
    EGVAR(overheating,closedBolt) = 0;
};
class SPE_Sten_Mk2: SPE_SMG {
    ACE_barrelTwist = 254;
    ACE_barrelLength = 196;
    EGVAR(overheating,closedBolt) = 0;
};
class SPE_M1A1_Thompson: SPE_SMG {
    ACE_barrelTwist = 392;
    ACE_barrelLength = 270;
    EGVAR(overheating,closedBolt) = 0;
};
class SPE_M3_GreaseGun: SPE_SMG {
    ACE_barrelTwist = 392;
    ACE_barrelLength = 270;
    EGVAR(overheating,closedBolt) = 0;
};

// VESTS
class V_SPE_Vest_Camo_Base;
class V_SPE_GER_VestG43: V_SPE_Vest_Camo_Base {
    EGVAR(trenches,entrenchingTool) = 1;
};
class V_SPE_DAK_VestG43: V_SPE_GER_VestG43 {
    EGVAR(trenches,entrenchingTool) = 1;
};
class V_SPE_GER_SaniVest2: V_SPE_Vest_Camo_Base {
    EGVAR(trenches,entrenchingTool) = 1;
};
class V_SPE_GER_VestMG: V_SPE_Vest_Camo_Base {
    EGVAR(trenches,entrenchingTool) = 1;
};
class V_SPE_GER_VestKar98: V_SPE_Vest_Camo_Base {
    EGVAR(trenches,entrenchingTool) = 1;
};
class V_SPE_GER_VestMP40: V_SPE_Vest_Camo_Base {
    EGVAR(trenches,entrenchingTool) = 1;
};
class V_SPE_GER_VestSTG: V_SPE_Vest_Camo_Base {
    EGVAR(trenches,entrenchingTool) = 1;
};
class V_SPE_US_Assault_Vest: V_SPE_Vest_Camo_Base {
    EGVAR(trenches,entrenchingTool) = 1;
};
class V_SPE_US_Vest_Garand_M43: V_SPE_Vest_Camo_Base {
    EGVAR(trenches,entrenchingTool) = 1;
};
class V_SPE_US_Vest_Carbine_m43: V_SPE_Vest_Camo_Base {
    EGVAR(trenches,entrenchingTool) = 1;
};
class V_SPE_US_Vest_Carbine_pick: V_SPE_Vest_Camo_Base {
    EGVAR(trenches,entrenchingTool) = 1;
    ACE_isWirecutter = 1;
};
class V_SPE_US_Vest_Carbine_eng: V_SPE_Vest_Camo_Base {
    EGVAR(trenches,entrenchingTool) = 1;
    ACE_isWirecutter = 1;
};
class V_SPE_US_Vest_Garand_eng: V_SPE_Vest_Camo_Base {
    EGVAR(trenches,entrenchingTool) = 1;
    ACE_isWirecutter = 1;
};
class V_SPE_GER_PioneerVest: V_SPE_Vest_Camo_Base {
    EGVAR(trenches,entrenchingTool) = 1;
    ACE_isWirecutter = 1;
};
class V_SPE_DAK_PioneerVest: V_SPE_GER_PioneerVest {
    EGVAR(trenches,entrenchingTool) = 1;
    ACE_isWirecutter = 1;
};
