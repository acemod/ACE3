class CfgWeapons {
    class Pistol_Base_F;
    class Rifle_Base_F;
    class UGL_F;
    class ItemCore;
    class InventoryOpticsItem_Base_F;
    class Launcher_Base_F;
    class Rifle_Long_Base_F;
    // Opticas
    class ffaa_optic_acog: ItemCore  {
        ACE_ScopeAdjust_Vertical[]={ -4, 30 };
        ACE_ScopeAdjust_Horizontal[]={ -6, 6 };
        ACE_ScopeAdjust_VerticalIncrement=0.1;
        ACE_ScopeAdjust_HorizontalIncrement=0.1;
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class ffaa_ARCO {
                    discreteDistance[]={100};
                    discreteDistanceInitIndex=0;
                };
            };
        };
    };
    class ffaa_optic_susat: ItemCore {
        ACE_ScopeAdjust_Vertical[]={ -4, 30 };
        ACE_ScopeAdjust_Horizontal[]={ -6, 6 };
        ACE_ScopeAdjust_VerticalIncrement=0.1;
        ACE_ScopeAdjust_HorizontalIncrement=0.1;
    };
    class ffaa_optic_g36_holo: ItemCore {
        ACE_ScopeAdjust_Vertical[]={ -4, 30 };
        ACE_ScopeAdjust_Horizontal[]={ -6, 6 };
        ACE_ScopeAdjust_VerticalIncrement=1;
        ACE_ScopeAdjust_HorizontalIncrement=1;
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class ffaa_ARCO {
                    discreteDistance[]={200};
                    discreteDistanceInitIndex=0;
                };
            };
        };
    };
    class ffaa_optic_mg4_g36: ItemCore {
        ACE_ScopeAdjust_Vertical[]={ -4, 30 };
        ACE_ScopeAdjust_Horizontal[]={ -6, 6 };
        ACE_ScopeAdjust_VerticalIncrement=1;
        ACE_ScopeAdjust_HorizontalIncrement=1;
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class ffaa_ARCO {
                    discreteDistance[]={200};
                    discreteDistanceInitIndex=0;
                };
            };
        };
    };
    class ffaa_optic_enasa: ItemCore {
        ACE_ScopeAdjust_Vertical[]={ -4, 30 };
        ACE_ScopeAdjust_Horizontal[]={ -6, 6 };
        ACE_ScopeAdjust_VerticalIncrement=0.1;
        ACE_ScopeAdjust_HorizontalIncrement=0.1;
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class ffaa_StepScope {
                    discreteDistance[]={200};
                    discreteDistanceInitIndex=0;
                };
            };
        };
    };
    class ffaa_optic_lv: ItemCore {
        ACE_ScopeAdjust_Vertical[]={ -4, 30 };
        ACE_ScopeAdjust_Horizontal[]={ -6, 6 };
        ACE_ScopeAdjust_VerticalIncrement=0.1;
        ACE_ScopeAdjust_HorizontalIncrement=0.1;
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class ffaa_StepScope {
                    discreteDistance[]={200};
                    discreteDistanceInitIndex=0;
                };
            };
        };
    };
    class ffaa_optic_3x12x50: ItemCore {
        ACE_ScopeAdjust_Vertical[]={ -4, 30 };
        ACE_ScopeAdjust_Horizontal[]={ -6, 6 };
        ACE_ScopeAdjust_VerticalIncrement=0.1;
        ACE_ScopeAdjust_HorizontalIncrement=0.1;
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class ffaa_StepScope {
                    discreteDistance[]={100};
                    discreteDistanceInitIndex=0;
                };
            };
        };
    };
    class ffaa_optic_Mk4_v1: ItemCore {
        ACE_ScopeAdjust_Vertical[]={ -4, 30 };
        ACE_ScopeAdjust_Horizontal[]={ -6, 6 };
        ACE_ScopeAdjust_VerticalIncrement=0.1;
        ACE_ScopeAdjust_HorizontalIncrement=0.1;
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class ffaa_StepScope {
                    discreteDistance[]={100};
                    discreteDistanceInitIndex=0;
                };
            };
        };
    };
    class ffaa_optic_Mk4_v2: ItemCore {
        ACE_ScopeAdjust_Vertical[]={ -4, 30 };
        ACE_ScopeAdjust_Horizontal[]={ -6, 6 };
        ACE_ScopeAdjust_VerticalIncrement=0.1;
        ACE_ScopeAdjust_HorizontalIncrement=0.1;
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class ffaa_StepScope {
                    discreteDistance[]={400};
                    discreteDistanceInitIndex=0;
                };
            };
        };
    };
    class ffaa_optic_5x25x56: ItemCore {
        ACE_ScopeAdjust_Vertical[]={ -4, 30 };
        ACE_ScopeAdjust_Horizontal[]={ -6, 6 };
        ACE_ScopeAdjust_VerticalIncrement=0.1;
        ACE_ScopeAdjust_HorizontalIncrement=0.1;
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class ffaa_StepScope {
                    discreteDistance[]={400};
                    discreteDistanceInitIndex=0;
                };
            };
        };
    };
    class ffaa_acc_puntero_ir: ItemCore {
        ACE_laserpointer=1;
    };
    // Fusiles
    class ffaa_armas_hkg36e_normal: Rifle_Base_F {
        ACE_overheating_dispersion[]={0,0.001,0.003,0.005};
        ACE_overheating_slowdownFactor[]={1,1,1,0.9};
        ACE_overheating_jamChance[]={0,0.0003,0.0015,0.0075};
        ACE_barrelTwist=177.8;
        ACE_barrelLength=480;
        discreteDistance[]={200};
        discreteDistanceInitIndex=0;
        class ffaa_armas_ag36: UGL_F {
            magazines[] += {"ACE_HuntIR_M203"};
        };
    };
    class ffaa_armas_hkg36k_normal: ffaa_armas_hkg36e_normal {
        ACE_barrelTwist=177.8;
        ACE_barrelLength=318;
    };

    class ffaa_armas_cetme_l: Rifle_Base_F {
        ACE_barrelTwist=100.8;
        ACE_barrelLength=157.48;
    };
    class ffaa_armas_cetme_lc: ffaa_armas_cetme_l {
        ACE_barrelTwist=100.8;
        ACE_barrelLength=125.984;
    };
    class ffaa_armas_cetme_c: Rifle_Base_F {
        ACE_barrelTwist=120.8;
        ACE_barrelLength=177.1654;
    };
    class ffaa_armas_cetme_e: ffaa_armas_cetme_c {
        ACE_barrelTwist=120.8;
        ACE_barrelLength=177.1654;
    };
    // Fusiles de precision
    class ffaa_armas_aw: Rifle_Base_F {
        ACE_barrelTwist=203;
        ACE_barrelLength=305;
        ACE_Overheating_Dispersion[]={0,-0.001,0.001,0.003};
        ACE_Overheating_SlowdownFactor[]={1,1,1,0.9};
        ACE_Overheating_JamChance[]={0,0.0003,0.0015,0.0075};
    };
    class ffaa_armas_m95: ffaa_armas_aw {
        ACE_overheating_dispersion[]={0,-0.001,0.001,0.003};
        ACE_overheating_slowdownFactor[]={1,1,1,0.9};
        ACE_overheating_jamChance[]={0,0.0003,0.0015,0.0075};
        ACE_barrelTwist=381;
        ACE_barrelLength=736.7;
    };
    class ffaa_armas_aw50: ffaa_armas_m95 {
        ACE_barrelTwist=203;
        ACE_barrelLength=305;
        ACE_Overheating_Dispersion[]={0,-0.001,0.001,0.003};
        ACE_Overheating_SlowdownFactor[]={1,1,1,0.9};
        ACE_Overheating_JamChance[]={0,0.0003,0.0015,0.0075};
    };
    // Ametralladoras
    class ffaa_armas_mg4: Rifle_Long_Base_F {
        ACE_overheating_allowSwapBarrel=1;
        ACE_overheating_dispersion[]={0,0.001,0.002,0.004};
        ACE_overheating_slowdownFactor[]={1,1,1,0.9};
        ACE_overheating_jamChance[]={0,0.0003,0.0015,0.0075};
        ACE_barrelTwist=177.8;
        ACE_barrelLength=480;
    };
    class ffaa_armas_mg3: Rifle_Long_Base_F {
        ACE_overheating_allowSwapBarrel=1;
        ACE_overheating_dispersion[]={0,-0.001,0.001,0.003};
        ACE_overheating_slowdownFactor[]={1,1,1,0.9};
        ACE_overheating_jamChance[]={0,0.0003,0.0015,0.0075};
        ACE_barrelTwist=304.8;
        ACE_barrelLength=550;
    };
    class ffaa_armas_ameli: Rifle_Base_F {
        ACE_overheating_allowSwapBarrel=1;
        ACE_overheating_dispersion[]={0,0.001,0.001,0.003};
        ACE_overheating_slowdownFactor[]={1,1,1,0.9};
        ACE_overheating_jamChance[]={0,0.0003,0.0015,0.0075};
        ACE_barrelTwist=177.8;
        ACE_barrelLength=480;
    };
    // Lanzadores
    class ffaa_armas_c100: Launcher_Base_F {
        ACE_overpressure_angle=60;
        ACE_overpressure_range=6;
        ACE_overpressure_damage=0.8;
        ace_reloadlaunchers_enabled=0;
        ACE_UsedTube="ACE_ffaa_armas_c100_used";
        magazines[]={"ACE_PreloadedMissileDummy_C100_FFAA"};
    };
    class ACE_ffaa_armas_c100_used : ffaa_armas_c100 {
        scope=1;
        ACE_isUsedLauncher=1;
        author="$STR_FFAA_AUTOR_FFAAMOD";
        displayName="C 100 (Used)";
        descriptionShort="Used C100 Tube";
        magazines[]={"ACE_UsedTube_C100"};
        weaponPoolAvailable=0;
    };
    class ffaa_armas_c90: Launcher_Base_F {
        ACE_overpressure_angle=60;
        ACE_overpressure_range=6;
        ACE_overpressure_damage=0.8;
        ace_reloadlaunchers_enabled=0;
        ACE_UsedTube="ACE_ffaa_armas_c90_used";
        magazines[]={"ACE_PreloadedMissileDummy_C90_FFAA"};
    };
    class ACE_ffaa_armas_c90_used : ffaa_armas_c90 {
        scope=1;
        ACE_isUsedLauncher=1;
        author="$STR_FFAA_AUTOR_FFAAMOD";
        displayName="C 90 (Used)";
        descriptionShort="Used C90 Tube";
        magazines[]={"ACE_UsedTube_C90"};
        weaponPoolAvailable=0;
    };
    // SUBFUSILES
    class ffaa_armas_hkmp510a3: Rifle_Base_F {
        ACE_barrelTwist=254;
        ACE_barrelLength=228.6;
    };
    class ffaa_armas_hkmp5a5 : ffaa_armas_hkmp510a3 {
        ACE_barrelTwist=254;
        ACE_barrelLength=114.3;
    };
    class ffaa_armas_ump: ffaa_armas_hkmp5a5 {
        ACE_barrelTwist=100;
        ACE_barrelLength=    78.74016;
    };
    class ffaa_armas_p90: Rifle_Base_F {
        ACE_barrelTwist=254;
        ACE_barrelLength=    103.5433;
    };
    // PISTOLAS
    class ffaa_armas_usp: Pistol_Base_F {
        ACE_barrelTwist=406.4;
        ACE_barrelLength=112.014;
    };
    class ffaa_armas_p226 : ffaa_armas_usp {
        ACE_barrelTwist=248.92;
        ACE_barrelLength=111.76;
    };
    class ffaa_armas_fnp9 : ffaa_armas_usp {
        ACE_barrelTwist=406.4;
        ACE_barrelLength=114.3;
    };
    // Escopeta
    class ffaa_armas_sdass : Rifle_Base_F {
        ACE_barrelTwist=106.4;
        ACE_barrelLength=196.85;
    };
    // Uniformes
    class Uniform_Base;
    class H_HelmetB;
    class HelmetBase;
    class ffaa_pilot_harri_uniforme_item : Uniform_Base {
        ace_hearing_protection=1;
        ace_hearing_lowerVolume=0.80;
    };
    class ffaa_pilot_her_uniforme_item : Uniform_Base {
        ace_hearing_protection=0.85;
        ace_hearing_lowerVolume=0.75;
    };
    // Uniforme piloto hercules desertico heredado del boscoso
    class ffaa_famet_uniforme_item_b : Uniform_Base {
        ace_hearing_protection=0.85;
        ace_hearing_lowerVolume=0.75;
    };
    class ffaa_famet_uniforme_item_d : Uniform_Base {
        ace_hearing_protection=0.85;
        ace_hearing_lowerVolume=0.75;
    };
    // Cascos
    class ffaa_casco_hercules_piloto : HelmetBase {
        ace_hearing_protection=0.5;
        ace_hearing_lowerVolume=0.75;
    };
    class ffaa_moe_casco_01_1_d : H_HelmetB {
        ace_hearing_protection=0.40;
        ace_hearing_lowerVolume=0.50;
    };
    class ffaa_moe_casco_01_1_b;
    class ffaa_moe_casco_02_1_d : ffaa_moe_casco_01_1_b {
        ace_hearing_protection=0.7;
        ace_hearing_lowerVolume=0.75;
    };
    class ffaa_casco_famet_tigre : H_HelmetB {
        ace_hearing_protection=0.95;
        ace_hearing_lowerVolume=0.80;
    };
};
