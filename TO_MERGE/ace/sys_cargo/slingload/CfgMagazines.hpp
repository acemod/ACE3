#define __MASS 0.94
class CfgMagazines {
	class CA_Magazine;
	class ACE_Rope_MRL: CA_Magazine { // Base
		scope = 1;
		displayName = $STR_DN_ACE_ROPE_MRL;
		picture = QPATHTO_T(data\equip\m_rope_ca.paa);
		model = QPATHTO_M(m_ace_rope.p3d);
		type = "3 * 256";
		ammo = "FakeAmmo";
		count = 1;
		initSpeed = 0;
		maxLeadSpeed = 0;
		nameSound = "mine";
		ACE_Weight = 2; // Diameter: 40 mm , Weight: 94 kg / 100 m
		ACE_Size = 400;
		ACE_NoPack = 1; // Not packable
		ACE_SlingRope = 1;
		descriptionShort = "";
	};
	class ACE_Rope_M5: ACE_Rope_MRL {
		scope = 2;
		displayName = $STR_DN_ACE_ROPE_M5;
		ACE_Size = 64;
		ACE_Weight = 14.3256;
	};
};
