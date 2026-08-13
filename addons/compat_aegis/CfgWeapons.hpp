class CfgWeapons {
    class Rifle_Base_F;
    class Rifle_Long_Base_F;
    class Rifle_Short_Base_F;
    class Pistol_Base_F;
    class sgun_Mp153_black_F: Rifle_Base_F {
        // https://web.archive.org/web/20140228123347/http://imzcorp.com/en/company/95.html
        // in lengths: 610, 660, 710, 750
        ACE_barrelLength = 610.0;
        ACE_twistDirection = 0;
    };
    class sgun_Mp153_classic_F: sgun_Mp153_black_F {
        ACE_barrelLength = 750.0;
    };
    class Aegis_arifle_M16A4_base_F: Rifle_Base_F {
        ACE_barrelTwist = 177.8; // 1 in 7 in like modern AR15
        ACE_barrelLength = 508.0; // 20 in
    };
    class Aegis_MMG_FNMAG_Base: Rifle_Long_Base_F {
        // https://fnherstal.com/app/uploads/technical-data-fn-mag-1.pdf
        ACE_barrelTwist = 305.0; // 1 in 12 in
        ACE_barrelLength = 630.0;
    };
    class Aegis_MMG_FNMAG_240_F: Aegis_MMG_FNMAG_Base {
        // looks like 240L which is 4 in shorter barrel
        ACE_barrelLength = 528.4;
    };
    class sgun_M4_F: Rifle_Short_Base_F {
        // https://www.benellile.com/shotguns/m4-tactical-shotguns
        ACE_barrelLength = 469.9; // 18.5 in
        ACE_twistDirection = 0;
    };
    class hgun_G17_F: Pistol_Base_F {
        ACE_barrelTwist = 250; // 1 in 9.84 in
        ACE_barrelLength = 114.0; // 4.49 in
    };
    class hgun_Mk26_F: Pistol_Base_F {
        // https://shopkahrfirearmsgroup.com/mri-technical-data/
        ACE_barrelTwist = 457.0; // 1 in 18 in
        ACE_barrelLength = 152.0; // 6 in
    };
    class Aegis_hgun_Pistol_R57_F: Pistol_Base_F {
        // https://ruger.com/products/ruger57/specSheets/16401.html
        ACE_barrelTwist = 228.6; // 1 in 9 in
        ACE_barrelLength = 125.476; // 4.94 in
    };
    class sgun_KSG_F: Rifle_Short_Base_F {
        // https://www.keltecweapons.com/wp-content/uploads/2025/09/KEL_Shotgun_Manual_UPDATE_v1_FINAL_COMBINED.pdf
        ACE_barrelLength = 470.0; // 18.5 in
        ACE_twistDirection = 0;
    };
};
