class CfgMagazines {
	class Default;
	class CA_magazine: Default{};
	class cse_m_tablet: CA_magazine {
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		displayName = "Military Tablet (NATO)";
	  	descriptionUse = "Military Tablet (NATO)";
		picture = "\cse\cse_sys_cc\data\m_tablet.paa";
	  	descriptionShort = "Military Tablet";
	  	mass = 5;
	};
	class cse_m_pda: CA_magazine {
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		descriptionUse = "A PDA, for use in the field. NATO Software compatible.";
		descriptionShort = "A PDA for use in the field (NATO)";
		displayName = "PDA (NATO)";
		picture = "\cse\cse_sys_cc\data\m_pda.paa";
		mass = 2;
	};
	class cse_m_tablet_uk: CA_magazine {
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		descriptionUse = "UK Tablet. NATO Software compatible.";
		descriptionShort = "A Tablet for use in the field (UK)";
		displayName = "Military Tablet (UK)";
		picture = "\cse\cse_sys_cc\data\uk_tablet.paa";
		mass = 5;
	};
	class cse_m_tablet_o: CA_magazine {
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		descriptionUse = "OPFOR Tablet. OPFOR Software compatible.";
		descriptionShort = "A Tablet for use in the field (OPFOR)";
		displayName = "Military Tablet (OPFOR)";
		picture = "\cse\cse_sys_cc\data\m_tablet.paa";
		mass = 5;
	};
	class cse_m_pda_o: CA_magazine {
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		descriptionUse = "OPFOR PDA. OPFOR Software compatible.";
		descriptionShort = "A PDA for use in the field (OPFOR)";
		displayName = "Military PDA (OPFOR)";
		picture = "\cse\cse_sys_cc\data\m_pda.paa";
		mass = 2;
	};
};