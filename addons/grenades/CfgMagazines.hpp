
class CfgMagazines {
    class HandGrenade;
    class ACE_HandFlare_Base: HandGrenade {
        scope = 1;
        value = 2;
        nameSoundWeapon = "smokeshell";
        nameSound = "smokeshell";
        mass = 4;
        initSpeed = 22;
    };

    class ACE_HandFlare_White: ACE_HandFlare_Base {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        displayname = CSTRING(M127A1_White_Name);
        descriptionshort = CSTRING(M127A1_White_Description);
        displayNameShort = CSTRING(M127A1_White_NameShort);
        model = "\A3\weapons_f\ammo\flare_white";
        picture = "\A3\Weapons_F\Data\UI\gear_flare_white_ca.paa";
        ammo = "ACE_G_Handflare_White";
    };

    class ACE_HandFlare_Red: ACE_HandFlare_Base {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        displayname = CSTRING(M127A1_Red_Name);
        descriptionshort = CSTRING(M127A1_Red_Description);
        displayNameShort = CSTRING(M127A1_Red_NameShort);
        model = "\A3\weapons_f\ammo\flare_red";
        picture = "\A3\Weapons_F\Data\UI\gear_flare_red_ca.paa";
        ammo = "ACE_G_Handflare_Red";
    };

    class ACE_HandFlare_Green: ACE_HandFlare_Base {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        displayname = CSTRING(M127A1_Green_Name);
        descriptionshort = CSTRING(M127A1_Green_Description);
        displayNameShort = CSTRING(M127A1_Green_NameShort);
        model = "\A3\weapons_f\ammo\flare_green";
        picture = "\A3\Weapons_F\Data\UI\gear_flare_green_ca.paa";
        ammo = "ACE_G_Handflare_Green";
    };

    class ACE_HandFlare_Yellow: ACE_HandFlare_Base {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        displayname = CSTRING(M127A1_Yellow_Name);
        descriptionshort = CSTRING(M127A1_Yellow_Description);
        displayNameShort = CSTRING(M127A1_Yellow_NameShort);
        model = "\A3\weapons_f\ammo\flare_yellow";
        picture = "\A3\Weapons_F\Data\UI\gear_flare_yellow_ca.paa";
        ammo = "ACE_G_Handflare_Yellow";
    };

    class ACE_M84: HandGrenade {
        author = ECSTRING(common,ACETeam);
        displayname = CSTRING(M84_Name);
        descriptionshort = CSTRING(M84_Description);
        displayNameShort = "M84";
        model = PATHTOF(models\ACE_m84.p3d);
        picture = PATHTOF(UI\ACE_m84_x_ca.paa);
        ammo = "ACE_G_M84";
        mass = 4;
    };

    class 3Rnd_UGL_FlareGreen_F;
    class 6Rnd_GreenSignal_F: 3Rnd_UGL_FlareGreen_F {
        author = ECSTRING(common,ACETeam);
        ammo = "F_40mm_Green";
        initSpeed = 120;
    };

    class 6Rnd_RedSignal_F: 6Rnd_GreenSignal_F {
        author = ECSTRING(common,ACETeam);
        ammo = "F_40mm_Red";
        initSpeed = 120;
    };
	
	class SmokeShell;
	class Chemlight_Green: Smokeshell {};
	class Chemlight_Blue: Chemlight_Green {};
	class Chemlight_Red: Chemlight_Green {};
	class Chemlight_Yellow: Chemlight_Green {};
	
	class ACE_Chemlight_Orange: Chemlight_Blue {
		ACE_Attachable = "ACE_G_Chemlight_Orange";
		ammo = "ACE_G_Chemlight_Orange";
		displayName = "Chemlight (Orange)";
		displayNameShort = "Orange Light";
		descriptionShort = "Type: Light - Orange<br />Rounds: 1<br />Used in: Hand";
		model = "\A3\Weapons_f\chemlight\chemlight_yellow";
		picture = PATHTOF(UI\ace_chemlight_orange_x_ca.paa);
	};
	
	class ACE_Chemlight_White: Chemlight_Blue {
		ACE_Attachable = "ACE_G_Chemlight_White";
		ammo = "ACE_G_Chemlight_White";
		displayName = "Chemlight (White)";
		displayNameShort = "White Light";
		descriptionShort = "Type: Light - White<br />Rounds: 1<br />Used in: Hand";
		model = "\A3\Weapons_f\chemlight\chemlight_yellow";
		picture = PATHTOF(UI\ace_chemlight_white_x_ca.paa);
	};
	
	class ACE_Chemlight_HiRed: Chemlight_Red {
		ACE_Attachable = "ACE_G_Chemlight_HiRed";
		ammo = "ACE_G_Chemlight_HiRed";
		displayName = "Chemlight (Red Hi)";
		descriptionShort = "Type: Light - Red Hi (30 minute)<br />Rounds: 1<br />Used in: Hand";
		displayNameShort = "Red Hi Light";
		picture = PATHTOF(UI\ace_chemlight_hired_x_ca.paa);
	};
	
	class ACE_Chemlight_HiYellow: Chemlight_Yellow {
		ACE_Attachable = "ACE_G_Chemlight_HiYellow";
		ammo = "ACE_G_Chemlight_HiYellow";
		displayName = "Chemlight (Yellow Hi)";
		descriptionShort = "Type: Light - Yellow Hi (30 minute)<br />Rounds: 1<br />Used in: Hand";
		displayNameShort = "Yellow Hi Light";
		picture = PATHTOF(UI\ace_chemlight_hiyellow_x_ca.paa);
	};
	
	class ACE_Chemlight_HiOrange: ACE_Chemlight_Orange {
		ACE_Attachable = "ACE_G_Chemlight_HiOrange";
		ammo = "ACE_G_Chemlight_HiOrange";
		displayName = "Chemlight (Orange Hi)";
		descriptionShort = "Type: Light - Orange Hi (30 minute)<br />Rounds: 1<br />Used in: Hand";
		displayNameShort = "Orange Hi Light";
		picture = PATHTOF(UI\ace_chemlight_hiorange_x_ca.paa);
	};
	
	class ACE_Chemlight_HiWhite: ACE_Chemlight_White {
		ACE_Attachable = "ACE_G_Chemlight_HiWhite";
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
