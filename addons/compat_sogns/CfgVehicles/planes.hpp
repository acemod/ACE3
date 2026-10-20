// OV-10A Bronco - https://en.wikipedia.org/wiki/North_American_Rockwell_OV-10_Bronco
class Plane_Base_F;
class vnx_air_ov10a_base: Plane_Base_F {
    EGVAR(refuel,fuelCapacity) = 954;
    EGVAR(cargo,space) = 5;
};
// C-119 - https://en.wikipedia.org/wiki/Fairchild_C-119_Flying_Boxcar#Specifications_(C-119C)
class vnx_air_c119_base: Plane_Base_F {
    EGVAR(refuel,fuelCapacity) = 11000;
    EGVAR(cargo,space) = 40;
};
// AC-119K - https://aerocorner.com/aircraft/fairchild-ac-119/
class vnx_air_ac119k_base: Plane_Base_F {
    EGVAR(refuel,fuelCapacity) = 8500;
};
