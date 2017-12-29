class Mode_SemiAuto;
class Mode_FullAuto;

class CfgWeapons {
    // assault rifles

    // MX
    class arifle_MX_Base_F;
    class arifle_MX_F: arifle_MX_Base_F {
        displayName = CSTRING(arifle_MX_Name);
    };
    class arifle_MX_Black_F: arifle_MX_F {
        displayName = CSTRING(arifle_MX_Black_Name);
    };

    class arifle_MXC_F: arifle_MX_Base_F {
        displayName = CSTRING(arifle_MXC_Name);
    };
    class arifle_MXC_Black_F: arifle_MXC_F {
        displayName = CSTRING(arifle_MXC_Black_Name);
    };

    class arifle_MX_GL_F: arifle_MX_Base_F {
        displayName = CSTRING(arifle_MX_GL_Name);
    };
    class arifle_MX_GL_Black_F: arifle_MX_GL_F {
        displayName = CSTRING(arifle_MX_GL_Black_Name);
    };

    class arifle_MX_SW_F: arifle_MX_Base_F {
        displayName = CSTRING(arifle_MX_SW_Name);
    };
    class arifle_MX_SW_Black_F: arifle_MX_SW_F {
        displayName = CSTRING(arifle_MX_SW_Black_Name);
    };

    class arifle_MXM_F: arifle_MX_Base_F {
        displayName = CSTRING(arifle_MXM_Name);
    };
    class arifle_MXM_Black_F: arifle_MXM_F {
        displayName = CSTRING(arifle_MXM_Black_Name);
    };

    // Katiba
    class arifle_katiba_Base_F;
    class arifle_Katiba_F: arifle_katiba_Base_F {
        displayName = CSTRING(arifle_Katiba_Name);
    };
    class arifle_Katiba_GL_F: arifle_katiba_Base_F {
        displayName = CSTRING(arifle_Katiba_GL_Name);
    };
    class arifle_Katiba_C_F: arifle_katiba_Base_F {
        displayName = CSTRING(arifle_Katiba_C_Name);
    };

    // SDAR
    class SDAR_base_F;
    class arifle_SDAR_F: SDAR_base_F {
        displayName = CSTRING(arifle_SDAR_Name);
    };

    // TAR-21
    class Tavor_base_F;
    class arifle_TRG21_F: Tavor_base_F {
        displayName = CSTRING(arifle_TRG21_Name);
    };
    class arifle_TRG21_GL_F: arifle_TRG21_F {
        displayName = CSTRING(arifle_TRG21_GL_Name);
    };
    class arifle_TRG20_F: Tavor_base_F {
        displayName = CSTRING(arifle_TRG20_Name);
    };

    // F2000
    class mk20_base_F;
    class arifle_Mk20_F: mk20_base_F {
        displayName = CSTRING(arifle_Mk20_Name);
    };
    class arifle_Mk20_plain_F: arifle_Mk20_F {
        displayName = CSTRING(arifle_Mk20_plain_Name);
    };

    class arifle_Mk20C_F: mk20_base_F {
        displayName = CSTRING(arifle_Mk20C_Name);
    };
    class arifle_Mk20C_plain_F: arifle_Mk20C_F {
        displayName = CSTRING(arifle_Mk20C_plain_Name);
    };

    class arifle_Mk20_GL_F: mk20_base_F {
        displayName = CSTRING(arifle_Mk20_GL_Name);
    };
    class arifle_Mk20_GL_plain_F: arifle_Mk20_GL_F {
        displayName = CSTRING(arifle_Mk20_GL_plain_Name);
    };

    // Vector
    class SMG_01_Base;
    class SMG_01_F: SMG_01_Base {
        displayName = CSTRING(SMG_01_Name);
    };

    // Scorpion
    class SMG_02_base_F;
    class SMG_02_F: SMG_02_base_F {
        displayName = CSTRING(SMG_02_Name);
    };

    // PDW 2000
    class pdw2000_base_F;
    class hgun_pdw2000_F: pdw2000_base_F {
        displayName = CSTRING(hgun_PDW2000_Name);
    };

    // pistols
    class Pistol_Base_F;
    class hgun_P07_F: Pistol_Base_F {
        displayName = CSTRING(hgun_P07_Name);
    };

    class hgun_Rook40_F: Pistol_Base_F {
        displayName = CSTRING(hgun_Rook40_Name);
    };

    class hgun_ACPC2_F: Pistol_Base_F {
        displayName = CSTRING(hgun_ACPC2_Name);
    };

    class hgun_Pistol_heavy_01_F: Pistol_Base_F {
        displayName = CSTRING(hgun_Pistol_heavy_01_Name);
    };

    class hgun_Pistol_heavy_02_F: Pistol_Base_F {
        displayName = CSTRING(hgun_Pistol_heavy_02_Name);
    };

    class hgun_Pistol_Signal_F: Pistol_Base_F {
        displayName = CSTRING(hgun_Pistol_Signal_Name);
    };

    // machine guns
    class Rifle_Long_Base_F;
    class LMG_Mk200_F: Rifle_Long_Base_F {
        displayName = CSTRING(LMG_Mk200_Name);
    };

    class LMG_Zafir_F: Rifle_Long_Base_F {
        displayName = CSTRING(LMG_Zafir_Name);
    };

    // sniper rifles
    class EBR_base_F;
    class srifle_EBR_F: EBR_base_F {
        displayName = CSTRING(srifle_EBR_Name);
    };

    class LRR_base_F;
    class srifle_LRR_F: LRR_base_F {
        displayName = CSTRING(srifle_LRR_Name);
    };
    class srifle_LRR_camo_F: srifle_LRR_F {
        displayName = CSTRING(srifle_LRR_camo_Name);
    };

    class GM6_base_F;
    class srifle_GM6_F: GM6_base_F {
        displayName = CSTRING(srifle_GM6_Name);
    };
    class srifle_GM6_camo_F: srifle_GM6_F {
        displayName = CSTRING(srifle_GM6_camo_Name);
    };

    class DMR_01_base_F;
    class srifle_DMR_01_F: DMR_01_base_F {
        displayName = CSTRING(srifle_DMR_01_Name);
    };

    // launchers
    class Launcher_Base_F;
    class launch_RPG32_F: Launcher_Base_F {
        displayName = CSTRING(launch_RPG32_Name);
    };

    /*class launch_Titan_base: Launcher_Base_F {
        displayName = CSTRING(launch_Titan_Name);
    };
    class launch_Titan_short_base: launch_Titan_base {
        displayName = CSTRING(launch_Titan_short_Name);
    };*/

    class launch_NLAW_F: Launcher_Base_F {
        displayName = CSTRING(launch_NLAW_Name);
    };

    // marksmen marksman
    class DMR_02_base_F: Rifle_Long_Base_F {
        displayName = CSTRING(DMR_02); //MAR-10 .338;
    };

    class srifle_DMR_02_F: DMR_02_base_F {
        displayName = CSTRING(srifle_DMR_02); //MAR-10 .338 (Black);
    };

    class srifle_DMR_02_camo_F: srifle_DMR_02_F {
        displayName = CSTRING(srifle_DMR_02_camo); //MAR-10 .338 (Camo);
    };

    class srifle_DMR_02_sniper_F: srifle_DMR_02_F {
        displayName = CSTRING(srifle_DMR_02_sniper); //MAR-10 .338 (Sand);
    };
    class DMR_03_base_F: Rifle_Long_Base_F {
        displayName = CSTRING(DMR_03); //Mk-I EMR 7.62 mm;
    };

    class srifle_DMR_03_F: DMR_03_base_F {
        displayName = CSTRING(srifle_DMR_03); //Mk-I EMR 7.62 mm (Black);
    };

    class srifle_DMR_03_khaki_F: srifle_DMR_03_F {
        displayName = CSTRING(srifle_DMR_03_khaki); //Mk-I EMR 7.62 mm (Khaki);
    };

    class srifle_DMR_03_tan_F: srifle_DMR_03_F {
        displayName = CSTRING(srifle_DMR_03_tan); //Mk-I EMR 7.62 mm (Sand);
    };

    class srifle_DMR_03_multicam_F: srifle_DMR_03_F {
        displayName = CSTRING(srifle_DMR_03_multicam); //Mk-I EMR 7.62 mm (Camo);
    };

    class srifle_DMR_03_woodland_F: srifle_DMR_03_F {
        displayName = CSTRING(srifle_DMR_03_woodland); //Mk-I EMR 7.62 mm (Woodland);
    };

    class DMR_04_base_F: Rifle_Long_Base_F {
        displayName = CSTRING(DMR_04); //ASP-1 Kir 12.7 mm;
    };

    class srifle_DMR_04_F: DMR_04_base_F {
        displayName = CSTRING(srifle_DMR_04); //ASP-1 Kir 12.7 mm (Black);
    };

    class srifle_DMR_04_Tan_F: srifle_DMR_04_F {
        displayName = CSTRING(srifle_DMR_04_Tan); //ASP-1 Kir 12.7 mm (Tan);
    };

    class DMR_05_base_F: Rifle_Long_Base_F {
        displayName = CSTRING(DMR_05); //Cyrus 9.3 mm;
    };

    class srifle_DMR_05_blk_F: DMR_05_base_F {
        displayName = CSTRING(srifle_DMR_05_blk); //Cyrus 9.3 mm (Black)
    };

    class srifle_DMR_05_hex_F: srifle_DMR_05_blk_F {
        displayName = CSTRING(srifle_DMR_05_hex); //Cyrus 9.3 mm (Hex);
    };

    class srifle_DMR_05_tan_f: srifle_DMR_05_blk_F {
        displayName = CSTRING(srifle_DMR_05_tan); //Cyrus 9.3 mm (Tan);
    };
    class DMR_06_base_F: Rifle_Long_Base_F {
        displayName = CSTRING(DMR_06); //Mk14 7.62 mm;
    };

    class srifle_DMR_06_camo_F: DMR_06_base_F {
        displayName = CSTRING(srifle_DMR_06_camo); //Mk14 7.62 mm (Camo)
    };

    class srifle_DMR_06_olive_F: srifle_DMR_06_camo_F {
        displayName = CSTRING(srifle_DMR_06_olive); //Mk14 7.62 mm (Olive);
    };

    // marksmen mgs
    class MMG_01_base_F: Rifle_Long_Base_F {
        displayName = CSTRING(MMG_01); //Navid 9.3 mm;
    };

    class MMG_01_hex_F: MMG_01_base_F {
        displayName = CSTRING(MMG_01_hex); //Navid 9.3 mm (Hex);
    };

    class MMG_01_tan_F: MMG_01_hex_F {
        displayName = CSTRING(MMG_01_tan); //Navid 9.3 mm (Tan);
    };
    class MMG_02_base_F: Rifle_Long_Base_F {
        displayName = CSTRING(MMG_02); //SPMG .338;
    };

    class MMG_02_camo_F: MMG_02_base_F {
        displayName = CSTRING(MMG_02_camo); //SPMG .338 (MTP);
    };

    class MMG_02_black_F: MMG_02_camo_F {
        displayName = CSTRING(MMG_02_black); //SPMG .338 (Black);
    };

    class MMG_02_sand_F: MMG_02_camo_F {
        displayName = CSTRING(MMG_02_sand); //SPMG .338 (Sand);
    };

    // vehicle weapons

    // gatlings
    class CannonCore;
    class gatling_20mm: CannonCore {
        //displayName = "";
        class manual: CannonCore {
            //displayName = "";
        };
    };
    class Twin_Cannon_20mm: gatling_20mm {
        displayName = "Plamen PL-20";
        class manual: manual {
            displayName = "Plamen PL-20";
        };
    };

    class gatling_30mm_base: CannonCore { // This is a fictional version of the GSh-6-30, with 3 barrels
        displayName = "GSh-3-30";
        class LowROF: Mode_FullAuto {
            displayName = "GSh-3-30";
        };
    };

    class Gatling_30mm_Plane_CAS_01_F: CannonCore {
        displayName = "GAU-8";
        class LowROF: Mode_FullAuto {
            displayName = "GAU-8";
        };
    };

    class Cannon_30mm_Plane_CAS_02_F: CannonCore {
        displayName = "GSh-301";
        class LowROF: Mode_FullAuto {
            displayName = "GSh-301";
        };
    };

    // missiles
    class RocketPods;
    class Missile_AA_04_Plane_CAS_01_F: RocketPods {
        displayName = "AIM-9 Sidewinder";
    };
    class Missile_AA_03_Plane_CAS_02_F: Missile_AA_04_Plane_CAS_01_F {
        displayName = "Wympel R-73";
    };

    class MissileLauncher;
    class Missile_AGM_02_Plane_CAS_01_F: MissileLauncher {
        displayName = "AGM-65 Maverick G";
    };
    class Missile_AGM_01_Plane_CAS_02_F: Missile_AGM_02_Plane_CAS_01_F {
        displayName = "Kh-25MTP";
    };

    // rockets
    class Rocket_04_HE_Plane_CAS_01_F: RocketPods {
        displayName = "Hydra 70";
        class Burst: RocketPods {
            displayName = "Hydra 70";
        };
    };
    class Rocket_04_AP_Plane_CAS_01_F: Rocket_04_HE_Plane_CAS_01_F {
        displayName = "Hydra 70";
    };

    class Rocket_03_HE_Plane_CAS_02_F: Rocket_04_HE_Plane_CAS_01_F {
        displayName = "S-8";
        class Burst: Burst {
            displayName = "S-8";
        };
    };
    class Rocket_03_AP_Plane_CAS_02_F: Rocket_04_AP_Plane_CAS_01_F {
        displayName = "S-8";
        class Burst: Burst {
            displayName = "S-8";
        };
    };

    class rockets_Skyfire: RocketPods {
        displayName = "Skyfire-70";
        class Burst: RocketPods {
            displayName = "Skyfire-70";
        };
    };

    // more missiles
    class missiles_DAR: RocketPods {
        displayName = "Hydra 70";
        class Burst: RocketPods {
            displayName = "Hydra 70";
        };
    };

    class missiles_DAGR: RocketPods {
        displayName = "DAGR";
        class Burst: RocketPods {
            displayName = "DAGR";
        };
    };

    class missiles_ASRAAM: MissileLauncher {
        displayName = "AIM-132 ASRAAM";
    };

    class missiles_Zephyr: MissileLauncher {
        displayName = "AIM-120A AMRAAM";
    };

    class missiles_SCALPEL: RocketPods { // according to zGuba, this is what it's based on
        displayName = "9K121 Vikhr";
    };

    // bomb
    class Bomb_04_Plane_CAS_01_F: RocketPods {
        //displayName = "";
    };
    class Bomb_03_Plane_CAS_02_F: Bomb_04_Plane_CAS_01_F {
        displayName = "FAB-250M-54";
    };

    // machine guns
    class MGunCore;
    class M134_minigun: MGunCore {
        displayName = "2x M134 Minigun";
    };

    class LMG_RCWS;
    class MGun;

    class LMG_Minigun: LMG_RCWS {
        displayName = "M134 Minigun";
        class manual: MGun {
            displayName = "M134 Minigun";
        };
    };

    class HMG_127: LMG_RCWS {
        displayName = "M2";
        class manual: MGun {
            displayName = "M2";
        };
    };

    class HMG_01: HMG_127 {
        displayName = "XM312";
    };
    class HMG_M2: HMG_01 {
        displayName = "M2";
    };

    class HMG_NSVT: HMG_127 {
        displayName = "NSVT";
        class manual: manual {
            displayName = "NSVT";
        };
    };

    // grenade launchers
    class GMG_F;
    class GMG_20mm: GMG_F {
        displayName = "XM307";
        class manual: GMG_F {
            displayName = "XM307";
        };
    };

    class GMG_40mm: GMG_F {
        displayName = "Mk 19";
        class manual: GMG_F {
            displayName = "Mk 19";
        };
    };

    // autocannons
    class autocannon_35mm: CannonCore {
        displayName = "GDF-001";
        class manual: CannonCore {
            displayName = "GDF-001";
        };
    };

    // aa missiles
    class missiles_titan: MissileLauncher {
        displayName = "Mini-Spike";
    };

    // mortar
    class mortar_155mm_AMOS: CannonCore {
        displayName = "L/52";
    };

    // artillery rockets
    class rockets_230mm_GAT: RocketPods {
        displayName = "M269";
    };

    // tank guns
    class cannon_120mm: CannonCore {
        class player;
        displayName = "MG251";
    };

    class cannon_120mm_long: cannon_120mm {
        displayName = "L/55";
        class player: player {};
    };

    class cannon_105mm: CannonCore {
        displayName = "M68";
        class player: Mode_SemiAuto {
            displayName = "M68";
        };
    };

    class cannon_125mm: CannonCore {
        displayName = "2A46";
    };

    // coax machine guns
    class LMG_coax: LMG_RCWS {
        displayName = "PKT";
    };
    // class ACE_LMG_coax_PKT_mem2: LMG_coax {};
    class ACE_LMG_coax_MAG58_mem2: LMG_coax {
        displayName = "MAG 58M";
    };
    class ACE_LMG_coax_MAG58_mem3: LMG_coax {
        displayName = "MAG 58M";
    };
    class ACE_LMG_coax_L94A1_mem3: LMG_coax {
        displayName = "L94A1";
    };

    // more autocannons
    class autocannon_Base_F;
    class autocannon_40mm_CTWS: autocannon_Base_F {
        displayName = "Mk44 Bushmaster II";
        class AP: autocannon_Base_F {
            displayName = "Mk44 Bushmaster II";
        };

        class HE: autocannon_Base_F {
            displayName = "Mk44 Bushmaster II";
        };
    };

    class autocannon_40mm_VTOL_01: autocannon_40mm_CTWS {
        displayName = "L/60 Bofors Autocannon";
        class AP: AP {
            displayName = "L/60 Bofors Autocannon";
        };
        class HE: HE {
            displayName = "L/60 Bofors Autocannon";
        };
    };

    class autocannon_30mm_CTWS: autocannon_Base_F {
        displayName = "Mk44 Bushmaster II";
        class AP: autocannon_Base_F {
            displayName = "Mk44 Bushmaster II";
        };

        class HE: autocannon_Base_F {
            displayName = "Mk44 Bushmaster II";
        };
    };

    class autocannon_30mm: autocannon_30mm_CTWS {
        displayName = "L21A1 RARDEN";
        class AP: AP {
            displayName = "L21A1 RARDEN";
        };

        class HE: HE {
            displayName = "L21A1 RARDEN";
        };
    };

    //attachments

    class Itemcore;

    class acc_flashlight: ItemCore {
        displayName = "UTG Defender 126";
    };

    // APEX/Tanoa

    // QBZ-95 and variants
    class arifle_CTAR_base_F;
    class arifle_CTAR_blk_F: arifle_CTAR_base_F {
        displayName = CSTRING(arifle_CTAR_blk);
    };
    class arifle_CTAR_ghex_F: arifle_CTAR_base_F {
        displayName = CSTRING(arifle_CTAR_ghex);
    };
    class arifle_CTAR_hex_F: arifle_CTAR_base_F {
        displayName = CSTRING(arifle_CTAR_hex);
    };
    class arifle_CTAR_GL_base_F;
    class arifle_CTAR_GL_blk_F: arifle_CTAR_GL_base_F {
        displayName = CSTRING(arifle_CTAR_GL_blk);
    };
    class arifle_CTAR_GL_ghex_F: arifle_CTAR_GL_base_F {
        displayName = CSTRING(arifle_CTAR_GL_ghex);
    };
    class arifle_CTAR_GL_hex_F: arifle_CTAR_GL_base_F {
        displayName = CSTRING(arifle_CTAR_GL_hex);
    };

    class arifle_CTARS_base_F;
    class arifle_CTARS_blk_F: arifle_CTARS_base_F {
        displayName = CSTRING(arifle_CTARS_blk);
    };
    class arifle_CTARS_ghex_F: arifle_CTARS_base_F {
        displayName = CSTRING(arifle_CTARS_ghex);
    };
    class arifle_CTARS_hex_F: arifle_CTARS_base_F {
        displayName = CSTRING(arifle_CTARS_hex);
    };

    // QBU-88
    class DMR_07_base_F;
    class srifle_DMR_07_blk_F: DMR_07_base_F {
        displayName = CSTRING(srifle_DMR_07_blk);
    };
    class srifle_DMR_07_ghex_F: DMR_07_base_F {
        displayName = CSTRING(srifle_DMR_07_ghex);
    };
    class srifle_DMR_07_hex_F: DMR_07_base_F {
        displayName = CSTRING(srifle_DMR_07_hex);
    };

    // GM6
    class srifle_GM6_ghex_F: srifle_GM6_F {
        displayName = CSTRING(srifle_GM6_ghex);
    };

    // M249
    class LMG_03_base_F;
    class LMG_03_F: LMG_03_base_F {
        displayName = CSTRING(LMG_03);
    };

    // Intervention
    class srifle_LRR_tna_F: srifle_LRR_camo_F {
        displayName = CSTRING(srifle_LRR_tna);
    };

    // MP5
    class SMG_05_base_F;
    class SMG_05_F: SMG_05_base_F {
        displayName = CSTRING(SMG_05);
    };

    // HK416 and variants
    class arifle_SPAR_01_base_F;
    class arifle_SPAR_01_blk_F: arifle_SPAR_01_base_F {
        displayName = CSTRING(arifle_SPAR_01_blk);
    };
    class arifle_SPAR_01_khk_F: arifle_SPAR_01_base_F {
        displayName = CSTRING(arifle_SPAR_01_khk);
    };
    class arifle_SPAR_01_snd_F: arifle_SPAR_01_base_F {
        displayName = CSTRING(arifle_SPAR_01_snd);
    };
    class arifle_SPAR_01_GL_base_F;
    class arifle_SPAR_01_GL_blk_F: arifle_SPAR_01_GL_base_F {
        displayName = CSTRING(arifle_SPAR_01_GL_blk);
    };
    class arifle_SPAR_01_GL_khk_F: arifle_SPAR_01_GL_base_F {
        displayName = CSTRING(arifle_SPAR_01_GL_khk);
    };
    class arifle_SPAR_01_GL_snd_F: arifle_SPAR_01_GL_base_F {
        displayName = CSTRING(arifle_SPAR_01_GL_snd);
    };
    class arifle_SPAR_02_base_F;
    class arifle_SPAR_02_blk_F: arifle_SPAR_02_base_F {
        displayName = CSTRING(arifle_SPAR_02_blk);
    };
    class arifle_SPAR_02_khk_F: arifle_SPAR_02_base_F {
        displayName = CSTRING(arifle_SPAR_02_khk);
    };
    class arifle_SPAR_02_snd_F: arifle_SPAR_02_base_F {
        displayName = CSTRING(arifle_SPAR_02_snd);
    };
    class arifle_SPAR_03_base_F;
    class arifle_SPAR_03_blk_F: arifle_SPAR_03_base_F {
        displayName = CSTRING(arifle_SPAR_03_blk);
    };
    class arifle_SPAR_03_khk_F: arifle_SPAR_03_base_F {
        displayName = CSTRING(arifle_SPAR_03_khk);
    };
    class arifle_SPAR_03_snd_F: arifle_SPAR_03_base_F {
        displayName = CSTRING(arifle_SPAR_03_snd);
    };

    // RPG-32
    class launch_RPG32_ghex_F: launch_RPG32_F {
        displayName = CSTRING(launch_RPG32_ghex);
    };

    // P99
    class hgun_P07_khk_F: hgun_P07_F {
        displayName = CSTRING(hgun_P07_khk);
    };

    // Makarov
    class hgun_Pistol_01_F: Pistol_Base_F {
        displayName = CSTRING(hgun_Pistol_01);
    };
};
