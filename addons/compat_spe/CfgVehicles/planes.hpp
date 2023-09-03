class Plane_Base_F;
class SPE_Plane_base: Plane_Base_F {
    EGVAR(refuel,canReceive) = 1;
    EGVAR(cargo,hasCargo) = 1;
    EGVAR(cargo,space) = 4;
};

// ALLIED FORCES
class SPE_US_Plane_base: SPE_Plane_base {};
class SPE_P47: SPE_US_Plane_base {
    EGVAR(refuel,fuelCapacity) = 1155;
};

// AXIS FORCES
class SPE_GER_Plane_base: SPE_Plane_base {};
class SPE_FW190F8: SPE_GER_Plane_base {
    EGVAR(refuel,fuelCapacity) = 639;
};
