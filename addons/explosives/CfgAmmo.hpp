class CfgAmmo {
    // All explosive based Ammo classes. These are all listed in case they become required.
    class Default;

    class TimeBombCore: Default {
        ACE_DefuseTime = 5;
    };
    /*
    class BoundingMineCore: TimeBombCore;
    class BoundingMineBase: BoundingMineCore;
    class APERSBoundingMine_Range_Ammo: BoundingMineBase;

    class MineCore: TimeBombCore;
    class MineBase: MineCore;
    class APERSMine_Range_Ammo: MineBase;
    class ATMine_Range_Ammo: MineBase;

    class UnderwaterMine_Range_Ammo: MineBase;
    class UnderwaterMineAB_Range_Ammo: UnderwaterMine_Range_Ammo;
    class UnderwaterMinePDM_Range_Ammo: UnderwaterMine_Range_Ammo;

    class DirectionalBombCore: TimeBombCore;
    class DirectionalBombBase: DirectionalBombCore;
    class APERSTripMine_Wire_Ammo: DirectionalBombBase;

    class SLAMDirectionalMine_Wire_Ammo: DirectionalBombBase;

    class PipeBombCore: TimeBombCore;
    class PipeBombBase: PipeBombCore;
    */
    class DirectionalBombBase;
    class ClaymoreDirectionalMine_Remote_Ammo: DirectionalBombBase {
        ACE_Explosive = "ClaymoreDirectionalMine_Remote_Ammo_Scripted";
        soundActivation[] = {"", 0, 0, 0};
        soundDeactivation[] = {"", 0, 0, 0};
    };
    //class ClaymoreDirectionalMine_Remote_Ammo_Scripted: ClaymoreDirectionalMine_Remote_Ammo;

    class SLAMDirectionalMine_Wire_Ammo: DirectionalBombBase {
        indirectHitRange = 20;
        ACE_explodeOnDefuse = 1;
    };
    class SLAMDirectionalMine_Command_Ammo: SLAMDirectionalMine_Wire_Ammo {
        mineTrigger = "RemoteTrigger";
        ACE_explodeOnDefuse = 0;
    };
    class SLAMDirectionalMine_Timer_Ammo: SLAMDirectionalMine_Wire_Ammo {
        mineTrigger = "TimeTrigger";
        ACE_explodeOnDefuse = 0;
    };
    class SLAMDirectionalMine_Magnetic_Ammo: SLAMDirectionalMine_Wire_Ammo {
        mineTrigger = "MagneticTrigger";
    };

    class PipeBombBase;
    class DemoCharge_Remote_Ammo: PipeBombBase {
        ACE_Explosive = "DemoCharge_Remote_Ammo_Scripted";
        soundActivation[] = {"", 0, 0, 0};
        soundDeactivation[] = {"", 0, 0, 0};
        hit = 500;
        indirectHit = 500;
        indirectHitRange = 7;
    };
    class SatchelCharge_Remote_Ammo: PipeBombBase {
        ACE_Explosive = "SatchelCharge_Remote_Ammo_Scripted";
        soundActivation[] = {"", 0, 0, 0};
        soundDeactivation[] = {"", 0, 0, 0};
    };
    
    /*class DemoCharge_Remote_Ammo_Scripted: DemoCharge_Remote_Ammo;
    class SatchelCharge_Remote_Ammo_Scripted: SatchelCharge_Remote_Ammo;*/

    class IEDUrbanBig_Remote_Ammo: PipeBombBase {
        mineTrigger = "RangeTrigger";
        triggerWhenDestroyed = 1;
        soundTrigger[] = {"A3\Sounds_F\weapons\mines\mech_trigger_1", 0.562341, 1, 40};
    };
    class IEDLandBig_Remote_Ammo: PipeBombBase {
        mineTrigger = "RangeTrigger";
        triggerWhenDestroyed = 1;
        soundTrigger[] = {"A3\Sounds_F\weapons\mines\mech_trigger_1", 0.562341, 1, 40};
    };
    class IEDUrbanSmall_Remote_Ammo: PipeBombBase {
        mineTrigger = "RangeTrigger";
        triggerWhenDestroyed = 1;
        soundTrigger[] = {"A3\Sounds_F\weapons\mines\mech_trigger_1", 0.562341, 1, 40};
    };
    class IEDLandSmall_Remote_Ammo: PipeBombBase {
        mineTrigger = "RangeTrigger";
        triggerWhenDestroyed = 1;
        soundTrigger[] = {"A3\Sounds_F\weapons\mines\mech_trigger_1", 0.562341, 1, 40};
    };
};
