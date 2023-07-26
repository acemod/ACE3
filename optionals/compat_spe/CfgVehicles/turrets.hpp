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

// --------------------------------------------------------
class ace_csw_baseTripod;

class ACE_SPE_M1_81_Stand_Deployed: ace_csw_baseTripod {
    class Eventhandlers: Eventhandlers
    {
        class SPE_Weapons_Static
        {
            init = "";
        };
    };
    author = "SPE";
    scope = 2;
    displayName = "$STR_DN_SPE_M1_81_STAND";
    model = "\WW2\SPE_Assets_m\Weapons\Mortars_m\SPE_M1_Mortar_Stand_Deployed.p3d";
    picture = "\WW2\SPE_Assets_t\Weapons\Equipment_t\Weapons\Launchers\Gear_M1_81_Stand_X_ca.paa";
    class assembleInfo
    {
        base = "";
        primary = 0;
        displayName = "";
        assembleTo = "";
        class SPE_M1_81_Barrel
        {
            deployTime = 0;
            assembleTo = "";
        };
    };
    class ACE_CSW {
        disassembleTo = "SPE_M1_81_Stand";
    };
};
class ACE_SPE_GrW278_1_Stand_Deployed: ace_csw_baseTripod {
    class Eventhandlers: Eventhandlers
    {
        class SPE_Weapons_Static
        {
            init = "";
        };
    };
    author = "SPE";
    scope = 2;
    displayName = "$STR_DN_SPE_GrW278_1_STAND";
    model = "\WW2\SPE_Assets_m\Weapons\Mortars_m\SPE_M1_Mortar_Stand_Deployed.p3d";
	picture = "\WW2\SPE_Assets_t\Weapons\Equipment_t\Weapons\Launchers\Gear_GrW278_1_Stand_X_ca.paa";
	hiddenSelectionsTextures[] = {"ww2\spe_assets_t\weapons\mortars_t\m1_mortar\Brandt_81mm_Mortar_Gelb_co.paa","WW2\SPE_Assets_t\Weapons\Mortars_t\M1_Mortar\Brandt_81mm_Sight_Gelb_co.paa"};
    class assembleInfo
    {
        base = "";
        primary = 0;
        displayName = "";
        assembleTo = "";
        class SPE_GrW278_1_Barrel
        {
            deployTime = 0;
            assembleTo = "";
        };
    };
    class ACE_CSW {
        disassembleTo = "SPE_GrW278_1_Stand";
    };
};
class ACE_SPE_MLE_27_31_Stand_Deployed: ace_csw_baseTripod {
    class Eventhandlers: Eventhandlers
    {
        class SPE_Weapons_Static
        {
            init = "";
        };
    };
    author = "SPE";
    scope = 2;
    displayName = "$STR_DN_SPE_MLE_27_31_STAND";
    model = "\WW2\SPE_Assets_m\Weapons\Mortars_m\SPE_M1_Mortar_Stand_Deployed.p3d";
    picture = "\WW2\SPE_Assets_t\Weapons\Equipment_t\Weapons\Launchers\Gear_MLE_27_31_Stand_X_ca.paa";
    hiddenSelections[] = {"camo_0","camo_1"};
	hiddenSelectionsTextures[] = {"ww2\spe_assets_t\weapons\mortars_t\m1_mortar\Brandt_81mm_Mortar_French_co.paa","WW2\SPE_Assets_t\Weapons\Mortars_t\M1_Mortar\Brandt_81mm_Sight_French_co.paa"};
    class assembleInfo
    {
        base = "";
        primary = 0;
        displayName = "";
        assembleTo = "";
        class SPE_MLE_27_31_Barrel
        {
            deployTime = 0;
            assembleTo = "";
        };
    };
    class ACE_CSW {
        disassembleTo = "SPE_MLE_27_31_Stand";
    };
};



// --- Mortars -----------------------------------------------------------------


class StaticMortar: StaticWeapon{};
class SPE_StaticMortar_base: StaticMortar {
    class Turrets: Turrets
    {
        class MainTurret: MainTurret{};
    };
};
class SPE_US_Mortar_base: SPE_StaticMortar_base
{
    side = 2;
    faction = "SPE_US_ARMY";
    crew = "SPE_US_Rifleman";
    typicalCargo[] = {"SPE_US_Rifleman"};
};
class SPE_FR_Mortar_base: SPE_StaticMortar_base
{
    side = 2;
    faction = "SPE_FR_ARMY";
    crew = "SPE_FR_Rifleman";
    typicalCargo[] = {"SPE_FR_Rifleman"};
};

//M1 81MM MORTAR
class SPE_M1_81: SPE_US_Mortar_base {
    class Turrets: Turrets
    {
        class MainTurret: MainTurret
        {
            weapons[] = {"SPE_M1_81"};
            magazines[] = {};
        };
    };
    class ACE_Actions: ACE_Actions
    {
        class ACE_MainActions: ACE_MainActions
        {
            position = "";
            selection = "gunnerview";
        };
    };
    class UserActions
    {
        delete Prepare_WP_Selected;
        delete Prepare_WP;
        delete Prepare_Smoke_Selected;
        delete Prepare_Smoke;
        delete Prepare_HE_Selected;
        delete Prepare_HE;
        delete Reload;
        delete Unload;
	};
    class assembleInfo
    {
        primary = 0;
        base = "";
        assembleTo = "";
        dissasembleTo[] = {};
        displayName = "";
        SPE_dissasembleTo[] = {};
        deployTime = 0;
    };
    class ACE_CSW {
        enabled = 1; // Enables ACE CSW for this weapon
        proxyWeapon = "SPE_M1_81_proxy"; // The proxy weapon created above
        magazineLocation = "_target selectionPosition 'usti hlavne'"; // Ammo handling interaction point location
        disassembleWeapon = "SPE_M1_81_Barrel";  // Carryable weapon created above
        disassembleTurret = "ACE_SPE_M1_81_Stand_Deployed";  // Which static tripod will appear when weapon is disassembled
        ammoLoadTime = 3;   // How long it takes in seconds to load ammo into the weapon
        ammoUnloadTime = 3; // How long it takes in seconds to unload ammo from the weapon
        desiredAmmo = 1;  // When the weapon is reloaded it will try and reload to this ammo capacity
    };
};

//81mm MLE 23/31
class SPE_MLE_27_31: SPE_FR_Mortar_base {
    class Turrets: Turrets
    {
        class MainTurret: MainTurret
        {
            weapons[] = {"SPE_MLE_27_31"};
            magazines[] = {};
        };
    };
    class ACE_Actions: ACE_Actions
    {
        class ACE_MainActions: ACE_MainActions
        {
            position = "";
            selection = "gunnerview";
        };
    };
    class UserActions
    {
        delete Prepare_Illu_Selected;
        delete Prepare_Illu;
        delete Prepare_Smoke_Selected;
        delete Prepare_Smoke;
        delete Prepare_HE_Selected;
        delete Prepare_HE;
        delete Reload;
        delete Unload;
	};
    class assembleInfo
    {
        primary = 0;
        base = "";
        assembleTo = "";
        dissasembleTo[] = {};
        displayName = "";
        SPE_dissasembleTo[] = {};
        deployTime = 0;
    };
    class ACE_CSW {
        enabled = 1; // Enables ACE CSW for this weapon
        proxyWeapon = "SPE_MLE_27_31_proxy"; // The proxy weapon created above
        magazineLocation = "_target selectionPosition 'usti hlavne'"; // Ammo handling interaction point location
        disassembleWeapon = "SPE_MLE_27_31_Barrel";  // Carryable weapon created above
        disassembleTurret = "ACE_SPE_MLE_27_31_Stand_Deployed";  // Which static tripod will appear when weapon is disassembled
        ammoLoadTime = 3;   // How long it takes in seconds to load ammo into the weapon
        ammoUnloadTime = 3; // How long it takes in seconds to unload ammo from the weapon
        desiredAmmo = 1;  // When the weapon is reloaded it will try and reload to this ammo capacity
    };
};

//81mm GrW 278/1
class SPE_GrW278_1: SPE_MLE_27_31 {
    class Turrets: Turrets
    {
        class MainTurret: MainTurret
        {
            weapons[] = {"SPE_GrW278_1"};
            magazines[] = {};
        };
    };
    class ACE_Actions: ACE_Actions
    {
        class ACE_MainActions: ACE_MainActions
        {
            position = "";
            selection = "gunnerview";
        };
    };
    class UserActions
    {
        delete Prepare_Illu_Selected;
        delete Prepare_Illu;
        delete Prepare_Smoke_Selected;
        delete Prepare_Smoke;
        delete Prepare_HE_Selected;
        delete Prepare_HE;
        delete Reload;
        delete Unload;
	};
    class assembleInfo
    {
        primary = 0;
        base = "";
        assembleTo = "";
        dissasembleTo[] = {};
        displayName = "";
        SPE_dissasembleTo[] = {};
        deployTime = 0;
    };
    class ACE_CSW {
        enabled = 1; // Enables ACE CSW for this weapon
        proxyWeapon = "SPE_M1_81_proxy"; // The proxy weapon created above
        magazineLocation = "_target selectionPosition 'usti hlavne'"; // Ammo handling interaction point location
        disassembleWeapon = "SPE_GrW278_1_Barrel";  // Carryable weapon created above
        disassembleTurret = "ACE_SPE_GrW278_1_Stand_Deployed";  // Which static tripod will appear when weapon is disassembled
        ammoLoadTime = 3;   // How long it takes in seconds to load ammo into the weapon
        ammoUnloadTime = 3; // How long it takes in seconds to unload ammo from the weapon
        desiredAmmo = 1;  // When the weapon is reloaded it will try and reload to this ammo capacity
    };
};
