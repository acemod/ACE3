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

class SPE_US_Mortar_base: SPE_StaticMortar_base {};
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

class SPE_FR_Mortar_base: SPE_StaticMortar_base {};
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
