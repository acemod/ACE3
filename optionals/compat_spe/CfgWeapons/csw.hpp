class Launcher;
class Launcher_Base_F: Launcher {
    class WeaponSlotsInfo;
};

class SPE_Slung_Static_Weapon_Base: Launcher_Base_F{};

class SPE_M1919A4_tripod;
class SPE_M1919A4_tripod_proxy: SPE_M1919A4_tripod {
    magazineReloadTime = 0.5;
};

class SPE_MG34_Tripod;
class SPE_MG34_Tripod_proxy: SPE_MG34_Tripod {
    magazineReloadTime = 0.5;
};

class SPE_MG42_Tripod;
class SPE_MG42_Tripod_proxy: SPE_MG42_Tripod {
    magazineReloadTime = 0.5;
};

class SPE_Lafette_Tripod: SPE_Slung_Static_Weapon_Base {
    SPE_isTripod = 0;
    SPE_Deployed_Tripod_Name = "";
    class ACE_CSW {
        type = "mount"; // Use "mount" for tripods
        deployTime = 4; // How long it takes to deploy the tripod
        pickupTime = 4; // How long it takes to disassemble the tripod
        deploy = "ACE_SPE_MG42_Tripod_Disasm"; // what vehicle will spawn when the tripod is deployed
    };
};


class SPE_M1_81;
class SPE_M1_81_proxy: SPE_M1_81 {
    magazineReloadTime = 0.5;
};

class SPE_M1_81_Stand: SPE_Slung_Static_Weapon_Base {
    SPE_isTripod = 0;
    SPE_Deployed_Tripod_Name = "";
    class ACE_CSW {
        type = "mount"; // Use "mount" for tripods
        deployTime = 4; // How long it takes to deploy the tripod
        pickupTime = 4; // How long it takes to disassemble the tripod
        deploy = "ACE_SPE_M1_81_Stand_Deployed"; // what vehicle will spawn when the tripod is deployed
    };
};
class SPE_M1_81_Barrel: SPE_Slung_Static_Weapon_Base {
    class ACE_CSW {
        type = "weapon";
        deployTime = 4;
        pickupTime = 4;
        class assembleTo {
            ACE_SPE_M1_81_Stand_Deployed = "SPE_M1_81";
        };
    };
};

class SPE_MLE_27_31;
class SPE_MLE_27_31_proxy: SPE_MLE_27_31 {
    magazineReloadTime = 0.5;
};

class SPE_MLE_27_31_Stand: SPE_Slung_Static_Weapon_Base {
    SPE_isTripod = 0;
    class ACE_CSW {
        type = "mount"; // Use "mount" for tripods
        deployTime = 4; // How long it takes to deploy the tripod
        pickupTime = 4; // How long it takes to disassemble the tripod
        deploy = "ACE_SPE_MLE_27_31_Stand_Deployed"; // what vehicle will spawn when the tripod is deployed
    };
};
class SPE_MLE_27_31_Barrel: SPE_Slung_Static_Weapon_Base {
    class ACE_CSW {
        type = "weapon";
        deployTime = 4;
        pickupTime = 4;
        class assembleTo {
            ACE_SPE_MLE_27_31_Stand_Deployed = "SPE_MLE_27_31";
        };
    };
};

class SPE_GrW278_1;
class SPE_GrW278_1_proxy: SPE_GrW278_1 {
    magazineReloadTime = 0.5;
};

class SPE_GrW278_1_Stand: SPE_MLE_27_31_Stand {
    author = "SPE";
    dlc = "SPE";
    displayName = "$STR_DN_SPE_GrW278_1_STAND";
    picture = "\WW2\SPE_Assets_t\Weapons\Equipment_t\Weapons\Launchers\Gear_GrW278_1_Stand_X_ca.paa";
    hiddenSelections[] = {"camo_0"};
    hiddenSelectionsTextures[] = {"ww2\spe_assets_t\weapons\mortars_t\m1_mortar\Brandt_81mm_Mortar_Gelb_co.paa"};
    SPE_isTripod = 0;
    SPE_Deployed_Tripod_Name = "";
    class ACE_CSW {
        type = "mount"; // Use "mount" for tripods
        deployTime = 4; // How long it takes to deploy the tripod
        pickupTime = 4; // How long it takes to disassemble the tripod
        deploy = QGVAR(GrW278_baseplate); // what vehicle will spawn when the tripod is deployed
    };
};

class SPE_GrW278_1_Barrel: SPE_MLE_27_31_Barrel {
    author = "SPE";
    dlc = "SPE";
    displayName = "$STR_DN_SPE_GrW278_1_Barrel";
    descriptionShort = "$STR_SPE_DS_GrW278_1_Barrel";
    picture = "\WW2\SPE_Assets_t\Weapons\Equipment_t\Weapons\Launchers\Gear_GrW278_1_Barrel_X_ca.paa";
    hiddenSelections[] = {"camo_0"};
    hiddenSelectionsTextures[] = {"ww2\spe_assets_t\weapons\mortars_t\m1_mortar\Brandt_81mm_Mortar_Gelb_co.paa"};
    class ACE_CSW {
        type = "weapon";
        deployTime = 4;
        pickupTime = 4;
        class assembleTo {
            GVAR(GrW278_baseplate) = "SPE_GrW278_1";
        };
    };
};

// class GVAR(GrW278_carry): Launcher_Base_F {
//     dlc = "ace";
//     scope = 2;
//     displayName = "$STR_DN_SPE_GrW278_1_Barrel";
//     descriptionShort = "$STR_SPE_DS_GrW278_1_Barrel";
//     author = ECSTRING(common,ACETeam);
//     picture = "\WW2\SPE_Assets_t\Weapons\Equipment_t\Weapons\Launchers\Gear_GrW278_1_Barrel_X_ca.paa";
//     model = "\WW2\SPE_Assets_m\Weapons\Mortars_m\SPE_M1_Mortar_Tube.p3d";
//     modes[] = {};

//     class ACE_CSW {
//         type = "weapon";
//         deployTime = 20;
//         pickupTime = 25;

//         class assembleTo {
//             EGVAR(csw,mortarBaseplate) = "SPE_GrW278_1";
//             GVAR(GrW278_baseplate) = "SPE_GrW278_1";
//         };
//     };

//     class WeaponSlotsInfo: WeaponSlotsInfo {
//         class MuzzleSlot {
//             iconScale = 0.1;
//         };
//         mass = 730;
//     };
// };

// class GVAR(GrW278_baseplate_carry): Launcher_Base_F {
//     class ACE_CSW {
//         type = "mount";
//         deployTime = 4;
//         pickupTime = 4;
//         deploy = QGVAR(GrW278_baseplate);
//     };
//     class WeaponSlotsInfo: WeaponSlotsInfo {
//         mass = 290;
//     };
//     dlc = "ace";
//     scope = 2;
//     displayName = "$STR_DN_SPE_GrW278_1_STAND";
//     author = ECSTRING(common,ACETeam);
//     picture = "\WW2\SPE_Assets_t\Weapons\Equipment_t\Weapons\Launchers\Gear_GrW278_1_Stand_X_ca.paa";
//     model = "\WW2\SPE_Assets_m\Weapons\Mortars_m\SPE_M1_Mortar_Stand.p3d";
//     modes[] = {};
//     hiddenSelections[] = {"camo_0"};
//     hiddenSelectionsTextures[] = {"ww2\spe_assets_t\weapons\mortars_t\m1_mortar\Brandt_81mm_Mortar_Gelb_co.paa"};
// };
