class CfgAmmo {
	class Default {
		explosionEffects = "ACE_ExplosionEffects_Default";
	};

	class MissileCore: Default {
		explosionEffects = "ACE_ExplosionEffects_MissileCore";
	};

	class MissileBase: MissileCore {
		explosionEffects = "ACE_ExplosionEffects_MissileBase";
	};

	class M_Titan_AT: MissileBase {
		explosionEffects = "ACE_ExplosionEffects_M_Titan_AT";
	};

	class ShellCore: Default {
		explosionEffects = "ACE_ExplosionEffects_ShellCore";
	};

	class ShellBase: ShellCore {
		explosionEffects = "ACE_ExplosionEffects_ShellBase";
	};

	class Sh_120mm_HE: ShellBase {
		explosionEffects = "ACE_ExplosionEffects_Sh_120mm_HE";
	};

	class GrenadeCore: Default {
		explosionEffects = "ACE_ExplosionEffects_GrenadeCore";
	};

	class Sh_125mm_HE: Sh_120mm_HE {
		explosionEffects = "ACE_ExplosionEffects_Sh_125mm_HE";
	};

	class Sh_125mm_HEAT: Sh_125mm_HE {
		explosionEffects = "ACE_ExplosionEffects_Sh_125mm_HEAT";
	};

	class Sh_125mm_HEAT_T_Green: Sh_125mm_HEAT {
		explosionEffects = "ACE_ExplosionEffects_Sh_125mm_HEAT_T_Green";
	};

	class BulletBase;
	class B_35mm_AA: BulletBase {
		explosionEffects = "ACE_ExplosionEffects_B_35mm_AA";
	};

	class ACE_B_35mm_ABM: B_35mm_AA {
		explosionEffects = "ACE_ExplosionEffects_ACE_B_35mm_ABM";
	};

	class SubmunitionCore: Default {
		explosionEffects = "ACE_ExplosionEffects_SubmunitionCore";
	};

	class SubmunitionBase: SubmunitionCore {
		explosionEffects = "ACE_ExplosionEffects_SubmunitionBase";
	};

	class R_230mm_HE: SubmunitionBase {
		explosionEffects = "ACE_ExplosionEffects_R_230mm_HE";
	};

	class BombCore: Default {
		explosionEffects = "ACE_ExplosionEffects_BombCore";
	};

	class LaserBombCore: BombCore {
		explosionEffects = "ACE_ExplosionEffects_LaserBombCore";
	};

	class Bomb_04_F: LaserBombCore {
		explosionEffects = "ACE_ExplosionEffects_Bomb_04_F";
	};

	class B_25mm: BulletBase {
		explosionEffects = "ACE_ExplosionEffects_B_25mm";
	};

	class Rocket_04_HE_F: MissileBase {
		explosionEffects = "ACE_ExplosionEffects_Rocket_04_HE_F";
	};

	class Rocket_04_AP_F: Rocket_04_HE_F {
		explosionEffects = "ACE_ExplosionEffects_Rocket_04_AP_F";
	};

	class Rocket_03_AP_F: Rocket_04_AP_F {
		explosionEffects = "ACE_ExplosionEffects_Rocket_03_AP_F";
	};

	class ShotDeployCore: Default {
		explosionEffects = "ACE_ExplosionEffects_ShotDeployCore";
	};

	class TimeBombCore: Default {
		explosionEffects = "ACE_ExplosionEffects_TimeBombCore";
	};

	class PipeBombCore: TimeBombCore {
		explosionEffects = "ACE_ExplosionEffects_PipeBombCore";
	};

	class PipeBombBase: PipeBombCore {
		explosionEffects = "ACE_ExplosionEffects_PipeBombBase";
	};

	class IEDUrbanBig_Remote_Ammo: PipeBombBase {
		explosionEffects = "ACE_ExplosionEffects_IEDUrbanBig_Remote_Ammo";
	};

	class ACE_IEDUrbanBig_Command_Ammo: IEDUrbanBig_Remote_Ammo {
		explosionEffects = "ACE_ExplosionEffects_ACE_IEDUrbanBig_Command_Ammo";
	};

	class MineCore: TimeBombCore {
		explosionEffects = "ACE_ExplosionEffects_MineCore";
	};

	class MineBase: MineCore {
		explosionEffects = "ACE_ExplosionEffects_MineBase";
	};

	class APERSMine_Range_Ammo: MineBase {
		explosionEffects = "ACE_ExplosionEffects_APERSMine_Range_Ammo";
	};

	class ACE_IEDUrbanBig_Range_Ammo: IEDUrbanBig_Remote_Ammo {
		explosionEffects = "ACE_ExplosionEffects_ACE_IEDUrbanBig_Range_Ammo";
	};

	class B_20mm: BulletBase {
		explosionEffects = "ACE_ExplosionEffects_B_20mm";
	};

	class ACE_20mm_HE: B_20mm {
		explosionEffects = "ACE_ExplosionEffects_ACE_20mm_HE";
	};

	class Missile_AGM_02_F: MissileBase {
		explosionEffects = "ACE_ExplosionEffects_Missile_AGM_02_F";
	};

	class Missile_AGM_01_F: Missile_AGM_02_F {
		explosionEffects = "ACE_ExplosionEffects_Missile_AGM_01_F";
	};

	class B_19mm_HE: BulletBase {
		explosionEffects = "ACE_ExplosionEffects_B_19mm_HE";
	};

	class B_30mm_HE: B_19mm_HE {
		explosionEffects = "ACE_ExplosionEffects_B_30mm_HE";
	};

	class B_40mm_GPR: B_30mm_HE {
		explosionEffects = "ACE_ExplosionEffects_B_40mm_GPR";
	};

	class ShotDeployBase: ShotDeployCore {
		explosionEffects = "ACE_ExplosionEffects_ShotDeployBase";
	};

	class Missile_AA_04_F: MissileBase {
		explosionEffects = "ACE_ExplosionEffects_Missile_AA_04_F";
	};

	class Missile_AA_03_F: Missile_AA_04_F {
		explosionEffects = "ACE_ExplosionEffects_Missile_AA_03_F";
	};

	class GrenadeBase: GrenadeCore {
		explosionEffects = "ACE_ExplosionEffects_GrenadeBase";
	};

	class G_40mm_HE: GrenadeBase {
		explosionEffects = "ACE_ExplosionEffects_G_40mm_HE";
	};

	class G_40mm_HEDP: G_40mm_HE {
		explosionEffects = "ACE_ExplosionEffects_G_40mm_HEDP";
	};

	class ACE_G_40mm_HEDP: G_40mm_HEDP {
		explosionEffects = "ACE_ExplosionEffects_ACE_G_40mm_HEDP";
	};

	class B_35mm_AA_Tracer_Red: B_35mm_AA {
		explosionEffects = "ACE_ExplosionEffects_B_35mm_AA_Tracer_Red";
	};

	class ACE_B_35mm_ABM_Tracer_Red: B_35mm_AA_Tracer_Red {
		explosionEffects = "ACE_ExplosionEffects_ACE_B_35mm_ABM_Tracer_Red";
	};

	class AT_Mine_155mm_AMOS_range: SubmunitionBase {
		explosionEffects = "ACE_ExplosionEffects_AT_Mine_155mm_AMOS_range";
	};

	class RocketCore: Default {
		explosionEffects = "ACE_ExplosionEffects_RocketCore";
	};

	class RocketBase: RocketCore {
		explosionEffects = "ACE_ExplosionEffects_RocketBase";
	};

	class R_Hydra_HE: RocketBase {
		explosionEffects = "ACE_ExplosionEffects_R_Hydra_HE";
	};

	class B_20mm_Tracer_Red: B_20mm {
		explosionEffects = "ACE_ExplosionEffects_B_20mm_Tracer_Red";
	};

	class Rocket_03_HE_F: Rocket_04_HE_F {
		explosionEffects = "ACE_ExplosionEffects_Rocket_03_HE_F";
	};

	class B_30mm_HE_Tracer_Yellow: B_30mm_HE {
		explosionEffects = "ACE_ExplosionEffects_B_30mm_HE_Tracer_Yellow";
	};

	class DirectionalBombCore: TimeBombCore {
		explosionEffects = "ACE_ExplosionEffects_DirectionalBombCore";
	};

	class DirectionalBombBase: DirectionalBombCore {
		explosionEffects = "ACE_ExplosionEffects_DirectionalBombBase";
	};

	class ClaymoreDirectionalMine_Remote_Ammo: DirectionalBombBase {
		explosionEffects = "ACE_ExplosionEffects_ClaymoreDirectionalMine_Remote_Ammo";
	};

	class ClaymoreDirectionalMine_Remote_Ammo_Scripted: ClaymoreDirectionalMine_Remote_Ammo {
		explosionEffects = "ACE_ExplosionEffects_ClaymoreDirectionalMine_Remote_Ammo_Scripted";
	};

	class Bo_GBU12_LGB: LaserBombCore {
		explosionEffects = "ACE_ExplosionEffects_Bo_GBU12_LGB";
	};

	class Bomb_03_F: Bomb_04_F {
		explosionEffects = "ACE_ExplosionEffects_Bomb_03_F";
	};

	class M_NLAW_AT_F: MissileBase {
		explosionEffects = "ACE_ExplosionEffects_M_NLAW_AT_F";
	};

	class SLAMDirectionalMine_Wire_Ammo: DirectionalBombBase {
		explosionEffects = "ACE_ExplosionEffects_SLAMDirectionalMine_Wire_Ammo";
	};

	class ACE_SLAMDirectionalMine_Timer_Ammo: SLAMDirectionalMine_Wire_Ammo {
		explosionEffects = "ACE_ExplosionEffects_ACE_SLAMDirectionalMine_Timer_Ammo";
	};

	class M_PG_AT: MissileBase {
		explosionEffects = "ACE_ExplosionEffects_M_PG_AT";
	};

	class ACE_Hydra70_DAGR: M_PG_AT {
		explosionEffects = "ACE_ExplosionEffects_ACE_Hydra70_DAGR";
	};

	class HelicopterExploSmall: ShellBase {
		explosionEffects = "ACE_ExplosionEffects_HelicopterExploSmall";
	};

	class HelicopterExploBig: HelicopterExploSmall {
		explosionEffects = "ACE_ExplosionEffects_HelicopterExploBig";
	};

	class UnderwaterMine_Range_Ammo: MineBase {
		explosionEffects = "ACE_ExplosionEffects_UnderwaterMine_Range_Ammo";
	};

	class M_Titan_AA: MissileBase {
		explosionEffects = "ACE_ExplosionEffects_M_Titan_AA";
	};

	class M_Titan_AA_long: M_Titan_AA {
		explosionEffects = "ACE_ExplosionEffects_M_Titan_AA_long";
	};

	class ACE_HuntIR_Propell: ShellBase {
		explosionEffects = "ACE_ExplosionEffects_ACE_HuntIR_Propell";
	};

	class Sh_155mm_AMOS: ShellBase {
		explosionEffects = "ACE_ExplosionEffects_Sh_155mm_AMOS";
	};

	class Sh_82mm_AMOS: Sh_155mm_AMOS {
		explosionEffects = "ACE_ExplosionEffects_Sh_82mm_AMOS";
	};

	class Mine_155mm_AMOS_range: SubmunitionBase {
		explosionEffects = "ACE_ExplosionEffects_Mine_155mm_AMOS_range";
	};

	class UWMine_155mm_AMOS_range: Mine_155mm_AMOS_range {
		explosionEffects = "ACE_ExplosionEffects_UWMine_155mm_AMOS_range";
	};

	class Sh_125mm_HEAT_T_Red: Sh_125mm_HEAT {
		explosionEffects = "ACE_ExplosionEffects_Sh_125mm_HEAT_T_Red";
	};

	class Grenade: Default {
		explosionEffects = "ACE_ExplosionEffects_Grenade";
	};

	class GrenadeHand: Grenade {
		explosionEffects = "ACE_ExplosionEffects_GrenadeHand";
	};

	class ACE_G40mm_HE_VOG25P: G_40mm_HE {
		explosionEffects = "ACE_ExplosionEffects_ACE_G40mm_HE_VOG25P";
	};

	class IEDUrbanSmall_Remote_Ammo: PipeBombBase {
		explosionEffects = "ACE_ExplosionEffects_IEDUrbanSmall_Remote_Ammo";
	};

	class B_30mm_HE_Tracer_Green: B_30mm_HE {
		explosionEffects = "ACE_ExplosionEffects_B_30mm_HE_Tracer_Green";
	};

	class BoundingMineCore: TimeBombCore {
		explosionEffects = "ACE_ExplosionEffects_BoundingMineCore";
	};

	class R_PG32V_F: RocketBase {
		explosionEffects = "ACE_ExplosionEffects_R_PG32V_F";
	};

	class M_Zephyr: M_Titan_AA {
		explosionEffects = "ACE_ExplosionEffects_M_Zephyr";
	};

	class M_Zephyr_air: M_Zephyr {
		explosionEffects = "ACE_ExplosionEffects_M_Zephyr_air";
	};

	class IEDLandSmall_Remote_Ammo: PipeBombBase {
		explosionEffects = "ACE_ExplosionEffects_IEDLandSmall_Remote_Ammo";
	};

	class ACE_IEDLandSmall_Command_Ammo: IEDLandSmall_Remote_Ammo {
		explosionEffects = "ACE_ExplosionEffects_ACE_IEDLandSmall_Command_Ammo";
	};

	class Smoke_120mm_AMOS_White: SubmunitionBase {
		explosionEffects = "ACE_ExplosionEffects_Smoke_120mm_AMOS_White";
	};

	class BoundingMineBase: BoundingMineCore {
		explosionEffects = "ACE_ExplosionEffects_BoundingMineBase";
	};

	class Sh_120mm_HE_Tracer_Yellow: Sh_120mm_HE {
		explosionEffects = "ACE_ExplosionEffects_Sh_120mm_HE_Tracer_Yellow";
	};

	class ACE_GBU12: Bo_GBU12_LGB {
		explosionEffects = "ACE_ExplosionEffects_ACE_GBU12";
	};

	class M_Titan_AT_static: M_Titan_AT {
		explosionEffects = "ACE_ExplosionEffects_M_Titan_AT_static";
	};

	class B_30mm_MP: B_30mm_HE {
		explosionEffects = "ACE_ExplosionEffects_B_30mm_MP";
	};

	class B_30mm_MP_Tracer_Green: B_30mm_MP {
		explosionEffects = "ACE_ExplosionEffects_B_30mm_MP_Tracer_Green";
	};

	class Sh_82mm_AMOS_guided: SubmunitionBase {
		explosionEffects = "ACE_ExplosionEffects_Sh_82mm_AMOS_guided";
	};

	class Sh_155mm_AMOS_guided: Sh_82mm_AMOS_guided {
		explosionEffects = "ACE_ExplosionEffects_Sh_155mm_AMOS_guided";
	};

	class R_80mm_HE: RocketBase {
		explosionEffects = "ACE_ExplosionEffects_R_80mm_HE";
	};

	class M_AT: M_PG_AT {
		explosionEffects = "ACE_ExplosionEffects_M_AT";
	};

	class ACE_IEDUrbanSmall_Command_Ammo: IEDUrbanSmall_Remote_Ammo {
		explosionEffects = "ACE_ExplosionEffects_ACE_IEDUrbanSmall_Command_Ammo";
	};

	class ModuleOrdnanceMortar_F_ammo: Sh_82mm_AMOS {
		explosionEffects = "ACE_ExplosionEffects_ModuleOrdnanceMortar_F_ammo";
	};

	class ArtilleryRocketCore: RocketCore {
		explosionEffects = "ACE_ExplosionEffects_ArtilleryRocketCore";
	};

	class ACE_IEDUrbanSmall_Range_Ammo: IEDUrbanSmall_Remote_Ammo {
		explosionEffects = "ACE_ExplosionEffects_ACE_IEDUrbanSmall_Range_Ammo";
	};

	class ModuleOrdnanceHowitzer_F_ammo: Sh_155mm_AMOS {
		explosionEffects = "ACE_ExplosionEffects_ModuleOrdnanceHowitzer_F_ammo";
	};

	class R_60mm_HE: R_80mm_HE {
		explosionEffects = "ACE_ExplosionEffects_R_60mm_HE";
	};

	class ACE_Hellfire_AGM114K: ACE_Hydra70_DAGR {
		explosionEffects = "ACE_ExplosionEffects_ACE_Hellfire_AGM114K";
	};

	class B_35mm_AA_Tracer_Green: B_35mm_AA {
		explosionEffects = "ACE_ExplosionEffects_B_35mm_AA_Tracer_Green";
	};

	class ACE_B_35mm_ABM_Tracer_Green: B_35mm_AA_Tracer_Green {
		explosionEffects = "ACE_ExplosionEffects_ACE_B_35mm_ABM_Tracer_Green";
	};

	class IEDLandBig_Remote_Ammo: PipeBombBase {
		explosionEffects = "ACE_ExplosionEffects_IEDLandBig_Remote_Ammo";
	};

	class ACE_IEDLandBig_Range_Ammo: IEDLandBig_Remote_Ammo {
		explosionEffects = "ACE_ExplosionEffects_ACE_IEDLandBig_Range_Ammo";
	};

	class SatchelCharge_Remote_Ammo: PipeBombBase {
		explosionEffects = "ACE_ExplosionEffects_SatchelCharge_Remote_Ammo";
	};

	class SatchelCharge_Remote_Ammo_Scripted: SatchelCharge_Remote_Ammo {
		explosionEffects = "ACE_ExplosionEffects_SatchelCharge_Remote_Ammo_Scripted";
	};

	class Sh_82mm_AMOS_LG: Sh_82mm_AMOS_guided {
		explosionEffects = "ACE_ExplosionEffects_Sh_82mm_AMOS_LG";
	};

	class Sh_155mm_AMOS_LG: Sh_82mm_AMOS_LG {
		explosionEffects = "ACE_ExplosionEffects_Sh_155mm_AMOS_LG";
	};

	class mini_Grenade: GrenadeHand {
		explosionEffects = "ACE_ExplosionEffects_mini_Grenade";
	};

	class Gatling_30mm_HE_Plane_CAS_01_F: BulletBase {
		explosionEffects = "ACE_ExplosionEffects_Gatling_30mm_HE_Plane_CAS_01_F";
	};

	class ACE_Gatling_30mm_HE_Plane_CAS_01_Sub: Gatling_30mm_HE_Plane_CAS_01_F {
		explosionEffects = "ACE_ExplosionEffects_ACE_Gatling_30mm_HE_Plane_CAS_01_Sub";
	};

	class M_Scalpel_AT: MissileBase {
		explosionEffects = "ACE_ExplosionEffects_M_Scalpel_AT";
	};

	class M_Scalpel_AT_hidden: M_Scalpel_AT {
		explosionEffects = "ACE_ExplosionEffects_M_Scalpel_AT_hidden";
	};

	class ACE_B_35mm_ABM_Helper: B_35mm_AA {
		explosionEffects = "ACE_ExplosionEffects_ACE_B_35mm_ABM_Helper";
	};

	class ACE_IEDLandSmall_Range_Ammo: IEDLandBig_Remote_Ammo {
		explosionEffects = "ACE_ExplosionEffects_ACE_IEDLandSmall_Range_Ammo";
	};

	class ACE_Gatling_30mm_HE_Plane_CAS_01_Deploy: Gatling_30mm_HE_Plane_CAS_01_F {
		explosionEffects = "ACE_ExplosionEffects_ACE_Gatling_30mm_HE_Plane_CAS_01_Deploy";
	};

	class M_Zephyr_Mi06: M_Zephyr {
		explosionEffects = "ACE_ExplosionEffects_M_Zephyr_Mi06";
	};

	class Bo_Mk82: BombCore {
		explosionEffects = "ACE_ExplosionEffects_Bo_Mk82";
	};

	class B_30mm_MP_Tracer_Yellow: B_30mm_MP {
		explosionEffects = "ACE_ExplosionEffects_B_30mm_MP_Tracer_Yellow";
	};

	class UnderwaterMineAB_Range_Ammo: UnderwaterMine_Range_Ammo {
		explosionEffects = "ACE_ExplosionEffects_UnderwaterMineAB_Range_Ammo";
	};

	class SmokeShell;
	class ACE_G_M84: SmokeShell {
		explosionEffects = "ACE_ExplosionEffects_ACE_G_M84";
	};

	class Sh_105mm_HEAT_MP: Sh_125mm_HEAT {
		explosionEffects = "ACE_ExplosionEffects_Sh_105mm_HEAT_MP";
	};

	class LightningBolt: ShellBase {
		explosionEffects = "ACE_ExplosionEffects_LightningBolt";
	};

	class ACE_IEDLandBig_Command_Ammo: IEDLandBig_Remote_Ammo {
		explosionEffects = "ACE_ExplosionEffects_ACE_IEDLandBig_Command_Ammo";
	};

	class M_Titan_AA_static: M_Titan_AA {
		explosionEffects = "ACE_ExplosionEffects_M_Titan_AA_static";
	};

	class APERSBoundingMine_Range_Ammo: BoundingMineBase {
		explosionEffects = "ACE_ExplosionEffects_APERSBoundingMine_Range_Ammo";
	};

	class Cluster_155mm_AMOS: SubmunitionBase {
		explosionEffects = "ACE_ExplosionEffects_Cluster_155mm_AMOS";
	};

	class Mo_ClassicMineRange: ShotDeployBase {
		explosionEffects = "ACE_ExplosionEffects_Mo_ClassicMineRange";
	};

	class Mo_UnderwaterMineRange: Mo_ClassicMineRange {
		explosionEffects = "ACE_ExplosionEffects_Mo_UnderwaterMineRange";
	};

	class Sh_125mm_HEAT_T_Yellow: Sh_125mm_HEAT {
		explosionEffects = "ACE_ExplosionEffects_Sh_125mm_HEAT_T_Yellow";
	};

	class Sh_105mm_HEAT_MP_T_Yellow: Sh_105mm_HEAT_MP {
		explosionEffects = "ACE_ExplosionEffects_Sh_105mm_HEAT_MP_T_Yellow";
	};

	class SmallSecondary: HelicopterExploSmall {
		explosionEffects = "ACE_ExplosionEffects_SmallSecondary";
	};

	class ACE_SLAMDirectionalMine_Command_Ammo: SLAMDirectionalMine_Wire_Ammo {
		explosionEffects = "ACE_ExplosionEffects_ACE_SLAMDirectionalMine_Command_Ammo";
	};

	class ACE_Javelin_FGM148: M_Titan_AT {
		explosionEffects = "ACE_ExplosionEffects_ACE_Javelin_FGM148";
	};

	class UnderwaterMinePDM_Range_Ammo: UnderwaterMine_Range_Ammo {
		explosionEffects = "ACE_ExplosionEffects_UnderwaterMinePDM_Range_Ammo";
	};

	class G_20mm_HE: G_40mm_HE {
		explosionEffects = "ACE_ExplosionEffects_G_20mm_HE";
	};

	class ACE_G_40mm_HE: G_40mm_HE {
		explosionEffects = "ACE_ExplosionEffects_ACE_G_40mm_HE";
	};

	class ACE_Javelin_FGM148_static: ACE_Javelin_FGM148 {
		explosionEffects = "ACE_ExplosionEffects_ACE_Javelin_FGM148_static";
	};

	class Bo_Air_LGB_hidden: M_Scalpel_AT_hidden {
		explosionEffects = "ACE_ExplosionEffects_Bo_Air_LGB_hidden";
	};

	class Mo_ATMineRange: ShotDeployBase {
		explosionEffects = "ACE_ExplosionEffects_Mo_ATMineRange";
	};

	class Fire_82mm_AMOS: ShotDeployBase {
		explosionEffects = "ACE_ExplosionEffects_Fire_82mm_AMOS";
	};

	class Bo_Air_LGB: M_Scalpel_AT {
		explosionEffects = "ACE_ExplosionEffects_Bo_Air_LGB";
	};

	class M_Mo_82mm_AT: MissileBase {
		explosionEffects = "ACE_ExplosionEffects_M_Mo_82mm_AT";
	};

	class M_Mo_82mm_AT_LG: M_Mo_82mm_AT {
		explosionEffects = "ACE_ExplosionEffects_M_Mo_82mm_AT_LG";
	};

	class ATMine_Range_Ammo: MineBase {
		explosionEffects = "ACE_ExplosionEffects_ATMine_Range_Ammo";
	};

	class Laserbeam: Default {
		explosionEffects = "ACE_ExplosionEffects_Laserbeam";
	};

	class Sh_105mm_HEAT_MP_T_Red: Sh_105mm_HEAT_MP {
		explosionEffects = "ACE_ExplosionEffects_Sh_105mm_HEAT_MP_T_Red";
	};

	class BombBase: BombCore {
		explosionEffects = "ACE_ExplosionEffects_BombBase";
	};

	class B_35mm_AA_Tracer_Yellow: B_35mm_AA {
		explosionEffects = "ACE_ExplosionEffects_B_35mm_AA_Tracer_Yellow";
	};

	class Sh_120mm_HE_Tracer_Red: Sh_120mm_HE {
		explosionEffects = "ACE_ExplosionEffects_Sh_120mm_HE_Tracer_Red";
	};

	class DemoCharge_Remote_Ammo: PipeBombBase {
		explosionEffects = "ACE_ExplosionEffects_DemoCharge_Remote_Ammo";
	};

	class FuelExplosion: Default {
		explosionEffects = "ACE_ExplosionEffects_FuelExplosion";
	};

	class B_30mm_HE_Tracer_Red: B_30mm_HE {
		explosionEffects = "ACE_ExplosionEffects_B_30mm_HE_Tracer_Red";
	};

	class Sh_120mm_HE_Tracer_Green: Sh_120mm_HE {
		explosionEffects = "ACE_ExplosionEffects_Sh_120mm_HE_Tracer_Green";
	};

	class ACE_G_40mm_Practice: ACE_G_40mm_HE {
		explosionEffects = "ACE_ExplosionEffects_ACE_G_40mm_Practice";
	};

	class M_Air_AA: MissileBase {
		explosionEffects = "ACE_ExplosionEffects_M_Air_AA";
	};

	class M_Air_AA_MI02: M_Air_AA {
		explosionEffects = "ACE_ExplosionEffects_M_Air_AA_MI02";
	};

	class M_Mo_120mm_AT: Missile_AGM_02_F {
		explosionEffects = "ACE_ExplosionEffects_M_Mo_120mm_AT";
	};

	class M_Mo_120mm_AT_LG: M_Mo_120mm_AT {
		explosionEffects = "ACE_ExplosionEffects_M_Mo_120mm_AT_LG";
	};

	class Sh_125mm_HE_T_Yellow: Sh_125mm_HE {
		explosionEffects = "ACE_ExplosionEffects_Sh_125mm_HE_T_Yellow";
	};

	class Sh_125mm_HE_T_Red: Sh_125mm_HE {
		explosionEffects = "ACE_ExplosionEffects_Sh_125mm_HE_T_Red";
	};

	class FuelExplosionBig: FuelExplosion {
		explosionEffects = "ACE_ExplosionEffects_FuelExplosionBig";
	};

	class M_Mo_155mm_AT_LG: M_Mo_120mm_AT_LG {
		explosionEffects = "ACE_ExplosionEffects_M_Mo_155mm_AT_LG";
	};

	class M_Titan_AP: M_Titan_AT {
		explosionEffects = "ACE_ExplosionEffects_M_Titan_AP";
	};

	class Mo_cluster_AP: ShellBase {
		explosionEffects = "ACE_ExplosionEffects_Mo_cluster_AP";
	};

	class B_40mm_GPR_Tracer_Red: B_40mm_GPR {
		explosionEffects = "ACE_ExplosionEffects_B_40mm_GPR_Tracer_Red";
	};

	class Bo_Mk82_MI08: Bo_Mk82 {
		explosionEffects = "ACE_ExplosionEffects_Bo_Mk82_MI08";
	};

	class M_Hellfire_AT: MissileBase {
		explosionEffects = "ACE_ExplosionEffects_M_Hellfire_AT";
	};

	class Smoke_82mm_AMOS_White: ShotDeployBase {
		explosionEffects = "ACE_ExplosionEffects_Smoke_82mm_AMOS_White";
	};

	class R_230mm_fly: ShellBase {
		explosionEffects = "ACE_ExplosionEffects_R_230mm_fly";
	};

	class M_Air_AT: M_Titan_AT {
		explosionEffects = "ACE_ExplosionEffects_M_Air_AT";
	};

	class B_40mm_GPR_Tracer_Green: B_40mm_GPR {
		explosionEffects = "ACE_ExplosionEffects_B_40mm_GPR_Tracer_Green";
	};

	class R_TBG32V_F: R_PG32V_F {
		explosionEffects = "ACE_ExplosionEffects_R_TBG32V_F";
	};

	class Sh_125mm_HE_T_Green: Sh_125mm_HE {
		explosionEffects = "ACE_ExplosionEffects_Sh_125mm_HE_T_Green";
	};

	class ACE_SLAMDirectionalMine_Magnetic_Ammo: SLAMDirectionalMine_Wire_Ammo {
		explosionEffects = "ACE_ExplosionEffects_ACE_SLAMDirectionalMine_Magnetic_Ammo";
	};

	class Bo_GBU12_LGB_MI10: Bo_GBU12_LGB {
		explosionEffects = "ACE_ExplosionEffects_Bo_GBU12_LGB_MI10";
	};

	class B_30mm_MP_Tracer_Red: B_30mm_MP {
		explosionEffects = "ACE_ExplosionEffects_B_30mm_MP_Tracer_Red";
	};

	class Cannon_30mm_HE_Plane_CAS_02_F: Gatling_30mm_HE_Plane_CAS_01_F {
		explosionEffects = "ACE_ExplosionEffects_Cannon_30mm_HE_Plane_CAS_02_F";
	};

	class ModuleOrdnanceRocket_F_ammo: R_230mm_HE {
		explosionEffects = "ACE_ExplosionEffects_ModuleOrdnanceRocket_F_ammo";
	};

	class B_40mm_GPR_Tracer_Yellow: B_40mm_GPR {
		explosionEffects = "ACE_ExplosionEffects_B_40mm_GPR_Tracer_Yellow";
	};

	class Sh_105mm_HEAT_MP_T_Green: Sh_105mm_HEAT_MP {
		explosionEffects = "ACE_ExplosionEffects_Sh_105mm_HEAT_MP_T_Green";
	};

	class ModuleOrdnanceRocket_F_subammo: R_230mm_fly {
		explosionEffects = "ACE_ExplosionEffects_ModuleOrdnanceRocket_F_subammo";
	};

	class ACE_B_35mm_ABM_Tracer_Yellow: B_35mm_AA_Tracer_Yellow {
		explosionEffects = "ACE_ExplosionEffects_ACE_B_35mm_ABM_Tracer_Yellow";
	};

	class APERSTripMine_Wire_Ammo: DirectionalBombBase {
		explosionEffects = "ACE_ExplosionEffects_APERSTripMine_Wire_Ammo";
	};

	class DemoCharge_Remote_Ammo_Scripted: DemoCharge_Remote_Ammo {
		explosionEffects = "ACE_ExplosionEffects_DemoCharge_Remote_Ammo_Scripted";
	};

};
