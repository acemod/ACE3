
class CfgMagazines {
    
    class SmokeShell;
    
    class Chemlight_Green: Smokeshell {
        ACE_ChemlightShieldType = "ACE_Chemlight_Shield_Green";
    };
    
    class Chemlight_Blue: Chemlight_Green {
        ACE_ChemlightShieldType = "ACE_Chemlight_Shield_Blue";
    };
    
    class Chemlight_Red: Chemlight_Green {
        ACE_ChemlightShieldType = "ACE_Chemlight_Shield_Red";
    };
    
    class Chemlight_Yellow: Chemlight_Green {
        ACE_ChemlightShieldType = "ACE_Chemlight_Shield_Yellow";
    };
    
    class ACE_Chemlight_Orange: Chemlight_Green {
        ACE_Attachable = "ACE_G_Chemlight_Orange";
        ACE_ChemlightShieldType = "ACE_Chemlight_Shield_Orange";
        ammo = "ACE_G_Chemlight_Orange";
        displayName = "Chemlight (Orange)";
        displayNameShort = "Orange Light";
        descriptionShort = "Type: Light - Orange<br />Rounds: 1<br />Used in: Hand";
        model = "\A3\Weapons_f\chemlight\chemlight_yellow";
        picture = PATHTOF(UI\ace_chemlight_orange_x_ca.paa);
    };
    
    class ACE_Chemlight_White: Chemlight_Green {
        ACE_Attachable = "ACE_G_Chemlight_White";
        ACE_ChemlightShieldType = "ACE_Chemlight_Shield_White";
        ammo = "ACE_G_Chemlight_White";
        displayName = "Chemlight (White)";
        displayNameShort = "White Light";
        descriptionShort = "Type: Light - White<br />Rounds: 1<br />Used in: Hand";
        model = "\A3\Weapons_f\chemlight\chemlight_yellow";
        picture = PATHTOF(UI\ace_chemlight_white_x_ca.paa);
    };
    
    class ACE_Chemlight_HiRed: Chemlight_Red {
        ACE_Attachable = "ACE_G_Chemlight_HiRed";
        ACE_ChemlightShieldType = "";
        ammo = "ACE_G_Chemlight_HiRed";
        displayName = "Chemlight (Red Hi)";
        descriptionShort = "Type: Light - Red Hi (30 minute)<br />Rounds: 1<br />Used in: Hand";
        displayNameShort = "Red Hi Light";
        picture = PATHTOF(UI\ace_chemlight_hired_x_ca.paa);
    };
    
    class ACE_Chemlight_HiYellow: Chemlight_Yellow {
        ACE_Attachable = "ACE_G_Chemlight_HiYellow";
        ACE_ChemlightShieldType = "";
        ammo = "ACE_G_Chemlight_HiYellow";
        displayName = "Chemlight (Yellow Hi)";
        descriptionShort = "Type: Light - Yellow Hi (30 minute)<br />Rounds: 1<br />Used in: Hand";
        displayNameShort = "Yellow Hi Light";
        picture = PATHTOF(UI\ace_chemlight_hiyellow_x_ca.paa);
    };
    
    class ACE_Chemlight_HiOrange: ACE_Chemlight_Orange {
        ACE_Attachable = "ACE_G_Chemlight_HiOrange";
        ACE_ChemlightShieldType = "";
        ammo = "ACE_G_Chemlight_HiOrange";
        displayName = "Chemlight (Orange Hi)";
        descriptionShort = "Type: Light - Orange Hi (30 minute)<br />Rounds: 1<br />Used in: Hand";
        displayNameShort = "Orange Hi Light";
        picture = PATHTOF(UI\ace_chemlight_hiorange_x_ca.paa);
    };
    
    class ACE_Chemlight_HiWhite: ACE_Chemlight_White {
        ACE_Attachable = "ACE_G_Chemlight_HiWhite";
        ACE_ChemlightShieldType = "";
        ammo = "ACE_G_Chemlight_HiWhite";
        displayName = "Chemlight (White Hi)";
        descriptionShort = "Type: Light - White Hi (30 minute)<br />Rounds: 1<br />Used in: Hand";
        displayNameShort = "White Hi Light";
        picture = PATHTOF(UI\ace_chemlight_hiwhite_x_ca.paa);
    };
    /*
    class ACE_Chemlight_IR: Chemlight_Green {
        ACE_Attachable = "ACE_G_Chemlight_IR";
        ammo = "ACE_G_Chemlight_IR";
        displayName = "Chemlight (IR)";
        descriptionShort = "Type: Light - Infrared<br />Rounds: 1<br />Used in: Hand";
        displayNameShort = "IR Light";
        //picture = PATHTOF(UI\ace_chemlight_hiwhite_x_ca.paa);    
    };
    */
};
