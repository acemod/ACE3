// UH-1C - https://en.wikipedia.org/wiki/Bell_UH-1_Iroquois
class vn_helicopter_base;
class vn_air_uh1_01_base: vn_helicopter_base {
    EGVAR(refuel,fuelCapacity) = 916;
};

// UH-1B - https://www.skytamer.com/Bell_H-1B(UH).html
class vn_air_uh1c_01_base;
class vn_air_uh1c_doorguns_base;
class vn_air_uh1c_07_base: vn_air_uh1c_doorguns_base {
    EGVAR(refuel,fuelCapacity) = 625;
};

// UH-1D - http://www.aviastar.org/helicopters_eng/bell_uh-1.php
class vn_air_uh1d_base: vn_air_uh1_01_base {
    EGVAR(refuel,fuelCapacity) = 832;
};

// UH-1P - based on the F variant which is based on the B variant
// Capacity might be wrong
class vn_air_uh1c_03_base: vn_air_uh1c_01_base {
    EGVAR(refuel,fuelCapacity) = 625;
};

// UH-34D - https://www.easa.europa.eu/sites/default/files/dfu/TCDS_EASA_IM_R109_S58_Issue_02.pdf
class vn_air_ch34_01_base: vn_helicopter_base {
    EGVAR(refuel,fuelCapacity) = 962;
};

// OH-6 - https://en.wikipedia.org/wiki/MD_Helicopters_MH-6_Little_Bird
class vn_air_oh6a_base: vn_helicopter_base {
    EGVAR(refuel,fuelCapacity) = 242;
};

// AH-1G - http://all-aero.com/index.php/35-helicopters/copters/1479-bell-209-ah-1-249
class vn_air_ah1g_01_base: vn_helicopter_base {
    EGVAR(refuel,fuelCapacity) = 980;
};

// Mi-2 - https://fas.org/man/dod-101/sys/ac/row/mi-2.htm
class vn_air_mi2_base: vn_helicopter_base {
    EGVAR(refuel,fuelCapacity) = 600;
};
