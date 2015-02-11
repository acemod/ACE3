
class CfgWeapons {
    // disable locking, so it doesn't interfere with our system
    class CannonCore;
    class cannon_120mm: CannonCore {
        canLock = 0;
        ballisticsComputer = 0;
    };
    class autocannon_Base_F: CannonCore {
        canLock = 0;
        ballisticsComputer = 0;
    };
    class autocannon_35mm: CannonCore {
        canLock = 0;
        ballisticsComputer = 0;
        magazines[] += {"ACE_120Rnd_35mm_ABM_shells","ACE_120Rnd_35mm_ABM_shells_Tracer_Red","ACE_120Rnd_35mm_ABM_shells_Tracer_Green","ACE_120Rnd_35mm_ABM_shells_Tracer_Yellow"};
    };

    // fix mrco having an invisible rangefinder
    class ItemCore;
    class optic_MRCO: ItemCore {
        weaponInfoType = "RscWeaponZeroing";
    };
};
