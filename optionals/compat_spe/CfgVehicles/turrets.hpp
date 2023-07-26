class All {
    class EventHandlers;
};
class LandVehicle;
class StaticWeapon: LandVehicle {
    class ACE_Actions {
        class ACE_MainActions;
    };
    class UserActions;
};
class StaticCannon: StaticWeapon {};
class StaticMGWeapon: StaticWeapon {
    class EventHandlers;
    class UserActions: UserActions{};
};
class SPE_StaticMGWeapon_base: StaticMGWeapon{};

// --- Static Machine Guns -----------------------------------------------------

class SPE_M1919_M2: SPE_StaticMGWeapon_base {
    class ACE_Actions: ACE_Actions {
        class ACE_MainActions: ACE_MainActions {
            position = "";
            selection = "gunnerview";
        };
    };
    class UserActions {
        delete Prepare_AP_Selected;
        delete Prepare_AP;
        delete Prepare_HeavyBall_Selected;
        delete Prepare_HeavyBall;
        delete Prepare_Ball_Selected;
        delete Prepare_Ball;
        delete Resupply;
        delete Unload;
	};
    class ACE_CSW {
        enabled = 1;
        proxyWeapon = "SPE_M1919A4_tripod_proxy";
        magazineLocation = "_target selectionPosition 'magazine'";
        disassembleWeapon = QGVAR(m1919_m2_carry);
        disassembleTurret = QEGVAR(csw,m3Tripod);
        ammoLoadTime = 7;
        ammoUnloadTime = 5;
        desiredAmmo = 100;
    };
};

class SPE_MG42_Lafette: SPE_StaticMGWeapon_base{};
class SPE_MG42_Lafette_trench: SPE_MG42_Lafette{};
class SPE_MG42_Lafette_low: SPE_MG42_Lafette_trench{};

class SPE_MG42_Lafette_low_Deployed: SPE_MG42_Lafette_low {
    class ACE_Actions: ACE_Actions {
        class ACE_MainActions: ACE_MainActions {
            position = "";
            selection = "gunnerview";
        };
    };
    class UserActions {
        delete Prepare_AP_Selected;
        delete Prepare_AP;
        delete Prepare_HeavyBall_Selected;
        delete Prepare_HeavyBall;
        delete Prepare_Ball_Selected;
        delete Prepare_Ball;
        delete Resupply;
        delete Unload;
	};
    class ACE_CSW {
        enabled = 1;
        proxyWeapon = "SPE_MG42_Tripod_proxy";
        magazineLocation = "_target selectionPosition 'magazine'";
        disassembleWeapon = "SPE_MG42";
        disassembleTurret = "ACE_SPE_MG42_Tripod_Disasm";
        ammoLoadTime = 7;
        ammoUnloadTime = 5;
        desiredAmmo = 100;
    };
};

class SPE_MG34_Lafette_low_Deployed: SPE_MG42_Lafette_low {
    class ACE_Actions: ACE_Actions {
        class ACE_MainActions: ACE_MainActions {
            position = "";
            selection = "gunnerview";
        };
    };
    class UserActions {
        delete Prepare_AP_Selected;
        delete Prepare_AP;
        delete Prepare_HeavyBall_Selected;
        delete Prepare_HeavyBall;
        delete Prepare_Ball_Selected;
        delete Prepare_Ball;
        delete Resupply;
        delete Unload;
	};
    class ACE_CSW {
        enabled = 1;
        proxyWeapon = "SPE_MG34_Tripod_proxy";
        magazineLocation = "_target selectionPosition 'magazine'";
        disassembleWeapon = "SPE_MG34";
        disassembleTurret = "ACE_SPE_MG42_Tripod_Disasm";
        ammoLoadTime = 7;
        ammoUnloadTime = 5;
        desiredAmmo = 100;
    };
};


// --- Mortars -----------------------------------------------------------------

class StaticMortar: StaticWeapon{};
class SPE_StaticMortar_base: StaticMortar {
    class Turrets: Turrets {
        class MainTurret: MainTurret{};
    };
    class EventHandlers: EventHandlers {
        class SPE_StaticWeaponsHandler {
            init = "";
        };
    };
};
class SPE_US_Mortar_base: SPE_StaticMortar_base {
    side = 2;
    faction = "SPE_US_ARMY";
    crew = "SPE_US_Rifleman";
    typicalCargo[] = {"SPE_US_Rifleman"};
};
class SPE_FR_Mortar_base: SPE_StaticMortar_base {
    side = 2;
    faction = "SPE_FR_ARMY";
    crew = "SPE_FR_Rifleman";
    typicalCargo[] = {"SPE_FR_Rifleman"};
};

class SPE_M1_81: SPE_US_Mortar_base {
    class Turrets: Turrets {
        class MainTurret: MainTurret {
            magazines[] = {};
        };
    };
    class ACE_Actions: ACE_Actions {
        class ACE_MainActions: ACE_MainActions {
            position = "";
            selection = "zamerny";
        };
    };
    class UserActions {
        delete Prepare_WP_Selected;
        delete Prepare_WP;
        delete Prepare_Smoke_Selected;
        delete Prepare_Smoke;
        delete Prepare_HE_Selected;
        delete Prepare_HE;
        delete Reload;
        delete Unload;
	};
    class ACE_CSW {
        enabled = 1;
        proxyWeapon = "SPE_M1_81_proxy";
        magazineLocation = "_target selectionPosition 'usti hlavne'";
        disassembleWeapon = "SPE_M1_81_Barrel";
        disassembleTurret = QGVAR(M1_81_baseplate);
        ammoLoadTime = 3;
        ammoUnloadTime = 3;
        desiredAmmo = 1;
    };
};

class SPE_MLE_27_31: SPE_FR_Mortar_base {
    class Turrets: Turrets {
        class MainTurret: MainTurret {
            magazines[] = {};
        };
    };
    class ACE_Actions: ACE_Actions {
        class ACE_MainActions: ACE_MainActions {
            position = "";
            selection = "zamerny";
        };
    };
    class UserActions {
        delete Prepare_Illu_Selected;
        delete Prepare_Illu;
        delete Prepare_Smoke_Selected;
        delete Prepare_Smoke;
        delete Prepare_HE_Selected;
        delete Prepare_HE;
        delete Reload;
        delete Unload;
	};
    class ACE_CSW {
        enabled = 1;
        proxyWeapon = "SPE_MLE_27_31_proxy";
        magazineLocation = "_target selectionPosition 'usti hlavne'";
        disassembleWeapon = "SPE_MLE_27_31_Barrel";
        disassembleTurret = QGVAR(MLE_27_31_baseplate);
        ammoLoadTime = 3;
        ammoUnloadTime = 3;
        desiredAmmo = 1;
    };
};

class SPE_GrW278_1: SPE_MLE_27_31 {
    class Turrets: Turrets {
        class MainTurret: MainTurret {
            magazines[] = {};
        };
    };
    class ACE_Actions: ACE_Actions {
        class ACE_MainActions: ACE_MainActions {
            position = "";
            selection = "zamerny";
        };
    };
    class UserActions {
        delete Prepare_Illu_Selected;
        delete Prepare_Illu;
        delete Prepare_Smoke_Selected;
        delete Prepare_Smoke;
        delete Prepare_HE_Selected;
        delete Prepare_HE;
        delete Reload;
        delete Unload;
	};
    class ACE_CSW {
        enabled = 1;
        proxyWeapon = "SPE_GrW278_1_proxy";
        magazineLocation = "_target selectionPosition 'usti hlavne'";
        disassembleWeapon = "SPE_GrW278_1_Barrel";
        disassembleTurret = QGVAR(GrW278_baseplate);
        ammoLoadTime = 3;
        ammoUnloadTime = 3;
        desiredAmmo = 1;
    };
};
