// RHS specifically disables only the base vanilla 5.56 suppressor, the camo variants are untouched

class asdg_MuzzleSlot;
class asdg_MuzzleSlot_556: asdg_MuzzleSlot {
    class compatibleItems;
};
class rhs_western_rifle_muzzle_slot: asdg_MuzzleSlot_556 {
    class compatibleItems: compatibleItems {
        muzzle_snds_M = 1;
    };
};
