class CfgWeapons {
	class Launcher_Base_F;
	class GVAR(carryTripod): Launcher_Base_F {
		author = ECSTRING(common, ACETeam);
		scope = 2;
		displayName = CSTRING(CSWTripodFolded_displayName);
		model = QUOTE(PATHTOF(data\ACE_CSWTripodFolded.p3d));
		modes[] = {};
	};
	
	class HMG_Static;
	class GVAR(HMG_Static): HMG_Static {
		author = ECSTRING(common, ACETeam);
		displayName = CSTRING(HMGStatic_displayName);
		magazines[] = { GVAR(HMG_Dummy_200Rnd_mag), GVAR(100Rnd_127x99_mag) };
	};
	
	class GMG_20mm;
	class GVAR(GMG_20mm): GMG_20mm {
		author = ECSTRING(common, ACETeam);
		displayName = CSTRING(GMGStatic_displayName);
		magazines[] = { GVAR(20Rnd_20mm_G_belt), GVAR(GMG_Dummy_120Rnd_mag) };
	};
	
	class ace_javelin_Titan_Static;
	class GVAR(missiles_titan_static_AT): ace_javelin_Titan_Static {
		author = ECSTRING(common, ACETeam);
		displayName = CSTRING(ATStatic_displayName);
		magazines[] = { GVAR(1Rnd_GAT_missiles), GVAR(TitanAT_Dummy_Missile) };
	};
	
	class missiles_titan_static;
	class GVAR(missiles_titan_static_AA): missiles_titan_static {
		author = ECSTRING(common, ACETeam);
		displayName = CSTRING(AAStatic_displayName);
		magazines[] = { GVAR(1Rnd_GAA_missiles), GVAR(TitanAA_Dummy_Missile) };
	};
};