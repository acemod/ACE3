
class CfgMagazines {
    
    class SmokeShell;
    
    class Chemlight_Green: Smokeshell {
        ACE_Chemlight_Shield = "ACE_Chemlight_Shield_Green";
    };
    
    class Chemlight_Blue: Chemlight_Green {
        ACE_Chemlight_Shield = "ACE_Chemlight_Shield_Blue";
    };
    
    class Chemlight_Red: Chemlight_Green {
        ACE_Chemlight_Shield = "ACE_Chemlight_Shield_Red";
    };
    
    class Chemlight_Yellow: Chemlight_Green {
        ACE_Chemlight_Shield = "ACE_Chemlight_Shield_Yellow";
    };
    
    class ACE_Chemlight_Orange: Chemlight_Green {
        ACE_Attachable = "ACE_G_Chemlight_Orange";
        ACE_Chemlight_Shield = "ACE_Chemlight_Shield_Orange";
        author = ECSTRING(common,ACETeam);
        ammo = "ACE_G_Chemlight_Orange";
        displayName = CSTRING(Orange_DisplayName);
        displayNameShort = CSTRING(Orange_DisplayNameShort);
        descriptionShort = CSTRING(Orange_DescriptionShort);
        model = "\A3\Weapons_f\chemlight\chemlight_yellow";
        picture = QPATHTOF(UI\ace_chemlight_orange_x_ca.paa);
    };
    
    class ACE_Chemlight_White: Chemlight_Green {
        ACE_Attachable = "ACE_G_Chemlight_White";
        ACE_Chemlight_Shield = "ACE_Chemlight_Shield_White";
        author = ECSTRING(common,ACETeam);
        ammo = "ACE_G_Chemlight_White";
        displayName = CSTRING(White_DisplayName);
        displayNameShort = CSTRING(White_DisplayNameShort);
        descriptionShort = CSTRING(White_DescriptionShort);
        model = "\A3\Weapons_f\chemlight\chemlight_yellow";
        picture = QPATHTOF(UI\ace_chemlight_white_x_ca.paa);
    };
    
    class ACE_Chemlight_HiRed: Chemlight_Red {
        ACE_Attachable = "ACE_G_Chemlight_HiRed";
        ACE_Chemlight_Shield = "";
        author = ECSTRING(common,ACETeam);
        ammo = "ACE_G_Chemlight_HiRed";
        displayName = CSTRING(HiRed_DisplayName);
        displayNameShort = CSTRING(HiRed_DisplayNameShort);
        descriptionShort = CSTRING(HiRed_DescriptionShort);
        picture = QPATHTOF(UI\ace_chemlight_hired_x_ca.paa);
    };
    
    class ACE_Chemlight_HiYellow: Chemlight_Yellow {
        ACE_Attachable = "ACE_G_Chemlight_HiYellow";
        ACE_Chemlight_Shield = "";
        author = ECSTRING(common,ACETeam);
        ammo = "ACE_G_Chemlight_HiYellow";
        displayName = CSTRING(HiYellow_DisplayName);
        displayNameShort = CSTRING(HiYellow_DisplayNameShort);
        descriptionShort = CSTRING(HiYellow_DescriptionShort);
        picture = QPATHTOF(UI\ace_chemlight_hiyellow_x_ca.paa);
    };
    
    class ACE_Chemlight_HiOrange: ACE_Chemlight_Orange {
        ACE_Attachable = "ACE_G_Chemlight_HiOrange";
        ACE_Chemlight_Shield = "";
        author = ECSTRING(common,ACETeam);
        ammo = "ACE_G_Chemlight_HiOrange";
        displayName = CSTRING(HiOrange_DisplayName);
        displayNameShort = CSTRING(HiOrange_DisplayNameShort);
        descriptionShort = CSTRING(HiOrange_DescriptionShort);
        picture = QPATHTOF(UI\ace_chemlight_hiorange_x_ca.paa);
    };
    
    class ACE_Chemlight_HiWhite: ACE_Chemlight_White {
        ACE_Attachable = "ACE_G_Chemlight_HiWhite";
        ACE_Chemlight_Shield = "";
        author = ECSTRING(common,ACETeam);
        ammo = "ACE_G_Chemlight_HiWhite";
        displayName = CSTRING(HiWhite_DisplayName);
        displayNameShort = CSTRING(HiWhite_DisplayNameShort);
        descriptionShort = CSTRING(HiWhite_DescriptionShort);
        picture = QPATHTOF(UI\ace_chemlight_hiwhite_x_ca.paa);
    };
    
    class ACE_Chemlight_IR: Chemlight_Green {
        ACE_Attachable = "ACE_Chemlight_IR_Dummy";
        ACE_Chemlight_Shield = "";
        author = ECSTRING(common,ACETeam);
        ammo = "ACE_G_Chemlight_IR";
        displayName = CSTRING(IR_DisplayName);
        displayNameShort = CSTRING(IR_DisplayNameShort);
        descriptionShort = CSTRING(IR_DescriptionShort);
        picture = QPATHTOF(UI\ace_chemlight_ir_x_ca.paa);    
    };
};
