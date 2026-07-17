// MACHINE GUNS
class SPE_LMG;
class SPE_MG42: SPE_LMG {
    ACE_barrelTwist = 240;
    ACE_barrelLength = 530;
    EGVAR(overheating,mrbs) = 3000;
    EGVAR(overheating,closedBolt) = 0;
    EGVAR(overheating,slowdownFactor) = 1;
    EGVAR(overheating,allowSwapBarrel) = 1;
    EGVAR(overheating,dispersion) = 0.25;
    EGVAR(overheating,barrelMass) = 1.76; //3 lbs 14.25 oz https://forums.sjgames.com/showthread.php?t=26149
};
class SPE_MG34: SPE_LMG {
    ACE_barrelTwist = 240;
    ACE_barrelLength = 627;
    EGVAR(overheating,mrbs) = 3000;
    EGVAR(overheating,closedBolt) = 0;
    EGVAR(overheating,slowdownFactor) = 1;
    EGVAR(overheating,allowSwapBarrel) = 1;
    EGVAR(overheating,dispersion) = 0.25;
    EGVAR(overheating,barrelMass) = 2; //2 kg https://forums.sjgames.com/showthread.php?t=26149
};
class SPE_M1919A4: SPE_LMG {
    ACE_barrelTwist = 254;
    ACE_barrelLength = 610;
    EGVAR(overheating,mrbs) = 3000;
    EGVAR(overheating,closedBolt) = 1;
    EGVAR(overheating,slowdownFactor) = 1;
    EGVAR(overheating,allowSwapBarrel) = 1;
    EGVAR(overheating,dispersion) = 0.25;
    EGVAR(overheating,barrelMass) = 3.52; //approx 8 lbs 7lb 12 oz https://www.1919a4.com/threads/turning-an-a4-barrel-into-an-a6-profile.27933/?utm_source=google&utm_medium=organic
};
class SPE_M1918A2_BAR: SPE_LMG {
    ACE_barrelTwist = 254;
    ACE_barrelLength = 610;
    EGVAR(overheating,mrbs) = 3000;
    EGVAR(overheating,closedBolt) = 0;
    EGVAR(overheating,slowdownFactor) = 1;
    EGVAR(overheating,allowSwapBarrel) = 0;
    EGVAR(overheating,dispersion) = 0.25;
    EGVAR(overheating,barrelMass) = 1.72; //3.80 lbs https://bmgparts.com/product/6508769/
};
class SPE_FM_24_M29: SPE_LMG {
    ACE_barrelTwist = 270;
    ACE_barrelLength = 500;
    EGVAR(overheating,mrbs) = 3000;
    EGVAR(overheating,closedBolt) = 0;
    EGVAR(overheating,slowdownFactor) = 1;
    EGVAR(overheating,allowSwapBarrel) = 0;
    EGVAR(overheating,dispersion) = 0.25;
    EGVAR(overheating,barrelMass) = 3; //Estiminated to be similar to the Bren or heavier
};
class SPE_LMG_303_Mk2: SPE_LMG {
    ACE_barrelTwist = 254;
    ACE_barrelLength = 635;
    EGVAR(overheating,mrbs) = 3000;
    EGVAR(overheating,closedBolt) = 0;
    EGVAR(overheating,slowdownFactor) = 1;
    EGVAR(overheating,allowSwapBarrel) = 1;
    EGVAR(overheating,dispersion) = 0.25;
    EGVAR(overheating,barrelMass) = 2.9; //6.39 unknown units assumed pounds https://www.apexgunparts.com/bren-mk2-barrel-assembly-nos.html
};

// RIFLES
class SPE_RIFLE;
class SPE_FG42_E: SPE_RIFLE { // Closed bolt in semi-auto, open bolt in full-auto
    EGVAR(overheating,JamChance) = 0.0003;
    ACE_barrelTwist = 240;
    ACE_barrelLength = 500;
    EGVAR(overheating,barrelMass) = 1.3; //Estiminated to be similar to K98 or heavier
};
class SPE_G43: SPE_RIFLE {
    EGVAR(overheating,JamChance) = 0.0003;
    ACE_barrelTwist = 240;
    ACE_barrelLength = 550;
    EGVAR(overheating,barrelMass) = 1.3; //Estiminated to be similar to K98 or heavier
};
class SPE_K98: SPE_RIFLE {
    ACE_barrelTwist = 240;
    ACE_barrelLength = 600;
    EGVAR(overheating,barrelMass) = 1.23; //2.721 unknown units assumed pounds https://www.apexgunparts.com/german-k98-mauser-barrel-23-5-waffen-marked-8x57-fair.html
};
class SPE_M1_Carbine: SPE_RIFLE {
    EGVAR(overheating,JamChance) = 0.0003;
    ACE_barrelTwist = 254;
    ACE_barrelLength = 460;
    EGVAR(overheating,barrelMass) = 0.61; //21.6 ounces lbs https://www.ar15.com/forums/general/How-could-the-M1-Carbine-be-so-light-and-modern-guns-so-heavy-/5-2611211/?
};
class SPE_M1_Garand: SPE_RIFLE {
    EGVAR(overheating,JamChance) = 0.0003;
    ACE_barrelTwist = 254;
    ACE_barrelLength = 610;
    EGVAR(overheating,barrelMass) = 1.36; //3 lbs https://criterionbarrels.com/products/vintage-service/m1-garand/m1-garand-gi-contour-barrel-2/?v=0b3b97fa6688
};
class SPE_M1903A3_Springfield: SPE_RIFLE {
    ACE_barrelTwist = 254;
    ACE_barrelLength = 610;
    EGVAR(overheating,barrelMass) = 1.29; //2.85 lbs https://criterionbarrels.com/products/vintage-service/m1903/m1903-barrel/?v=0b3b97fa6688
};
class SPE_MAS_36: SPE_RIFLE {
    ACE_barrelTwist = 270;
    ACE_barrelLength = 575;
    EGVAR(overheating,barrelMass) = 0.91; //2.014 unknown units assumed pounds https://www.apexgunparts.com/mas36-308-project-barrel-gd.html
};
class SPE_No3_Mk1_Enfield: SPE_RIFLE {
    ACE_barrelTwist = 254;
    ACE_barrelLength = 640;
    ACE_twistDirection = -1;
    EGVAR(overheating,barrelMass) = 1.31; //2.9 lbs https://criterionbarrels.com/products/vintage-service/lee-enfield/lee-enfield-no-4-barrel-2/?v=0b3b97fa6688
};

// ASSAULT RIFLE
class SPE_STG44: SPE_RIFLE {
    EGVAR(overheating,JamChance) = 0.0015;
    ACE_barrelTwist = 240;
    ACE_barrelLength = 420;
    EGVAR(overheating,barrelMass) = 1.3; //Estiminated to be similar to K98 or heavier
};

// SCOPED RIFLES
class Rifle_Long_Base_F;
class SPE_SRIFLE: Rifle_Long_Base_F {
    EGVAR(overheating,closedBolt) = 1;
};
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
    ACE_ScopeHeightAboveRail = 3.8;  // Distance between center of scope and rail in centimeters
    EGVAR(overheating,barrelMass) = 1.23; //2.721 unknown units assumed pounds https://www.apexgunparts.com/german-k98-mauser-barrel-23-5-waffen-marked-8x57-fair.html
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
    ACE_ScopeHeightAboveRail = 3.8;
    EGVAR(overheating,barrelMass) = 1.29; //2.85 lbs https://criterionbarrels.com/products/vintage-service/m1903/m1903-barrel/?v=0b3b97fa6688
};

// SUB MACHINE GUNS
class Rifle_Short_Base_F;
class SPE_SMG: Rifle_Short_Base_F {
    EGVAR(overheating,closedBolt) = 0;
};
class SPE_MP35: SPE_SMG {
    ACE_barrelTwist = 250;
    ACE_barrelLength = 200;
    EGVAR(overheating,barrelMass) = 0.6; //Estiminated to be similar to MP40 or heavier
};
class SPE_MP40: SPE_SMG {
    ACE_barrelTwist = 250;
    ACE_barrelLength = 251;
    EGVAR(overheating,barrelMass) = 0.54; //1.185 unknown units assumed pounds https://www.apexgunparts.com/mp40-barrel-9-75inch-npf-wwii-vg.html
};
class SPE_Sten_Mk2: SPE_SMG {
    ACE_barrelTwist = 254;
    ACE_barrelLength = 196;
    EGVAR(overheating,barrelMass) = 0.5; //Estiminated to be similar to MP40 or lighter
};
class SPE_M1A1_Thompson: SPE_SMG {
    ACE_barrelTwist = 406;
    ACE_barrelLength = 267;
    EGVAR(overheating,barrelMass) = 0.49; //1.075 unknown units assumed pounds https://www.apexgunparts.com/thompson-m1-m1a1-barrel-10inch-new.html
};
class SPE_M3_GreaseGun: SPE_SMG {
    ACE_barrelTwist = 406;
    ACE_barrelLength = 203.2;
    EGVAR(overheating,barrelMass) = 0.6; //1.325 unknown units assumed pounds https://www.apexgunparts.com/m3-grease-gun-barrel-trunnion-good.html
};

// SHOTGUNS
class SPE_Shotgun: Rifle_Long_Base_F {
    ACE_twistDirection = 0;
    EGVAR(overheating,closedBolt) = 1;
};
class SPE_Fusil_Mle_208_12: SPE_Shotgun {
    ACE_barrelLength = 700;
};
class SPE_Fusil_Mle_208_12_Sawedoff: SPE_Fusil_Mle_208_12 {
    ACE_barrelLength = 350;
};
class SPE_Model_37_Trenchgun: SPE_Shotgun {
    ACE_barrelLength = 508;
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
