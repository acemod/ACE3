// PTF Nasty https://www.ptfnasty.com/ptf17chap2.html (610 Gallons)
class vn_boat_armed_base;
class vn_boat_05_base: vn_boat_armed_base {
    EGVAR(refuel,fuelCapacity) = 2773;
};

// PBR https://www.warboats.org/pbr.htm
class vn_boat_12_base: vn_boat_armed_base {
    EGVAR(refuel,fuelCapacity) = 727;
};

// STAB https://www.powercatboat.com/STAB/STAB.html
class vn_boat_09_base: vn_boat_armed_base {
    EGVAR(refuel,fuelCapacity) = 464;
};

// Type 55A Shantou Gunboat (Could find no info on this, so same as the similarly sized PTF for now)
class vn_boat_03_base: vn_boat_armed_base {
    EGVAR(refuel,fuelCapacity) = 2773;
};
