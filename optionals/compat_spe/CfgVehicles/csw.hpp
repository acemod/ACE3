class EGVAR(csw,baseTripod);

class GVAR(M2_tripod): EGVAR(csw,baseTripod) {
    model = "\WW2\SPE_Assets_m\Vehicles\StaticWeapons_m\SPE_M2_Tripod_Disasm.p3d";
    picture = "\WW2\SPE_Assets_t\Weapons\Equipment_t\Weapons\Launchers\Gear_M2_Tripod_X_ca.paa";
    hiddenSelections[] = {"camo_1"};
    hiddenSelectionsTextures[] = {"WW2\SPE_Assets_t\Weapons\MachineGun_Light_t\M1919\M2_Tripod_co.paa"};
    class ACE_CSW {
        disassembleTo = "SPE_M2_Tripod";
    };
};

class GVAR(MLE_27_31_baseplate): EGVAR(csw,baseTripod) {
    displayName = "$STR_DN_SPE_MLE_27_31_STAND";
    model = "\WW2\SPE_Assets_m\Weapons\Mortars_m\SPE_M1_Mortar_Stand_Deployed.p3d";
    picture = "\WW2\SPE_Assets_t\Weapons\Equipment_t\Weapons\Launchers\Gear_MLE_27_31_Stand_X_ca.paa";
    hiddenSelections[] = {"camo_0","camo_1"};
    hiddenSelectionsTextures[] = {"ww2\spe_assets_t\weapons\mortars_t\m1_mortar\Brandt_81mm_Mortar_French_co.paa","WW2\SPE_Assets_t\Weapons\Mortars_t\M1_Mortar\Brandt_81mm_Sight_French_co.paa"};
    class ACE_CSW {
        disassembleTo = "SPE_MLE_27_31_Stand";
    };
};

class GVAR(GrW278_baseplate): EGVAR(csw,baseTripod) {
    displayName = "$STR_DN_SPE_GrW278_1_STAND";
    model = "\WW2\SPE_Assets_m\Weapons\Mortars_m\SPE_M1_Mortar_Stand_Deployed.p3d";
    picture = "\WW2\SPE_Assets_t\Weapons\Equipment_t\Weapons\Launchers\Gear_GrW278_1_Stand_X_ca.paa";
    hiddenSelections[] = {"camo_0"};
    hiddenSelectionsTextures[] = {"ww2\spe_assets_t\weapons\mortars_t\m1_mortar\Brandt_81mm_Mortar_Gelb_co.paa"};
    class ACE_CSW {
        disassembleTo = "SPE_GrW278_1_Stand";
    };
};

class GVAR(M1_81_baseplate): EGVAR(csw,baseTripod) {
    displayName = "$STR_DN_SPE_M1_81_STAND";
    model = "\WW2\SPE_Assets_m\Weapons\Mortars_m\SPE_M1_Mortar_Stand_Deployed.p3d";
    picture = "\WW2\SPE_Assets_t\Weapons\Equipment_t\Weapons\Launchers\Gear_M1_81_Stand_X_ca.paa";
    class ACE_CSW {
        disassembleTo = "SPE_M1_81_Stand";
    };
};
