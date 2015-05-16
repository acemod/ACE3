class CfgAmmo {
    // All explosive based Ammo classes. These are all listed in case they become required.
    class Default;

    class F_20mm_Red;
    class ACE_TripFlare_FlareEffect: F_20mm_Red { //pretty much ACE_F_Hand_Red from grenades (with a diff triggerTime)
        grenadeBurningSound[] = {"SmokeShellSoundLoop1",0.5,"SmokeShellSoundLoop2",0.5};
        grenadeFireSound[] = {"SmokeShellSoundHit1",0.25,"SmokeShellSoundHit2",0.25,"SmokeShellSoundHit3",0.5};
        soundTrigger[] = {"SmokeShellSoundLoop1",0.5,"SmokeShellSoundLoop2",0.5};
        SmokeShellSoundHit1[] = {"A3\Sounds_F\weapons\smokeshell\smoke_1",1.25893,1,100};
        SmokeShellSoundHit2[] = {"A3\Sounds_F\weapons\smokeshell\smoke_2",1.25893,1,100};
        SmokeShellSoundHit3[] = {"A3\Sounds_F\weapons\smokeshell\smoke_3",1.25893,1,100};
        SmokeShellSoundLoop1[] = {"A3\Sounds_F\weapons\smokeshell\smoke_loop1",0.125893,1,70};
        SmokeShellSoundLoop2[] = {"A3\Sounds_F\weapons\smokeshell\smoke_loop2",0.125893,1,70};
        timeToLive = 60;
        triggerTime = 0.1;
    };

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

    class ACE_APERSTripFlare_Wire_Ammo: APERSTripMine_Wire_Ammo {
        hit = 0.01; //Should do 0 actual damage to player
        indirectHit = 0.01;
        indirectHitRange = 1;
        model = "\A3\Weapons_F\explosives\mine_AP_tripwire";
        mineModelDisabled = "\A3\Weapons_F\explosives\mine_AP_tripwire_d";
        defaultMagazine = "ACE_APERSTripFlare_Wire_Mag";
        icon = "iconExplosiveAP";
        soundHit[] = {"A3\Sounds_F\weapons\smokeshell\smoke_3",1.25893,1,100};
        soundTrigger[] = {"",1,1};
        minimumSafeZone = 0;
        explosionAngle = 360;
        explosionEffects = "";
        CraterEffects = "";
        whistleDist = 1;
        cost = 200;
        mineTrigger = "WireTrigger";
        mineInconspicuousness = 50;
    };

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
    class IEDLandBig_Remote_Ammo: IEDUrbanBig_Remote_Ammo {
        mineTrigger = "RangeTrigger";
        triggerWhenDestroyed = 1;
        soundTrigger[] = {"A3\Sounds_F\weapons\mines\mech_trigger_1", 0.562341, 1, 40};
    };
    class IEDUrbanSmall_Remote_Ammo: PipeBombBase {
        mineTrigger = "RangeTrigger";
        triggerWhenDestroyed = 1;
        soundTrigger[] = {"A3\Sounds_F\weapons\mines\mech_trigger_1", 0.562341, 1, 40};
    };
    class IEDLandSmall_Remote_Ammo: IEDUrbanSmall_Remote_Ammo {
        mineTrigger = "RangeTrigger";
        triggerWhenDestroyed = 1;
        soundTrigger[] = {"A3\Sounds_F\weapons\mines\mech_trigger_1", 0.562341, 1, 40};
    };
};
