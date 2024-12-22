class CfgWeapons {
    class HMG_01;
    class HMG_static: HMG_01 {
        type = 1; // makes it possible to swap to the fullest magazine
    };

    class GMG_F;
    class GMG_20mm: GMG_F {
        type = 1;
    };

    class CannonCore;
    class mortar_82mm: CannonCore {
        type = 1;
    };
};
