// M39 / M54 / M49
class vn_wheeled_truck_base;
class vn_wheeled_m54_base: vn_wheeled_truck_base {
    EGVAR(refuel,fuelCapacity) = 189;
};
class vn_wheeled_m54_cab_base;
class vn_wheeled_m54_fuel_base: vn_wheeled_m54_cab_base {
    transportFuel = 0;
    EGVAR(refuel,hooks)[] = {{-1.15, -2.3, 0.28}};
    EGVAR(refuel,fuelCargo) = 4542;
};
class vn_wheeled_m54_03_base;
class vn_wheeled_m54_repair_base: vn_wheeled_m54_03_base {
    transportRepair = 0;
    EGVAR(repair,canRepair) = 1;
};
class vn_wheeled_m54_01_base;
class vn_wheeled_m54_ammo_base: vn_wheeled_m54_01_base {
    transportAmmo = 0;
    EGVAR(rearm,defaultSupply) = 1200;
};

// M151
class vn_wheeled_car_base;
class vn_wheeled_m151_base: vn_wheeled_car_base {
    EGVAR(refuel,fuelCapacity) = 65;
};

// ZIL-157
class vn_wheeled_z157_base: vn_wheeled_truck_base {
    EGVAR(refuel,fuelCapacity) = 150;
};
class vn_wheeled_z157_fuel_base: vn_wheeled_z157_base {
    transportFuel = 0;
    EGVAR(refuel,hooks)[] = {{-1.36, -3.575, -0.4}};
    EGVAR(refuel,fuelCargo) = 4000;
};
class vn_wheeled_z157_repair_base: vn_wheeled_z157_base {
    transportRepair = 0;
    EGVAR(repair,canRepair) = 1;
};
class vn_wheeled_z157_01_base;
class vn_wheeled_z157_ammo_base: vn_wheeled_z157_01_base {
    transportAmmo = 0;
    EGVAR(rearm,defaultSupply) = 1200;
};

// BTR-40
class vn_wheeled_btr40_base: vn_wheeled_car_base {
    EGVAR(refuel,fuelCapacity) = 122;
};



// cws vehicles
class vn_wheeled_m151_mg_02_base: vn_wheeled_m151_base {
    class ACE_CSW {
        enabled = 1;
        proxyWeapon = "vn_m2_v_01";  
        magazineLocation = "";  // will be on the vehicle interaction menu
        desiredAmmo = 100;     
        ammoLoadTime = 7;       
        ammoUnloadTime = 5;
    };
};

class vn_wheeled_m151_mg_03_base: vn_wheeled_m151_base {
    class ACE_CSW {
        enabled = 1;
        proxyWeapon = "vn_m2_v_01";  
        magazineLocation = "";  // will be on the vehicle interaction menu
        desiredAmmo = 100;     
        ammoLoadTime = 7;       
        ammoUnloadTime = 5;
    };
};

class vn_wheeled_m151_mg_04_base: vn_wheeled_m151_base {
    class ACE_CSW {
        enabled = 1;
        proxyWeapon = "vn_m60_v_02";  
        magazineLocation = "";  // will be on the vehicle interaction menu
        desiredAmmo = 100;     
        ammoLoadTime = 7;       
        ammoUnloadTime = 5;
    };
};

class vn_wheeled_m151_mg_01_base: vn_wheeled_m151_base {
    class ACE_CSW {
        enabled = 1;
        proxyWeapon = "vn_m1919_v_03";  
        magazineLocation = "";  // will be on the vehicle interaction menu
        desiredAmmo = 100;     
        ammoLoadTime = 7;       
        ammoUnloadTime = 5;
    };
};

class vn_wheeled_m151_mg_05_base: vn_wheeled_m151_base {
    class ACE_CSW {
        enabled = 1;
        proxyWeapon = "vn_missile_tow_launcher";  
        magazineLocation = "";  // will be on the vehicle interaction menu
        desiredAmmo = 1;     
        ammoLoadTime = 7;       
        ammoUnloadTime = 5;
    };
};

class vn_wheeled_m151_mg_06_base: vn_wheeled_m151_base {
    class ACE_CSW {
        enabled = 1;
        proxyWeapon = "vn_static_m40a1rr_v_01";  
        magazineLocation = "";  // will be on the vehicle interaction menu
        desiredAmmo = 8;     
        ammoLoadTime = 7;       
        ammoUnloadTime = 5;
    };
};

class vn_wheeled_btr40_mg_01_base: vn_wheeled_btr40_base {
    class ACE_CSW {
        enabled = 1;
        proxyWeapon = "vn_rpd_v_01";  
        magazineLocation = "";  // will be on the vehicle interaction menu
        desiredAmmo = 100;     
        ammoLoadTime = 10;       
        ammoUnloadTime = 8;
    };
};

class vn_wheeled_btr40_mg_02_base: vn_wheeled_btr40_base {
    class ACE_CSW {
        enabled = 1;
        proxyWeapon = "vn_dshkm_v_01";  
        magazineLocation = "";  // will be on the vehicle interaction menu
        desiredAmmo = 100;     
        ammoLoadTime = 10;       
        ammoUnloadTime = 8;
    };
};

class vn_wheeled_btr40_mg_03_base: vn_wheeled_btr40_base {
    class ACE_CSW {
        enabled = 1;
        proxyWeapon = "vn_zpu4_v_quad";  
        magazineLocation = "";  // will be on the vehicle interaction menu
        desiredAmmo = 4800;     
        ammoLoadTime = 20;       
        ammoUnloadTime = 10;
    };
};

// trucks
class vn_wheeled_m54_mg_02_base: vn_wheeled_m54_base {
    class ACE_CSW {
        enabled = 1;
        proxyWeapon = "vn_m2_v_quad";  
        magazineLocation = "";  // will be on the vehicle interaction menu
        desiredAmmo = 800;     
        ammoLoadTime = 7;       
        ammoUnloadTime = 5;
    };
};

class vn_wheeled_m54_mg_01_base: vn_wheeled_m54_base {
    class ACE_CSW {
        enabled = 1;
        proxyWeapon = "vn_m2_v_01";  
        magazineLocation = "";  // will be on the vehicle interaction menu
        desiredAmmo = 800;     
        ammoLoadTime = 7;       
        ammoUnloadTime = 5;
    };
};

class vn_wheeled_m54_mg_03_base: vn_wheeled_m54_mg_01_base {
    class ACE_CSW {
        enabled = 1;
        proxyWeapon = "vn_m134_v_01";  
        magazineLocation = "";  // will be on the vehicle interaction menu
        desiredAmmo = 2000;     
        ammoLoadTime = 7;       
        ammoUnloadTime = 5;
    };
};

class vn_wheeled_z157_mg_01_base: vn_wheeled_z157_base {
    class ACE_CSW {
        enabled = 1;
        proxyWeapon = "vn_dshkm_v_01";  
        magazineLocation = "";  // will be on the vehicle interaction menu
        desiredAmmo = 100;     
        ammoLoadTime = 7;       
        ammoUnloadTime = 5;
    };
};

class vn_wheeled_z157_mg_02_base: vn_wheeled_z157_base {
    class ACE_CSW {
        enabled = 1;
        proxyWeapon = "vn_zpu4_v_quad";  
        magazineLocation = "";  // will be on the vehicle interaction menu
        desiredAmmo = 4800;     
        ammoLoadTime = 20;       
        ammoUnloadTime = 10;
    };
};
