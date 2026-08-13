class CfgAmmo {
    // GVAR(defuseTime) is the defuse time (default of 5 in ace_explosives_fnc_startDefuse)
    // GVAR(size) = 0; is small size
    // GVAR(size) = 1; is large size
    class ClaymoreDirectionalMine_Remote_Ammo;
    class ACE_ClaymoreDirectionalMine_Remote_Ammo: ClaymoreDirectionalMine_Remote_Ammo { // Wrapper class to avoid unintentional changes to third-party mods. Ref #10105
        GVAR(magazine) = "ClaymoreDirectionalMine_Remote_Mag";
        GVAR(size) = 0;
        GVAR(defuseObjectPosition)[] = {0, 0, 0.038};
        soundActivation[] = {"", 0, 0, 0};
        soundDeactivation[] = {"", 0, 0, 0};

        // Reduce vanilla damage, so that it doesn't destroy buildings
        hit = 10;
        indirectHit = 10;
    };

    class DirectionalBombBase;
    class APERSTripMine_Wire_Ammo: DirectionalBombBase {
        GVAR(defuseObjectPosition)[] = {-1.415, 0, 0.12};
        GVAR(size) = 0;
    };

    class APERSBoundingMine_Range_Ammo;
    class ACE_APERSBoundingMine_Range_Ammo: APERSBoundingMine_Range_Ammo {
        // Reduce vanilla damage, so that it doesn't destroy buildings
        hit = 10;
        indirectHit = 10;
        CraterEffects = "MineCrater";
    };

    class ACE_FlareTripMine_Wire_Ammo: APERSTripMine_Wire_Ammo {
        GVAR(flareClass) = "F_40mm_White";
        SoundSetExplosion[] = {};
        defaultMagazine = "ACE_FlareTripMine_Mag"; // Mag that gets dropped after defuse
        hit = 0;
        indirectHit = 0;
        indirectHitRange = 0;
        soundHit[] = {"A3\Sounds_F\weapons\smokeshell\smoke_3",1.25893,1,100};
        explosionEffects = "";
        CraterEffects = "";
        soundTrigger[] = {"",1,1};
        class CamShakeExplode {
            power = 0;
            duration = 0;
            frequency = 0;
            distance = 0;
        };
        class EventHandlers {
            init = QUOTE(call FUNC(tripflare_init));
        };
    };
    class ACE_FlareTripMine_Wire_Ammo_Red: ACE_FlareTripMine_Wire_Ammo {
        defaultMagazine = "ACE_FlareTripMine_Mag_Red";
        GVAR(flareClass) = "F_40mm_Red";
    };
    class ACE_FlareTripMine_Wire_Ammo_Green: ACE_FlareTripMine_Wire_Ammo {
        defaultMagazine = "ACE_FlareTripMine_Mag_Green";
        GVAR(flareClass) = "F_40mm_Green";
    };

    class F_20mm_Red;
    class ACE_TripFlare_FlareEffect: F_20mm_Red {
        triggerTime = 0.1;
        GVAR(size) = 0;
    };

    // More sensitive pressure-fuse for the Vanilla AT Mine
    class MineBase;
    class ATMine_Range_Ammo: MineBase {
        mineTrigger = "ACE_TankTriggerLight";
    };

    // "The SLAM has an anti-tamper feature that is only active in the bottom- and side-attack modes."
    class SLAMDirectionalMine_Wire_Ammo: DirectionalBombBase {
        indirectHitRange = 20;
        explosionAngle = 60;
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
        explosionAngle = 60;
        hit = 3000;
        indirectHit = 3000;
        indirectHitRange = 10;
        mineInconspicuousness = 25;
        icon = "iconExplosiveGP";
    };

    class DemoCharge_Remote_Ammo;
    class ACE_DemoCharge_Remote_Ammo: DemoCharge_Remote_Ammo {
        GVAR(magazine) = "DemoCharge_Remote_Mag";
        GVAR(size) = 0;
        GVAR(defuseObjectPosition)[] = {0.07, 0, 0.055};
        soundActivation[] = {"", 0, 0, 0};
        soundDeactivation[] = {"", 0, 0, 0};
        hit = 500;
        indirectHit = 500;
        indirectHitRange = 7;
    };

    class PipeBombBase;
    class SatchelCharge_Remote_Ammo: PipeBombBase {
        GVAR(magazine) = "SatchelCharge_Remote_Mag";
        GVAR(size) = 0;
        GVAR(defuseObjectPosition)[] = {0.1, 0.1, 0.05};
        soundActivation[] = {"", 0, 0, 0};
        soundDeactivation[] = {"", 0, 0, 0};
    };

    class IEDUrbanBig_Remote_Ammo: PipeBombBase {
        triggerWhenDestroyed = 1;
        GVAR(explodeOnDefuseChance) = 0.02;
        GVAR(magazine) = "IEDUrbanBig_Remote_Mag";
        GVAR(size) = 1;
        soundTrigger[] = {"A3\Sounds_F\weapons\mines\mech_trigger_1", 0.8, 1, 40};
        GVAR(ringtones)[] = {{QPATHTOF(Data\Audio\Cellphone_Ring.wss), 0.75, 3.15, 1, 75}};
        GVAR(callConnectTime)[] = {1, 8};
        GVAR(detonationTimingOffset) = 0.75;
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
        GVAR(ringtones)[] = {{QPATHTOF(Data\Audio\Cellphone_Ring.wss), 0.75, 3.15, 1, 75}};
        GVAR(callConnectTime)[] = {1, 8};
        GVAR(detonationTimingOffset) = 0.75;
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
        GVAR(ringtones)[] = {{QPATHTOF(Data\Audio\Cellphone_Ring.wss), 0.75, 3.15, 1, 75}};
        GVAR(callConnectTime)[] = {1, 8};
        GVAR(detonationTimingOffset) = 0.75;
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
        GVAR(ringtones)[] = {{QPATHTOF(Data\Audio\Cellphone_Ring.wss), 0.75, 3.15, 1, 75}};
        GVAR(callConnectTime)[] = {1, 8};
        GVAR(detonationTimingOffset) = 0.75;
    };
    class ACE_IEDLandSmall_Command_Ammo: IEDLandSmall_Remote_Ammo {
        mineTrigger = "RemoteTrigger";
    };
    class ACE_IEDLandSmall_Range_Ammo: IEDLandSmall_Remote_Ammo {
        mineTrigger = "RangeTriggerShort";
    };

    // Orange DLC
    class APERSMineDispenser_Ammo: PipeBombBase {
        GVAR(magazine) = "APERSMineDispenser_Mag";
        GVAR(size) = 0;
        GVAR(defuseObjectPosition)[] = {0.0, -0.05, 0.15};
    };
    class APERSMine_Range_Ammo;
    class ACE_APERSMine_ToePopper_Ammo: APERSMine_Range_Ammo {
        ACE_damageType = QGVAR(toePopper);
    };
    class TrainingMine_Ammo: APERSMine_Range_Ammo {
        GVAR(magazine) = "TrainingMine_Mag";
        GVAR(size) = 0;
        GVAR(defuseObjectPosition)[] = {0, 0, 0.15};
    };
    class UnderwaterMine_Range_Ammo: MineBase {
        GVAR(size) = 1;
    };
};
