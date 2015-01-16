
class CfgAmmo {
    class MissileBase;
    class M_Mo_120mm_AT: MissileBase {
        cost = 400000; // Stop it from aiming at FUCKING RABBITS.
        weaponLockSystem = 2;
    };

    class M_Mo_120mm_AT_LG: M_Mo_120mm_AT {
        cost = 400000;
        weaponLockSystem = 4;
    };

    class M_Mo_82mm_AT: MissileBase {
        cost = 400000;
        weaponLockSystem = 2;
    };

    class M_Mo_82mm_AT_LG: M_Mo_82mm_AT {
        cost = 400000;
        weaponLockSystem = 4;
    };
};
