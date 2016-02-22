class ExplosionEffects;
class ACE_ExplosionEffects_Default: ExplosionEffects {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Default";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_MissileCore: ExplosionEffects {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_MissileCore";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ATMissileExplosion;
class ACE_ExplosionEffects_MissileBase: ATMissileExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_MissileBase";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_M_Titan_AT: ATMissileExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_M_Titan_AT";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_ShellCore: ExplosionEffects {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ShellCore";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class HEShellExplosion;
class ACE_ExplosionEffects_ShellBase: HEShellExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ShellBase";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Sh_120mm_HE: HEShellExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Sh_120mm_HE";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_GrenadeCore: ExplosionEffects {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_GrenadeCore";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Sh_125mm_HE: HEShellExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Sh_125mm_HE";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ATRocketExplosion;
class ACE_ExplosionEffects_Sh_125mm_HEAT: ATRocketExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Sh_125mm_HEAT";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Sh_125mm_HEAT_T_Green: ATRocketExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Sh_125mm_HEAT_T_Green";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ExploAmmoExplosion;
class ACE_ExplosionEffects_B_35mm_AA: ExploAmmoExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_B_35mm_AA";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_ACE_B_35mm_ABM: ExploAmmoExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ACE_B_35mm_ABM";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_SubmunitionCore: ExplosionEffects {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_SubmunitionCore";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_SubmunitionBase: ExplosionEffects {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_SubmunitionBase";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_R_230mm_HE: ExplosionEffects {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_R_230mm_HE";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_BombCore: ExplosionEffects {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_BombCore";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_LaserBombCore: ExplosionEffects {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_LaserBombCore";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class BombExplosion;
class ACE_ExplosionEffects_Bomb_04_F: BombExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Bomb_04_F";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_B_25mm: ExploAmmoExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_B_25mm";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Rocket_04_HE_F: ATMissileExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Rocket_04_HE_F";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Rocket_04_AP_F: ATMissileExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Rocket_04_AP_F";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Rocket_03_AP_F: ATMissileExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Rocket_03_AP_F";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_ShotDeployCore: ExplosionEffects {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ShotDeployCore";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_TimeBombCore: ExplosionEffects {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_TimeBombCore";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_PipeBombCore: ExplosionEffects {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_PipeBombCore";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_PipeBombBase: ExplosionEffects {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_PipeBombBase";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class IEDMineBigExplosion;
class ACE_ExplosionEffects_IEDUrbanBig_Remote_Ammo: IEDMineBigExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_IEDUrbanBig_Remote_Ammo";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_ACE_IEDUrbanBig_Command_Ammo: IEDMineBigExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ACE_IEDUrbanBig_Command_Ammo";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_MineCore: ExplosionEffects {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_MineCore";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_MineBase: ExplosionEffects {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_MineBase";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class MineExplosion;
class ACE_ExplosionEffects_APERSMine_Range_Ammo: MineExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_APERSMine_Range_Ammo";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_ACE_IEDUrbanBig_Range_Ammo: IEDMineBigExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ACE_IEDUrbanBig_Range_Ammo";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_B_20mm: ExploAmmoExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_B_20mm";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_ACE_20mm_HE: ExploAmmoExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ACE_20mm_HE";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class AAMissileExplosion;
class ACE_ExplosionEffects_Missile_AGM_02_F: AAMissileExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Missile_AGM_02_F";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Missile_AGM_01_F: AAMissileExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Missile_AGM_01_F";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_B_19mm_HE: ExploAmmoExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_B_19mm_HE";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_B_30mm_HE: ExploAmmoExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_B_30mm_HE";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_B_40mm_GPR: ExploAmmoExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_B_40mm_GPR";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_ShotDeployBase: ExplosionEffects {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ShotDeployBase";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Missile_AA_04_F: ATRocketExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Missile_AA_04_F";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Missile_AA_03_F: ATRocketExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Missile_AA_03_F";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class GrenadeExplosion;
class ACE_ExplosionEffects_GrenadeBase: GrenadeExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_GrenadeBase";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_G_40mm_HE: GrenadeExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_G_40mm_HE";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_G_40mm_HEDP: GrenadeExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_G_40mm_HEDP";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_ACE_G_40mm_HEDP: GrenadeExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ACE_G_40mm_HEDP";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_B_35mm_AA_Tracer_Red: ExploAmmoExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_B_35mm_AA_Tracer_Red";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_ACE_B_35mm_ABM_Tracer_Red: ExploAmmoExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ACE_B_35mm_ABM_Tracer_Red";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_AT_Mine_155mm_AMOS_range: ExplosionEffects {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_AT_Mine_155mm_AMOS_range";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_RocketCore: ExplosionEffects {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_RocketCore";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class HERocketExplosion;
class ACE_ExplosionEffects_RocketBase: HERocketExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_RocketBase";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_R_Hydra_HE: HERocketExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_R_Hydra_HE";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_B_20mm_Tracer_Red: ExploAmmoExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_B_20mm_Tracer_Red";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Rocket_03_HE_F: ATMissileExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Rocket_03_HE_F";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_B_30mm_HE_Tracer_Yellow: ExploAmmoExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_B_30mm_HE_Tracer_Yellow";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_DirectionalBombCore: ExplosionEffects {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_DirectionalBombCore";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_DirectionalBombBase: ExplosionEffects {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_DirectionalBombBase";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class DirectionalMineExplosion;
class ACE_ExplosionEffects_ClaymoreDirectionalMine_Remote_Ammo: DirectionalMineExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ClaymoreDirectionalMine_Remote_Ammo";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_ClaymoreDirectionalMine_Remote_Ammo_Scripted: DirectionalMineExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ClaymoreDirectionalMine_Remote_Ammo_Scripted";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Bo_GBU12_LGB: BombExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Bo_GBU12_LGB";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Bomb_03_F: BombExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Bomb_03_F";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_M_NLAW_AT_F: ATRocketExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_M_NLAW_AT_F";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class DirectionalMineExplosionBig;
class ACE_ExplosionEffects_SLAMDirectionalMine_Wire_Ammo: DirectionalMineExplosionBig {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_SLAMDirectionalMine_Wire_Ammo";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_ACE_SLAMDirectionalMine_Timer_Ammo: DirectionalMineExplosionBig {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ACE_SLAMDirectionalMine_Timer_Ammo";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_M_PG_AT: ATMissileExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_M_PG_AT";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_ACE_Hydra70_DAGR: ATMissileExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ACE_Hydra70_DAGR";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class HelicopterExplosionEffects;
class ACE_ExplosionEffects_HelicopterExploSmall: HelicopterExplosionEffects {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_HelicopterExploSmall";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class HelicopterExplosionEffects2;
class ACE_ExplosionEffects_HelicopterExploBig: HelicopterExplosionEffects2 {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_HelicopterExploBig";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class MineUnderwaterExplosion;
class ACE_ExplosionEffects_UnderwaterMine_Range_Ammo: MineUnderwaterExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_UnderwaterMine_Range_Ammo";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_M_Titan_AA: AAMissileExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_M_Titan_AA";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_M_Titan_AA_long: AAMissileExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_M_Titan_AA_long";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_HuntIR_Propell_Fx;
class ACE_ExplosionEffects_ACE_HuntIR_Propell: ACE_HuntIR_Propell_Fx {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ACE_HuntIR_Propell";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class MortarExplosion;
class ACE_ExplosionEffects_Sh_155mm_AMOS: MortarExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Sh_155mm_AMOS";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Sh_82mm_AMOS: MortarExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Sh_82mm_AMOS";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Mine_155mm_AMOS_range: ExplosionEffects {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Mine_155mm_AMOS_range";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_UWMine_155mm_AMOS_range: ExplosionEffects {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_UWMine_155mm_AMOS_range";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Sh_125mm_HEAT_T_Red: ATRocketExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Sh_125mm_HEAT_T_Red";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Grenade: GrenadeExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Grenade";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_GrenadeHand: GrenadeExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_GrenadeHand";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_ACE_G40mm_HE_VOG25P: GrenadeExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ACE_G40mm_HE_VOG25P";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class IEDMineSmallExplosion;
class ACE_ExplosionEffects_IEDUrbanSmall_Remote_Ammo: IEDMineSmallExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_IEDUrbanSmall_Remote_Ammo";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_B_30mm_HE_Tracer_Green: ExploAmmoExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_B_30mm_HE_Tracer_Green";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_BoundingMineCore: ExplosionEffects {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_BoundingMineCore";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_R_PG32V_F: ATMissileExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_R_PG32V_F";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_M_Zephyr: AAMissileExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_M_Zephyr";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_M_Zephyr_air: AAMissileExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_M_Zephyr_air";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_IEDLandSmall_Remote_Ammo: IEDMineSmallExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_IEDLandSmall_Remote_Ammo";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_ACE_IEDLandSmall_Command_Ammo: IEDMineSmallExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ACE_IEDLandSmall_Command_Ammo";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Smoke_120mm_AMOS_White: ExplosionEffects {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Smoke_120mm_AMOS_White";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_BoundingMineBase: ExplosionEffects {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_BoundingMineBase";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Sh_120mm_HE_Tracer_Yellow: HEShellExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Sh_120mm_HE_Tracer_Yellow";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_ACE_GBU12: BombExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ACE_GBU12";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_M_Titan_AT_static: ATMissileExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_M_Titan_AT_static";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_B_30mm_MP: ExploAmmoExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_B_30mm_MP";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_B_30mm_MP_Tracer_Green: ExploAmmoExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_B_30mm_MP_Tracer_Green";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Sh_82mm_AMOS_guided: ExplosionEffects {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Sh_82mm_AMOS_guided";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Sh_155mm_AMOS_guided: ExplosionEffects {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Sh_155mm_AMOS_guided";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_R_80mm_HE: HERocketExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_R_80mm_HE";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_M_AT: ATMissileExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_M_AT";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_ACE_IEDUrbanSmall_Command_Ammo: IEDMineSmallExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ACE_IEDUrbanSmall_Command_Ammo";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_ModuleOrdnanceMortar_F_ammo: HEShellExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ModuleOrdnanceMortar_F_ammo";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_ArtilleryRocketCore: ExplosionEffects {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ArtilleryRocketCore";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_ACE_IEDUrbanSmall_Range_Ammo: IEDMineSmallExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ACE_IEDUrbanSmall_Range_Ammo";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_ModuleOrdnanceHowitzer_F_ammo: MortarExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ModuleOrdnanceHowitzer_F_ammo";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_R_60mm_HE: HERocketExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_R_60mm_HE";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_ACE_Hellfire_AGM114K: ATMissileExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ACE_Hellfire_AGM114K";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_B_35mm_AA_Tracer_Green: ExploAmmoExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_B_35mm_AA_Tracer_Green";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_ACE_B_35mm_ABM_Tracer_Green: ExploAmmoExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ACE_B_35mm_ABM_Tracer_Green";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_IEDLandBig_Remote_Ammo: IEDMineBigExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_IEDLandBig_Remote_Ammo";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_ACE_IEDLandBig_Range_Ammo: IEDMineBigExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ACE_IEDLandBig_Range_Ammo";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class MineNondirectionalExplosion;
class ACE_ExplosionEffects_SatchelCharge_Remote_Ammo: MineNondirectionalExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_SatchelCharge_Remote_Ammo";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_SatchelCharge_Remote_Ammo_Scripted: MineNondirectionalExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_SatchelCharge_Remote_Ammo_Scripted";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Sh_82mm_AMOS_LG: ExplosionEffects {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Sh_82mm_AMOS_LG";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Sh_155mm_AMOS_LG: ExplosionEffects {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Sh_155mm_AMOS_LG";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_mini_Grenade: GrenadeExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_mini_Grenade";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ExploAmmoExplosionPlaneCAS;
class ACE_ExplosionEffects_Gatling_30mm_HE_Plane_CAS_01_F: ExploAmmoExplosionPlaneCAS {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Gatling_30mm_HE_Plane_CAS_01_F";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_ACE_Gatling_30mm_HE_Plane_CAS_01_Sub: ExploAmmoExplosionPlaneCAS {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ACE_Gatling_30mm_HE_Plane_CAS_01_Sub";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_M_Scalpel_AT: ATRocketExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_M_Scalpel_AT";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_M_Scalpel_AT_hidden: ATRocketExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_M_Scalpel_AT_hidden";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_ACE_B_35mm_ABM_Helper: ExploAmmoExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ACE_B_35mm_ABM_Helper";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_ACE_IEDLandSmall_Range_Ammo: IEDMineBigExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ACE_IEDLandSmall_Range_Ammo";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_ACE_Gatling_30mm_HE_Plane_CAS_01_Deploy: ExploAmmoExplosionPlaneCAS {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ACE_Gatling_30mm_HE_Plane_CAS_01_Deploy";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_M_Zephyr_Mi06: AAMissileExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_M_Zephyr_Mi06";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Bo_Mk82: BombExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Bo_Mk82";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_B_30mm_MP_Tracer_Yellow: ExploAmmoExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_B_30mm_MP_Tracer_Yellow";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class MineUnderwaterABExplosion;
class ACE_ExplosionEffects_UnderwaterMineAB_Range_Ammo: MineUnderwaterABExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_UnderwaterMineAB_Range_Ammo";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_ACE_G_M84: GrenadeExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ACE_G_M84";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Sh_105mm_HEAT_MP: ATRocketExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Sh_105mm_HEAT_MP";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_LightningBolt: ExploAmmoExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_LightningBolt";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_ACE_IEDLandBig_Command_Ammo: IEDMineBigExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ACE_IEDLandBig_Command_Ammo";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_M_Titan_AA_static: AAMissileExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_M_Titan_AA_static";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class BoundingMineExplosion;
class ACE_ExplosionEffects_APERSBoundingMine_Range_Ammo: BoundingMineExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_APERSBoundingMine_Range_Ammo";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Cluster_155mm_AMOS: ExplosionEffects {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Cluster_155mm_AMOS";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Mo_ClassicMineRange: ExplosionEffects {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Mo_ClassicMineRange";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Mo_UnderwaterMineRange: ExplosionEffects {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Mo_UnderwaterMineRange";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Sh_125mm_HEAT_T_Yellow: ATRocketExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Sh_125mm_HEAT_T_Yellow";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Sh_105mm_HEAT_MP_T_Yellow: ATRocketExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Sh_105mm_HEAT_MP_T_Yellow";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class SencondaryExplosion;
class ACE_ExplosionEffects_SmallSecondary: SencondaryExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_SmallSecondary";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_ACE_SLAMDirectionalMine_Command_Ammo: DirectionalMineExplosionBig {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ACE_SLAMDirectionalMine_Command_Ammo";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_ACE_Javelin_FGM148: ATMissileExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ACE_Javelin_FGM148";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class MineUnderwaterPDMExplosion;
class ACE_ExplosionEffects_UnderwaterMinePDM_Range_Ammo: MineUnderwaterPDMExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_UnderwaterMinePDM_Range_Ammo";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_G_20mm_HE: GrenadeExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_G_20mm_HE";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_ACE_G_40mm_HE: GrenadeExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ACE_G_40mm_HE";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_ACE_Javelin_FGM148_static: ATMissileExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ACE_Javelin_FGM148_static";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Bo_Air_LGB_hidden: ATRocketExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Bo_Air_LGB_hidden";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Mo_ATMineRange: ExplosionEffects {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Mo_ATMineRange";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Fire_82mm_AMOS: ExplosionEffects {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Fire_82mm_AMOS";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Bo_Air_LGB: ATRocketExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Bo_Air_LGB";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_M_Mo_82mm_AT: ATMissileExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_M_Mo_82mm_AT";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_M_Mo_82mm_AT_LG: ATMissileExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_M_Mo_82mm_AT_LG";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ATMineExplosion;
class ACE_ExplosionEffects_ATMine_Range_Ammo: ATMineExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ATMine_Range_Ammo";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Laserbeam: ExplosionEffects {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Laserbeam";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Sh_105mm_HEAT_MP_T_Red: ATRocketExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Sh_105mm_HEAT_MP_T_Red";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_BombBase: ExplosionEffects {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_BombBase";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_B_35mm_AA_Tracer_Yellow: ExploAmmoExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_B_35mm_AA_Tracer_Yellow";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Sh_120mm_HE_Tracer_Red: HEShellExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Sh_120mm_HE_Tracer_Red";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class MineNondirectionalExplosionSmall;
class ACE_ExplosionEffects_DemoCharge_Remote_Ammo: MineNondirectionalExplosionSmall {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_DemoCharge_Remote_Ammo";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class VehicleExplosionEffects;
class ACE_ExplosionEffects_FuelExplosion: VehicleExplosionEffects {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_FuelExplosion";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_B_30mm_HE_Tracer_Red: ExploAmmoExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_B_30mm_HE_Tracer_Red";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Sh_120mm_HE_Tracer_Green: HEShellExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Sh_120mm_HE_Tracer_Green";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_ACE_G_40mm_Practice: GrenadeExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ACE_G_40mm_Practice";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_M_Air_AA: AAMissileExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_M_Air_AA";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_M_Air_AA_MI02: AAMissileExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_M_Air_AA_MI02";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_M_Mo_120mm_AT: AAMissileExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_M_Mo_120mm_AT";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_M_Mo_120mm_AT_LG: AAMissileExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_M_Mo_120mm_AT_LG";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Sh_125mm_HE_T_Yellow: HEShellExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Sh_125mm_HE_T_Yellow";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Sh_125mm_HE_T_Red: HEShellExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Sh_125mm_HE_T_Red";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class VehicleExplosionEffectsBig;
class ACE_ExplosionEffects_FuelExplosionBig: VehicleExplosionEffectsBig {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_FuelExplosionBig";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_M_Mo_155mm_AT_LG: AAMissileExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_M_Mo_155mm_AT_LG";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_M_Titan_AP: ATMissileExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_M_Titan_AP";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Mo_cluster_AP: HEShellExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Mo_cluster_AP";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_B_40mm_GPR_Tracer_Red: ExploAmmoExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_B_40mm_GPR_Tracer_Red";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Bo_Mk82_MI08: BombExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Bo_Mk82_MI08";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_M_Hellfire_AT: ATMissileExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_M_Hellfire_AT";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Smoke_82mm_AMOS_White: ExplosionEffects {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Smoke_82mm_AMOS_White";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_R_230mm_fly: HEShellExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_R_230mm_fly";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_M_Air_AT: ATMissileExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_M_Air_AT";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_B_40mm_GPR_Tracer_Green: ExploAmmoExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_B_40mm_GPR_Tracer_Green";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_R_TBG32V_F: MortarExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_R_TBG32V_F";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Sh_125mm_HE_T_Green: HEShellExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Sh_125mm_HE_T_Green";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_ACE_SLAMDirectionalMine_Magnetic_Ammo: DirectionalMineExplosionBig {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ACE_SLAMDirectionalMine_Magnetic_Ammo";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Bo_GBU12_LGB_MI10: BombExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Bo_GBU12_LGB_MI10";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_B_30mm_MP_Tracer_Red: ExploAmmoExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_B_30mm_MP_Tracer_Red";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Cannon_30mm_HE_Plane_CAS_02_F: ExploAmmoExplosionPlaneCAS {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Cannon_30mm_HE_Plane_CAS_02_F";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_ModuleOrdnanceRocket_F_ammo: ExplosionEffects {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ModuleOrdnanceRocket_F_ammo";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_B_40mm_GPR_Tracer_Yellow: ExploAmmoExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_B_40mm_GPR_Tracer_Yellow";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_Sh_105mm_HEAT_MP_T_Green: ATRocketExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_Sh_105mm_HEAT_MP_T_Green";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_ModuleOrdnanceRocket_F_subammo: HEShellExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ModuleOrdnanceRocket_F_subammo";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_ACE_B_35mm_ABM_Tracer_Yellow: ExploAmmoExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_ACE_B_35mm_ABM_Tracer_Yellow";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_APERSTripMine_Wire_Ammo: MineExplosion {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_APERSTripMine_Wire_Ammo";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
class ACE_ExplosionEffects_DemoCharge_Remote_Ammo_Scripted: MineNondirectionalExplosionSmall {
	class ACE_AmmoEvents {
		simulation = "particles";
		type = "ACE_Cloudlet_DemoCharge_Remote_Ammo_Scripted";
		position[] = {0,0,0};
		intensity = 1;
		interval = 0.1;
		lifeTime = 0.1;
	};
};
