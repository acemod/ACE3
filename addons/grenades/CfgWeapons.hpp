
class CfgWeapons {
    class GrenadeLauncher;
    class Throw: GrenadeLauncher {
        muzzles[] += {"ACE_HandFlare_WhiteMuzzle","ACE_HandFlare_RedMuzzle","ACE_HandFlare_GreenMuzzle","ACE_HandFlare_YellowMuzzle","ACE_M84Muzzle","ACE_Chemlight_OrangeMuzzle","ACE_Chemlight_WhiteMuzzle","ACE_Chemlight_HiRedMuzzle","ACE_Chemlight_HiYellowMuzzle","ACE_Chemlight_HiOrangeMuzzle","ACE_Chemlight_HiWhiteMuzzle","ACE_Chemlight_HiRedMuzzle"};

        class ThrowMuzzle;
        class ACE_HandFlare_WhiteMuzzle: ThrowMuzzle {
            magazines[] = {"ACE_HandFlare_White"};
        };

        class ACE_HandFlare_RedMuzzle: ThrowMuzzle {
            magazines[] = {"ACE_HandFlare_Red"};
        };

        class ACE_HandFlare_GreenMuzzle: ThrowMuzzle {
            magazines[] = {"ACE_HandFlare_Green"};
        };

        class ACE_HandFlare_YellowMuzzle: ThrowMuzzle {
            magazines[] = {"ACE_HandFlare_Yellow"};
        };

        class ACE_M84Muzzle: ThrowMuzzle {
            magazines[] = {"ACE_M84"};
        };
		
		class ACE_Chemlight_OrangeMuzzle: ThrowMuzzle {
			magazines[] = {"ACE_Chemlight_Orange"};
		};
		
		class ACE_Chemlight_WhiteMuzzle: ThrowMuzzle {
            magazines[] = {"ACE_Chemlight_White"};
        };
		
		class ACE_Chemlight_HiRedMuzzle: ThrowMuzzle {
            magazines[] = {"ACE_Chemlight_HiRed"};
        };
		
		class ACE_Chemlight_HiYellowMuzzle: ThrowMuzzle {
            magazines[] = {"ACE_Chemlight_HiYellow"};
        };
		
		class ACE_Chemlight_HiOrangeMuzzle: ThrowMuzzle {
            magazines[] = {"ACE_Chemlight_HiOrange"};
        };
		
		class ACE_Chemlight_HiWhiteMuzzle: ThrowMuzzle {
            magazines[] = {"ACE_Chemlight_HiWhite"};
        };
    };
};
