class CfgAmmo {
    // All explosive based Ammo classes. These are all listed in case they become required.
    class Default;

    class TimeBombCore: Default {
        GVAR(DefuseTime) = 5;
    };
    /*
    class BoundingMineCore: TimeBombCore;
    class BoundingMineBase: BoundingMineCore;
    class APERSBoundingMine_Range_Ammo: BoundingMineBase;

    class MineCore: TimeBombCore;
    class MineBase: MineCore;
    class APERSMine_Range_Ammo: MineBase;
    class ATMine_Range_Ammo: MineBase;

    class DirectionalBombCore: TimeBombCore;
    class DirectionalBombBase: DirectionalBombCore;

    class SLAMDirectionalMine_Wire_Ammo: DirectionalBombBase;

    class PipeBombCore: TimeBombCore;
    class PipeBombBase: PipeBombCore;
    */
    // GVAR(size) = 0; is small size
    // GVAR(size) = 1; is large size
    class DirectionalBombBase;
    class ClaymoreDirectionalMine_Remote_Ammo: DirectionalBombBase {
        GVAR(magazine) = "ClaymoreDirectionalMine_Remote_Mag";
        GVAR(Explosive) = "ClaymoreDirectionalMine_Remote_Ammo_Scripted";
        GVAR(size) = 0;
        GVAR(defuseObjectPosition)[] = {0, 0, 0.038};
        soundActivation[] = {"", 0, 0, 0};
        soundDeactivation[] = {"", 0, 0, 0};
    };
    // class ClaymoreDirectionalMine_Remote_Ammo_Scripted: ClaymoreDirectionalMine_Remote_Ammo {};

    class APERSTripMine_Wire_Ammo: DirectionalBombBase {
        GVAR(defuseObjectPosition)[] = {-1.415, 0, 0.12};
        GVAR(size) = 0;
    };

    class ACE_FlareTripMine_Wire_Ammo: APERSTripMine_Wire_Ammo {
        SoundSetExplosion[] = {};
        defaultMagazine = "ACE_FlareTripMine_Mag"; //Mag that gets dropped after defuse
        hit = 0;
        indirectHit = 0;
        indirectHitRange = 0;
        soundHit[] = {"A3\Sounds_F\weapons\smokeshell\smoke_3",1.25893,1,100};
        explosionEffects = "ACE_TripflareEffect";
        CraterEffects = "";
        soundTrigger[] = {"",1,1};
        class CamShakeExplode {
            power = 0;
            duration = 0;
            frequency = 0;
            distance = 0;
        };
    };

    class F_20mm_Red;
    class ACE_TripFlare_FlareEffect: F_20mm_Red {
        triggerTime = 0.1;
        GVAR(size) = 0;
    };

    // "The SLAM has an anti-tamper feature that is only active in the bottom- and side-attack modes."
    class SLAMDirectionalMine_Wire_Ammo: DirectionalBombBase {
        indirectHitRange = 20;
        GVAR(explodeOnDefuseChance) = 1;
        GVAR(magazine) = "SLAMDirectionalMine_Wire_Mag";
        GVAR(size) = 0;
    };
    class ACE_SLAMDirectionalMine_Command_Ammo: SLAMDirectionalMine_Wire_Ammo {
        mineTrigger = "RemoteTrigger";
        GVAR(explodeOnDefuseChance) = 0;
    };
    class ACE_SLAMDirectionalMine_Timer_Ammo: SLAMDirectionalMine_Wire_Ammo {
        mineTrigger = "TimeTrigger";
        GVAR(explodeOnDefuseChance) = 0;
    };
    class ACE_SLAMDirectionalMine_Magnetic_Ammo: SLAMDirectionalMine_Wire_Ammo {
        mineTrigger = "ACE_MagneticTrigger";
        GVAR(explodeOnDefuseChance) = 1;
        explosionAngle = 360;
        indirectHitRange = 1;
        mineInconspicuousness = 25;
        icon = "iconExplosiveGP";
    };

    class PipeBombBase;
    class DemoCharge_Remote_Ammo: PipeBombBase {
        GVAR(magazine) = "DemoCharge_Remote_Mag";
        GVAR(Explosive) = "DemoCharge_Remote_Ammo_Scripted"; // can probably remove as base ammo now has triggerWhenDestroyed
        GVAR(size) = 0;
        GVAR(defuseObjectPosition)[] = {0.07, 0, 0.055};
        soundActivation[] = {"", 0, 0, 0};
        soundDeactivation[] = {"", 0, 0, 0};
        hit = 500;
        indirectHit = 500;
        indirectHitRange = 7;
    };
    class SatchelCharge_Remote_Ammo: PipeBombBase {
        GVAR(magazine) = "SatchelCharge_Remote_Mag";
        GVAR(Explosive) = "SatchelCharge_Remote_Ammo_Scripted"; // can probably remove as base ammo now has triggerWhenDestroyed
        GVAR(size) = 0;
        GVAR(defuseObjectPosition)[] = {0.1, 0.1, 0.05};
        soundActivation[] = {"", 0, 0, 0};
        soundDeactivation[] = {"", 0, 0, 0};
    };
    // class DemoCharge_Remote_Ammo_Scripted: DemoCharge_Remote_Ammo {};
    // class SatchelCharge_Remote_Ammo_Scripted: SatchelCharge_Remote_Ammo {};

    class IEDUrbanBig_Remote_Ammo: PipeBombBase {
        triggerWhenDestroyed = 1;
        GVAR(explodeOnDefuseChance) = 0.02;
        GVAR(magazine) = "IEDUrbanBig_Remote_Mag";
        GVAR(size) = 1;
        soundTrigger[] = {"A3\Sounds_F\weapons\mines\mech_trigger_1", 0.8, 1, 40};
    };
    class ACE_IEDUrbanBig_Command_Ammo: IEDUrbanBig_Remote_Ammo {
        mineTrigger = "RemoteTrigger";
    };
    class ACE_IEDUrbanBig_Range_Ammo: IEDUrbanBig_Remote_Ammo {
        mineTrigger = "RangeTrigger";
    };

    class IEDUrbanSmall_Remote_Ammo: PipeBombBase {
        triggerWhenDestroyed = 1;
        GVAR(explodeOnDefuseChance) = 0.02;
        GVAR(magazine) = "IEDUrbanSmall_Remote_Mag";
        GVAR(size) = 0;
        soundTrigger[] = {"A3\Sounds_F\weapons\mines\mech_trigger_1", 0.8, 1, 40};
    };
    class ACE_IEDUrbanSmall_Command_Ammo: IEDUrbanSmall_Remote_Ammo {
        mineTrigger = "RemoteTrigger";
    };
    class ACE_IEDUrbanSmall_Range_Ammo: IEDUrbanSmall_Remote_Ammo {
        mineTrigger = "RangeTriggerShort";
    };

    class IEDLandBig_Remote_Ammo: PipeBombBase {
        triggerWhenDestroyed = 1;
        GVAR(explodeOnDefuseChance) = 0.02;
        GVAR(magazine) = "IEDLandBig_Remote_Mag";
        GVAR(size) = 1;
        soundTrigger[] = {"A3\Sounds_F\weapons\mines\mech_trigger_1", 0.8, 1, 40};
    };
    class ACE_IEDLandBig_Command_Ammo: IEDLandBig_Remote_Ammo {
        mineTrigger = "RemoteTrigger";
    };
    class ACE_IEDLandBig_Range_Ammo: IEDLandBig_Remote_Ammo {
        mineTrigger = "RangeTrigger";
    };

    class IEDLandSmall_Remote_Ammo: PipeBombBase {
        triggerWhenDestroyed = 1;
        GVAR(explodeOnDefuseChance) = 0.02;
        GVAR(magazine) = "IEDLandSmall_Remote_Mag";
        GVAR(size) = 0;
        soundTrigger[] = {"A3\Sounds_F\weapons\mines\mech_trigger_1", 0.8, 1, 40};
    };
    class ACE_IEDLandSmall_Command_Ammo: IEDLandSmall_Remote_Ammo {
        mineTrigger = "RemoteTrigger";
    };
    class ACE_IEDLandSmall_Range_Ammo: IEDLandBig_Remote_Ammo {
        mineTrigger = "RangeTriggerShort";
    };

    // Orange DLC:
    class APERSMineDispenser_Ammo: PipeBombBase {
        GVAR(magazine) = "APERSMineDispenser_Mag";
        GVAR(Explosive) = "APERSMineDispenser_Ammo_Scripted"; // triggerWhenDestroyed = 1;
        GVAR(size) = 0;
        GVAR(defuseObjectPosition)[] = {0.0, -0.05, 0.15};
    };
    class APERSMine_Range_Ammo;
    class TrainingMine_Ammo: APERSMine_Range_Ammo {
        GVAR(magazine) = "TrainingMine_Mag";
        GVAR(size) = 0;
        GVAR(defuseObjectPosition)[] = {0, 0, 0.15};
    };
    class MineBase;
    class UnderwaterMine_Range_Ammo: MineBase {
        GVAR(size) = 1;
    };
};
