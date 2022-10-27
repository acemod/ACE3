// F-4 - https://en.wikipedia.org/wiki/McDonnell_Douglas_F-4_Phantom_II
class Plane_Base_F;
class vn_air_f4_base: Plane_Base_F {
    EGVAR(refuel,fuelCapacity) = 7548;
};

// F-100D https://www.supersabre.com/f-100specs.htm
class vn_air_f100d_base : Plane_Base_F {
    EGVAR(refuel,fuelCapacity) = 4500;
};

// MIG-19S https://en.wikipedia.org/wiki/Mikoyan-Gurevich_MiG-19#cite_ref-60
class vn_air_mig19_base : Plane_Base_F {
    EGVAR(refuel,fuelCapacity) = 1800;
};
