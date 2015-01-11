class CfgAmmo {
	// All explosive based Ammo classes. Theses are all listed in case they are required.
	class Default;
	
	class TimeBombCore:Default {
		AGM_DefuseTime = 5;
	};
	/*
	class BoundingMineCore:TimeBombCore;
	class BoundingMineBase:BoundingMineCore;
	class APERSBoundingMine_Range_Ammo:BoundingMineBase;
	
	class MineCore: TimeBombCore;
	class MineBase:MineCore;
	class APERSMine_Range_Ammo:MineBase;
	class ATMine_Range_Ammo:MineBase;
	
	class UnderwaterMine_Range_Ammo:MineBase;
	class UnderwaterMineAB_Range_Ammo:UnderwaterMine_Range_Ammo;
	class UnderwaterMinePDM_Range_Ammo:UnderwaterMine_Range_Ammo;
	
	class DirectionalBombCore:TimeBombCore;
	class DirectionalBombBase:DirectionalBombCore;
	class APERSTripMine_Wire_Ammo:DirectionalBombBase;
	
	class SLAMDirectionalMine_Wire_Ammo:DirectionalBombBase;
	
	class PipeBombCore: TimeBombCore;
	class PipeBombBase:PipeBombCore;
	*/
	class DirectionalBombBase;
	class ClaymoreDirectionalMine_Remote_Ammo:DirectionalBombBase{
		AGM_Explosive = "ClaymoreDirectionalMine_Remote_Ammo_Scripted";
		soundActivation[] = {"",0,0,0};
		soundDeactivation[] = {"",0,0,0};
	};
	//class ClaymoreDirectionalMine_Remote_Ammo_Scripted:ClaymoreDirectionalMine_Remote_Ammo;
	
	class SLAMDirectionalMine_Wire_Ammo:DirectionalBombBase{
		indirectHitRange = 20;
		AGM_explodeOnDefuse = 1;
	};
	class SLAMDirectionalMine_Command_Ammo:SLAMDirectionalMine_Wire_Ammo {
		mineTrigger = "RemoteTrigger";
		AGM_explodeOnDefuse = 0;
	};
	class SLAMDirectionalMine_Timer_Ammo:SLAMDirectionalMine_Wire_Ammo {
		mineTrigger = "TimeTrigger";
		AGM_explodeOnDefuse = 0;
	};
	class SLAMDirectionalMine_Magnetic_Ammo:SLAMDirectionalMine_Wire_Ammo {
		mineTrigger = "MagneticTrigger";
	};
	
	class PipeBombBase;
	class DemoCharge_Remote_Ammo:PipeBombBase{
		AGM_Explosive = "DemoCharge_Remote_Ammo_Scripted";
		soundActivation[] = {"",0,0,0};
		soundDeactivation[] = {"",0,0,0};
    hit = 500;
    indirectHit = 500;
    indirectHitRange = 7;
	};
	//class DemoCharge_Remote_Ammo_Scripted:DemoCharge_Remote_Ammo;
	class SatchelCharge_Remote_Ammo:PipeBombBase{
		AGM_Explosive = "SatchelCharge_Remote_Ammo_Scripted";
		soundActivation[] = {"",0,0,0};
		soundDeactivation[] = {"",0,0,0};
	};
	/*class SatchelCharge_Remote_Ammo_Scripted:SatchelCharge_Remote_Ammo;
	
	class IEDLandBig_Remote_Ammo:PipeBombBase{
		triggerWhenDestroyed = 1;
	};
	class IEDLandSmall_Remote_Ammo:PipeBombBase{
		triggerWhenDestroyed = 1;
	};
	class IEDUrbanBig_Remote_Ammo:PipeBombBase{
		triggerWhenDestroyed = 1;
	};
	class IEDUrbanSmall_Remote_Ammo:PipeBombBase{
		triggerWhenDestroyed = 1;
	};*/
};
