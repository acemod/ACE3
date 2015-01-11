/*

Autoexported while playing the unmodded game.


A = "_c = _x >> 'items'; isArray _c" configClasses (configFile >> "CfgVehicles");

B = []; {B set [_forEachIndex, inheritsFrom _x]} forEach A;
E = B - A;

C = []; {C set [_forEachIndex, getArray (_x >> "items")]} forEach A;
D = []; {D set [_forEachIndex, getArray (_x >> "respawnItems")]} forEach A;

{A set [_forEachIndex, configName _x]} forEach A;
{B set [_forEachIndex, configName _x]} forEach B;
{E set [_forEachIndex, configName _x]} forEach E;

diag_log text "=====================";

{
    diag_log text format ["class %1;", _x];
} forEach E;

{
    diag_log text format ["class %1: %2 {", _x, B select _forEachIndex];
    _s = str (C select _forEachIndex); _s = toString (toArray _s - [91,93]);
    diag_log text format ["  items[] = {%1};", _s];
    _s = str (D select _forEachIndex); _s = toString (toArray _s - [91,93]);
    diag_log text format ["  respawnItems[] = {%1};", _s];
    diag_log text "};";
} forEach A;

*/

class SoldierWB;
class SoldierGB;
class SoldierEB;
class C_man_1;
class B_Soldier_base_F: SoldierWB {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_Soldier_02_f: B_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_Soldier_03_f: B_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_Soldier_04_f: B_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_Soldier_05_f: B_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_Soldier_F: B_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_RangeMaster_F: B_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_Soldier_lite_F: B_Soldier_03_f {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_Soldier_GL_F: B_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_soldier_AR_F: B_Soldier_02_f {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_Soldier_SL_F: B_Soldier_03_f {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_Soldier_TL_F: B_Soldier_03_f {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_soldier_M_F: B_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_soldier_LAT_F: B_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_medic_F: B_Soldier_02_f {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_soldier_repair_F: B_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_soldier_exp_F: B_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_Helipilot_F: B_Soldier_04_f {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_Soldier_A_F: B_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_soldier_AT_F: B_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_soldier_AA_F: B_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_engineer_F: B_Soldier_03_f {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_crew_F: B_Soldier_03_f {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_officer_F: B_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_Competitor_F: B_RangeMaster_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_Pilot_F: B_Soldier_05_f {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_helicrew_F: B_Helipilot_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_soldier_PG_F: B_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_soldier_UAV_F: B_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class b_soldier_unarmed_f: B_Soldier_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_Soldier_diver_base_F: B_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_diver_F: B_Soldier_diver_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_diver_TL_F: B_Soldier_diver_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_diver_exp_F: B_Soldier_diver_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_Soldier_recon_base: B_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_recon_F: B_Soldier_recon_base {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_recon_LAT_F: B_Soldier_recon_base {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_recon_exp_F: B_Soldier_recon_base {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_recon_medic_F: B_Soldier_recon_base {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_recon_TL_F: B_Soldier_recon_base {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_recon_M_F: B_Soldier_recon_base {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_recon_JTAC_F: B_Soldier_recon_base {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_Soldier_sniper_base_F: B_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_spotter_F: B_Soldier_sniper_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_sniper_F: B_Soldier_sniper_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_Story_SF_Captain_F: B_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_Story_Protagonist_F: B_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_Story_Engineer_F: B_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_Story_Colonel_F: B_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_Story_Pilot_F: B_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_Story_Tank_Commander_F: B_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class b_soldier_survival_F: B_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_CTRG_soldier_GL_LAT_F: B_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_CTRG_soldier_engineer_exp_F: B_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_CTRG_soldier_M_medic_F: B_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_CTRG_soldier_AR_A_F: B_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_Soldier_support_base_F: B_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_soldier_AAR_F: B_Soldier_support_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_soldier_AAT_F: B_Soldier_support_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_soldier_AAA_F: B_soldier_AAT_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_support_MG_F: B_Soldier_support_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_support_GMG_F: B_Soldier_support_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_support_Mort_F: B_Soldier_support_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_support_AMG_F: B_Soldier_support_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_support_AMort_F: B_Soldier_support_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_G_Soldier_base_F: SoldierGB {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_G_Soldier_F: I_G_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_G_Soldier_lite_F: I_G_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_G_Soldier_SL_F: I_G_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_G_Soldier_TL_F: I_G_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_G_Soldier_AR_F: I_G_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_G_medic_F: I_G_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_G_engineer_F: I_G_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_G_Soldier_exp_F: I_G_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_G_Soldier_GL_F: I_G_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_G_Soldier_M_F: I_G_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_G_Soldier_LAT_F: I_G_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_G_Soldier_A_F: I_G_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_G_officer_F: I_G_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_G_Soldier_F: I_G_Soldier_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_G_Soldier_F: I_G_Soldier_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_G_Soldier_lite_F: I_G_Soldier_lite_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_G_Soldier_lite_F: I_G_Soldier_lite_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_G_Soldier_SL_F: I_G_Soldier_SL_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_G_Soldier_SL_F: I_G_Soldier_SL_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_G_Soldier_TL_F: I_G_Soldier_TL_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_G_Soldier_TL_F: I_G_Soldier_TL_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_G_Soldier_AR_F: I_G_Soldier_AR_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_G_Soldier_AR_F: I_G_Soldier_AR_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_G_medic_F: I_G_medic_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_G_medic_F: I_G_medic_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_G_engineer_F: I_G_engineer_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_G_engineer_F: I_G_engineer_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_G_Soldier_exp_F: I_G_Soldier_exp_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_G_Soldier_exp_F: I_G_Soldier_exp_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_G_Soldier_GL_F: I_G_Soldier_GL_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_G_Soldier_GL_F: I_G_Soldier_GL_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_G_Soldier_M_F: I_G_Soldier_M_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_G_Soldier_M_F: I_G_Soldier_M_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_G_Soldier_LAT_F: I_G_Soldier_LAT_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_G_Soldier_LAT_F: I_G_Soldier_LAT_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_G_Soldier_A_F: I_G_Soldier_A_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_G_Soldier_A_F: I_G_Soldier_A_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_G_officer_F: I_G_officer_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_G_officer_F: I_G_officer_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class i_g_soldier_unarmed_f: I_G_Soldier_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class b_g_soldier_unarmed_f: B_G_Soldier_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class o_g_soldier_unarmed_f: O_G_Soldier_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class i_g_survivor_F: I_G_Soldier_F {
  items[] = {};
  respawnItems[] = {};
};
class b_g_survivor_F: B_G_Soldier_F {
  items[] = {};
  respawnItems[] = {};
};
class o_g_survivor_F: O_G_Soldier_F {
  items[] = {};
  respawnItems[] = {};
};
class I_G_Story_Protagonist_F: B_G_Soldier_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_G_Story_SF_Captain_F: B_G_Soldier_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_G_resistanceLeader_F: I_G_Story_Protagonist_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_G_resistanceCommander_F: I_G_Story_Protagonist_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_Soldier_base_F: SoldierGB {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_Soldier_02_F: I_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_Soldier_03_F: I_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_Soldier_04_F: I_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_soldier_F: I_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_Soldier_lite_F: I_Soldier_02_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_Soldier_A_F: I_Soldier_02_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_Soldier_GL_F: I_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_Soldier_AR_F: I_Soldier_02_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_Soldier_SL_F: I_Soldier_02_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_Soldier_TL_F: I_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_Soldier_M_F: I_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_Soldier_LAT_F: I_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_Soldier_AT_F: I_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_Soldier_AA_F: I_Soldier_02_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_medic_F: I_Soldier_02_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_Soldier_repair_F: I_Soldier_02_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_Soldier_exp_F: I_Soldier_02_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_engineer_F: I_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_crew_F: I_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_helipilot_F: I_Soldier_03_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_pilot_F: I_Soldier_04_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_helicrew_F: I_helipilot_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_officer_F: I_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_Story_Colonel_F: I_officer_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_soldier_UAV_F: I_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class i_soldier_unarmed_f: I_soldier_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_Soldier_diver_base_F: I_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_diver_F: I_Soldier_diver_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_diver_exp_F: I_Soldier_diver_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_diver_TL_F: I_Soldier_diver_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_Soldier_sniper_base_F: I_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_Spotter_F: I_Soldier_sniper_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_Sniper_F: I_Soldier_sniper_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_Soldier_support_base_F: I_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_Soldier_AAR_F: I_Soldier_support_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_Soldier_AAT_F: I_Soldier_support_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_Soldier_AAA_F: I_Soldier_AAT_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_support_MG_F: I_Soldier_support_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_support_GMG_F: I_Soldier_support_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_support_Mort_F: I_Soldier_support_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_support_AMG_F: I_Soldier_support_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_support_AMort_F: I_Soldier_support_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_Soldier_base_F: SoldierEB {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_officer_F: O_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_Soldier_02_F: O_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_Soldier_F: O_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_Soldier_lite_F: O_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_Soldier_GL_F: O_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_Soldier_AR_F: O_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_Soldier_SL_F: O_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_Soldier_TL_F: O_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_soldier_M_F: O_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_Soldier_LAT_F: O_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_medic_F: O_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_soldier_repair_F: O_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_soldier_exp_F: O_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_helipilot_F: O_Soldier_02_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_Soldier_A_F: O_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_Soldier_AT_F: O_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_Soldier_AA_F: O_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_engineer_F: O_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_crew_F: O_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_Pilot_F: O_helipilot_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_helicrew_F: O_helipilot_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_soldier_PG_F: O_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_Story_Colonel_F: O_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_Story_CEO_F: O_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_soldier_UAV_F: O_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class o_soldier_unarmed_f: O_Soldier_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_Soldier_diver_base_F: O_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_diver_F: O_Soldier_diver_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_diver_TL_F: O_Soldier_diver_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_diver_exp_F: O_Soldier_diver_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_Soldier_sniper_base_F: O_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_spotter_F: O_Soldier_sniper_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_sniper_F: O_Soldier_sniper_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_Soldier_recon_base: O_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_recon_F: O_Soldier_recon_base {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_recon_M_F: O_Soldier_recon_base {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_recon_LAT_F: O_Soldier_recon_base {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_recon_medic_F: O_Soldier_recon_base {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_recon_exp_F: O_Soldier_recon_base {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_recon_JTAC_F: O_Soldier_recon_base {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_recon_TL_F: O_Soldier_recon_base {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_Soldier_support_base_F: O_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_Soldier_AAR_F: O_Soldier_support_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_Soldier_AAT_F: O_Soldier_support_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_Soldier_AAA_F: O_Soldier_AAT_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_support_MG_F: O_Soldier_support_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_support_GMG_F: O_Soldier_support_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_support_Mort_F: O_Soldier_support_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_support_AMG_F: O_Soldier_support_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_support_AMort_F: O_Soldier_support_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_Soldier_Urban_base: O_Soldier_base_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_soldierU_F: O_Soldier_Urban_base {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_soldierU_AR_F: O_Soldier_Urban_base {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_soldierU_AAR_F: O_Soldier_Urban_base {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_soldierU_LAT_F: O_Soldier_Urban_base {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_soldierU_AT_F: O_Soldier_Urban_base {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_soldierU_AAT_F: O_Soldier_Urban_base {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_soldierU_AA_F: O_Soldier_Urban_base {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_soldierU_AAA_F: O_Soldier_Urban_base {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_soldierU_TL_F: O_Soldier_Urban_base {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_SoldierU_SL_F: O_Soldier_Urban_base {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_soldierU_medic_F: O_Soldier_Urban_base {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_soldierU_repair_F: O_Soldier_Urban_base {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_soldierU_exp_F: O_Soldier_Urban_base {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_engineer_U_F: O_Soldier_Urban_base {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_soldierU_M_F: O_Soldier_Urban_base {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_soldierU_A_F: O_Soldier_Urban_base {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_SoldierU_GL_F: O_Soldier_Urban_base {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class C_Marshal_F: B_RangeMaster_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class B_Soldier_VR_F: B_Soldier_base_F {
  items[] = {};
  respawnItems[] = {};
};
class O_Soldier_VR_F: O_Soldier_base_F {
  items[] = {};
  respawnItems[] = {};
};
class I_Soldier_VR_F: I_Soldier_base_F {
  items[] = {};
  respawnItems[] = {};
};
class C_Soldier_VR_F: C_man_1 {
  items[] = {};
  respawnItems[] = {};
};
class B_Protagonist_VR_F: B_Soldier_base_F {
  items[] = {};
  respawnItems[] = {};
};
class O_Protagonist_VR_F: O_Soldier_base_F {
  items[] = {};
  respawnItems[] = {};
};
class I_Protagonist_VR_F: I_Soldier_base_F {
  items[] = {};
  respawnItems[] = {};
};
class B_UAV_AI: B_Helipilot_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class O_UAV_AI: O_helipilot_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class I_UAV_AI: O_UAV_AI {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class Underwear_F: B_Soldier_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class b_survivor_F: B_Soldier_F {
  items[] = {};
  respawnItems[] = {};
};
class o_survivor_F: O_Soldier_F {
  items[] = {};
  respawnItems[] = {};
};
class i_survivor_F: I_soldier_F {
  items[] = {};
  respawnItems[] = {};
};
class b_soldier_universal_f: B_Soldier_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class b_g_soldier_universal_f: B_G_Soldier_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class o_soldier_universal_f: O_Soldier_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class o_g_soldier_universal_f: O_G_Soldier_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class i_soldier_universal_f: I_soldier_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
class i_g_soldier_universal_f: I_G_Soldier_F {
  items[] = {"FirstAidKit"};
  respawnItems[] = {"FirstAidKit"};
};
