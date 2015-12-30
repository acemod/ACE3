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

    class SLAMDirectionalMine_Wire_Ammo: DirectionalBombBase;

    class PipeBombCore: TimeBombCore;
    class PipeBombBase: PipeBombCore;
    */
    class DirectionalBombBase;
    class ClaymoreDirectionalMine_Remote_Ammo: DirectionalBombBase {
        ACE_Explosive = "ClaymoreDirectionalMine_Remote_Ammo_Scripted";
        GVAR(defuseObjectPosition[]) = {0, 0, 0.038};
        soundActivation[] = {"", 0, 0, 0};
        soundDeactivation[] = {"", 0, 0, 0};
    };
    //class ClaymoreDirectionalMine_Remote_Ammo_Scripted: ClaymoreDirectionalMine_Remote_Ammo;

    class APERSTripMine_Wire_Ammo: DirectionalBombBase {
        GVAR(defuseObjectPosition[]) = {-1.415, 0, 0.12};
    };

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
        GVAR(defuseObjectPosition[]) = {0.07, 0, 0.055};
        soundActivation[] = {"", 0, 0, 0};
        soundDeactivation[] = {"", 0, 0, 0};
        hit = 500;
        indirectHit = 500;
        indirectHitRange = 7;
    };
    class SatchelCharge_Remote_Ammo: PipeBombBase {
        ACE_Explosive = "SatchelCharge_Remote_Ammo_Scripted";
        GVAR(defuseObjectPosition[]) = {0.1, 0.1, 0.05};
        soundActivation[] = {"", 0, 0, 0};
        soundDeactivation[] = {"", 0, 0, 0};
    };

    /*class DemoCharge_Remote_Ammo_Scripted: DemoCharge_Remote_Ammo;
    class SatchelCharge_Remote_Ammo_Scripted: SatchelCharge_Remote_Ammo;*/

    class IEDUrbanBig_Remote_Ammo: PipeBombBase {
        triggerWhenDestroyed = 1;
        ACE_explodeOnDefuse = 0.02;
        soundTrigger[] = {"A3\Sounds_F\weapons\mines\mech_trigger_1", 0.8, 1, 40};
    };
    class IEDUrbanBig_Command_Ammo: IEDUrbanBig_Remote_Ammo {
        mineTrigger = "RemoteTrigger";
    };
    class IEDUrbanBig_Range_Ammo: IEDUrbanBig_Remote_Ammo {
        mineTrigger = "RangeTrigger";
    };

    class IEDUrbanSmall_Remote_Ammo: PipeBombBase {
        triggerWhenDestroyed = 1;
        ACE_explodeOnDefuse = 0.02;
        soundTrigger[] = {"A3\Sounds_F\weapons\mines\mech_trigger_1", 0.8, 1, 40};
    };
    class IEDUrbanSmall_Command_Ammo: IEDUrbanSmall_Remote_Ammo {
        mineTrigger = "RemoteTrigger";
    };
    class IEDUrbanSmall_Range_Ammo: IEDUrbanSmall_Remote_Ammo {
        mineTrigger = "RangeTrigger";
    };

    class IEDLandBig_Remote_Ammo: PipeBombBase {
        triggerWhenDestroyed = 1;
        ACE_explodeOnDefuse = 0.02;
        soundTrigger[] = {"A3\Sounds_F\weapons\mines\mech_trigger_1", 0.8, 1, 40};
    };
    class IEDLandBig_Command_Ammo: IEDLandBig_Remote_Ammo {
        mineTrigger = "RemoteTrigger";
    };
    class IEDLandBig_Range_Ammo: IEDLandBig_Remote_Ammo {
        mineTrigger = "RangeTrigger";
    };

    class IEDLandSmall_Remote_Ammo: PipeBombBase {
        triggerWhenDestroyed = 1;
        ACE_explodeOnDefuse = 0.02;
        soundTrigger[] = {"A3\Sounds_F\weapons\mines\mech_trigger_1", 0.8, 1, 40};
    };
    class IEDLandSmall_Command_Ammo: IEDLandSmall_Remote_Ammo {
        mineTrigger = "RemoteTrigger";
    };
    class IEDLandSmall_Range_Ammo: IEDLandSmall_Remote_Ammo {
        mineTrigger = "RangeTrigger";
    };
};
