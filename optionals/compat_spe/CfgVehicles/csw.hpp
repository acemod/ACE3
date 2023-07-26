class EGVAR(csw,mortarBaseplate);

class GVAR(GrW278_baseplate): EGVAR(csw,mortarBaseplate) {
    displayName = "$STR_DN_SPE_GrW278_1_STAND";
    model = "\WW2\SPE_Assets_m\Weapons\Mortars_m\SPE_M1_Mortar_Stand_Deployed.p3d";
    picture = "\WW2\SPE_Assets_t\Weapons\Equipment_t\Weapons\Launchers\Gear_GrW278_1_Stand_X_ca.paa";
    hiddenSelections[] = {"camo_0"};
    hiddenSelectionsTextures[] = {"ww2\spe_assets_t\weapons\mortars_t\m1_mortar\Brandt_81mm_Mortar_Gelb_co.paa"};
    class ACE_CSW {
        disassembleTo = "SPE_GrW278_1_Stand";
    };
};
