
class CfgWeapons {
    class CannonCore;
    class autocannon_35mm: CannonCore {
        canLock = 0;
        ballisticsComputer = 4; //was "4 + 2", 2 is for manual zeroing, 4 is for the lead indicator - https://community.bistudio.com/wiki/A3_Locking_Review#ballisticsComputer
        magazines[] += {"ACE_120Rnd_35mm_ABM_shells","ACE_120Rnd_35mm_ABM_shells_Tracer_Red","ACE_120Rnd_35mm_ABM_shells_Tracer_Green","ACE_120Rnd_35mm_ABM_shells_Tracer_Yellow"};
    };

    // fix mrco having an invisible rangefinder
    class ItemCore;
    class optic_MRCO: ItemCore {
        weaponInfoType = "RscWeaponZeroing";
    };
};
