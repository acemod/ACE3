class CfgVehicles {
	class Thing;
	class ACE_Slingrope_L: Thing {
		scope = 1;
		animated = 0;
		displayName = "";
		model=QPATHTO_M(ace_slingrope_L.p3d);
		destructype = "Destructno";
		cost = 0;
		armor = 999999;
		ace_slingrope=1;
		XEH_DISABLED;
	};

	class ACE_Slingrope_M: ACE_Slingrope_L {
		model=QPATHTO_M(ace_slingrope_M.p3d);
		ace_slingrope=1;
	};

	class ACE_Slingrope_P: ACE_Slingrope_L {
		model=QPATHTO_M(ace_slingrope_P.p3d);
		ace_slingrope=1;
	};

	class ACE_Slingrope: ACE_Slingrope_L {
		model=QPATHTO_M(ace_slingrope.p3d);
		ace_slingrope=1;
	};

	// GeoLifter points
	// Max Load
	// Vehicle Weight
	// TODO: Correct values
	class Air;
	class Helicopter: Air { ACE_canLift = 0; };
	class Plane: Air { ACE_canLift = 0; };
	/*class UH60_Base;
	class MH60S: UH60_Base {
		ACE_canLift = 1;
		ACE_GeoLifterAttachment[] = {{0,1.54,-5.1}};
		ACE_MaxLoad = 5886;
		ACE_Weight = 5224;
	};
	class UH60M_US_base_EP1;
	class UH60M_EP1: UH60M_US_base_EP1 {
		ACE_canLift = 1;
		ACE_GeoLifterAttachment[] = {{0,1.25,-5.25}};
		ACE_MaxLoad = 5886;
		ACE_Weight = 5224;
	};
	class UH1_Base: Helicopter {
		ACE_canLift = 1;
		ACE_GeoLifterAttachment[] = {{0,-4.3,-4.9}};
		ACE_MaxLoad = 3000;
		ACE_Weight = 5370;
	};
	class UH1H_Base: Helicopter {
		ACE_canLift = 1;
		ACE_GeoLifterAttachment[] = {{0,1.2,-4.8}};
		ACE_MaxLoad = 3000;
		ACE_Weight = 5370;
	};
	class MV22: Plane {
		ACE_canLift = 1;
		ACE_GeoLifterAttachment[] = {{0,0,-5.9}};
		ACE_MaxLoad = 6800;
		ACE_Weight = 15000;
	};
	class Mi24_Base: Helicopter {
		ACE_canLift = 1;
		ACE_GeoLifterAttachment[] = {{-0.1,2.5,-5.2}};
		ACE_MaxLoad = 2600;
		ACE_Weight = 11000;
	};
	class Mi17_base: Helicopter {
		ACE_canLift = 1;
		ACE_GeoLifterAttachment[] = {{0,1.9,-5.5}};
		ACE_MaxLoad = 5900;
		ACE_Weight = 7100;
	};
	class CH47_base_EP1: Helicopter {
		ACE_canLift = 1;
		ACE_GeoLifterAttachment[] = {{0,0,-5.6}};
		ACE_MaxLoad = 10000;
		ACE_Weight = 12000;
	};
	class AH6_Base_EP1;
	class MH6J_EP1: AH6_Base_EP1 {
		ACE_canLift = 0;
		ACE_GeoLifterAttachment[] = {{0,-0.8,0.5}};
		ACE_MaxLoad = 1000;
		ACE_Weight = 3370;
	};
	/// BAFF
	class BAF_Merlin_HC3_D: Helicopter {
		ACE_canLift = 1;
		ACE_GeoLifterAttachment[] = {{0.2,2.5,-4.9}};
		ACE_MaxLoad = 6000;
		ACE_Weight = 11000;
	};*/
};
