class USOrdnanceBox_EP1;
class ACE_Arty_OrdnanceBox: USOrdnanceBox_EP1 { scope = 1; }; // USE this to inherit from in the future
class ace_arty_105mm_ammo_m1: ACE_Arty_OrdnanceBox {
	scope = 2;
	displayName = "105mm Ammo M1 HE w/Fuze M782";
	model = QPATHTO_M(105mm\ace_arty_105mm_Box.p3d);
	vehicleClass = "ACE_Arty_Ammunition";
	class TransportWeapons {};
	class TransportMagazines {
		ACE_M_MAG(ace_arty_105mm_m1,5);
	};
};
class ace_arty_105mm_ammo_m84a1: ace_arty_105mm_ammo_m1 {
	displayName = "105mm M84A1 BE HC Smoke w/Fuze M782";
	class TransportWeapons {};
	class TransportMagazines {
		ACE_M_MAG(ace_arty_105mm_m84a1,5);
	};
};
class ace_arty_105mm_ammo_m916: ace_arty_105mm_ammo_m1 {
	displayName = "105mm M916 BE DPICM w/Fuze M782";
	class TransportWeapons {};
	class TransportMagazines {
		ACE_M_MAG(ace_arty_105mm_m916,5);
	};
};
class ace_arty_105mm_ammo_m314a3: ace_arty_105mm_ammo_m1 {
	displayName = "105mm M314A3 Illum w/Fuze M782";
	class TransportWeapons {};
	class TransportMagazines {
		ACE_M_MAG(ace_arty_105mm_m314a3,5);
	};
};
class ace_arty_105mm_ammo_m60a2: ace_arty_105mm_ammo_m1 {
	displayName = "105mm M60A2 Bursting WP Smoke w/Fuze M782";
	class TransportWeapons {};
	class TransportMagazines {
		ACE_M_MAG(ace_arty_105mm_m60a2,5);
	};
};

	// Mortars
	// 81mm
	class ACE_Tbox_GP_W;
	class ACE_Tbox_GP_R;
	class ACE_Tbox_Mortar_81mmHE: ACE_Tbox_GP_W {
		vehicleClass = "ACE_Arty_Ammunition";
		displayName = "81mm M821A2 HE w/Fuze M734";
		transportMaxWeapons = 0;
		transportMaxMagazines = 8;
		class TransportMagazines {
			ACE_M_MAG(ACE_M252HE_CSWDM,4);
			ACE_M_MAG(ace_arty_81mm_m821a2,4);
		};
	};
	class ACE_Tbox_Mortar_81mmWP: ACE_Tbox_Mortar_81mmHE {
		displayName = "81mm M375A3 Bursting WP Smoke w/Fuze M524";
		class TransportMagazines {
			ACE_M_MAG(ACE_M252WP_CSWDM,4);
			ACE_M_MAG(ace_arty_81mm_m375a3,4);
		};
	};
	class ACE_Tbox_Mortar_81mmIL: ACE_Tbox_Mortar_81mmHE {
		displayName = "81mm M853A1 Illum w/Fuze M772";
		class TransportMagazines {
			ACE_M_MAG(ACE_M252IL_CSWDM,4);
			ACE_M_MAG(ace_arty_81mm_m853a1,4);
		};
	};	

	// 60mm
	class ACE_Tbox_Mortar_60mmHE: ACE_Tbox_GP_W {
		scope = 2;
		vehicleClass = "ACE_Arty_Ammunition";
		displayName = "60mm M720A1 HE w/Fuze M734";
		transportMaxWeapons = 0;
		transportMaxMagazines = 8;
		class TransportMagazines {
			ACE_M_MAG(ACE_M224HE_CSWDM,4);
			ACE_M_MAG(ace_arty_60mm_m720a1,4);
		};
	};
	class ACE_Tbox_Mortar_60mmWP: ACE_Tbox_Mortar_81mmHE {
		scope = 2;
		displayName = "60mm M722A1 Bursting WP Smoke w/Fuze M745";
		class TransportMagazines {
			ACE_M_MAG(ACE_M224WP_CSWDM,4);
			ACE_M_MAG(ace_arty_60mm_m722a1,4);			
		};
	};
	class ACE_Tbox_Mortar_60mmIL: ACE_Tbox_Mortar_81mmHE {
		scope = 2;
		displayName = "60mm M721 Illum w/Fuze M776";
		class TransportMagazines {
			ACE_M_MAG(ACE_M224IL_CSWDM,4);
			ACE_M_MAG(ace_arty_60mm_m721,4);			
		};
	};	


	// 82mm
	class ACE_Tbox_Mortar_82mmHE: ACE_Tbox_GP_R {
		vehicleClass = "ACE_Arty_Ammunition";
		displayName = $STR_DN_ACE_CSW_BOX_2B14_AMMOHE;
		transportMaxWeapons = 0;
		transportMaxMagazines = 8;
		class TransportMagazines {
			ACE_M_MAG(ACE_2B14HE_CSWDM,4);
			ACE_M_MAG(ace_arty_82mm_he,4);
		};
	};
	class ACE_Tbox_Mortar_82mmWP: ACE_Tbox_Mortar_82mmHE {
		displayName = $STR_DN_ACE_CSW_BOX_2B14_AMMOWP;
		class TransportMagazines {
			ACE_M_MAG(ACE_2B14WP_CSWDM,4);
			ACE_M_MAG(ace_arty_82mm_wp,4);

		};
	};
	class ACE_Tbox_Mortar_82mmIL: ACE_Tbox_Mortar_82mmHE {
		displayName = $STR_DN_ACE_CSW_BOX_2B14_AMMOIL;
		class TransportMagazines {
			ACE_M_MAG(ACE_2B14IL_CSWDM,4);
			ACE_M_MAG(ace_arty_82mm_illum,4);
		};
	};
	// 
	class ace_arty_120mm_ammo_dm11: ACE_Arty_OrdnanceBox {
		scope = 2;
		displayName = "120mm DM11A5 HE w/Fuze DM111A1";
		model = QPATHTO_M(120mm\ace_box_dm11.p3d);
		icon = QPATHTO_C(120mm\data\icomap_dm11_ca.paa);
		vehicleClass = "ACE_Arty_Ammunition";
		transportMaxMagazines = 2;
		class TransportWeapons {};
		class TransportMagazines {
			ACE_M_MAG(ace_arty_120mm_dm11a5,2);
		};
		ACE_Weight = 1.5;
	};
	class ace_arty_120mm_ammo_dm61: ace_arty_120mm_ammo_dm11 {
		displayName = "120mm DM61 HE w/Fuze PPD324-B3";
		model = QPATHTO_M(120mm\ace_box_dm61.p3d);
		icon = QPATHTO_C(120mm\data\icomap_dm61_ca.paa);
		class TransportWeapons {};
		class TransportMagazines {
			ACE_M_MAG(ace_arty_120mm_dm61,2);
		};
	};
	class ace_arty_120mm_ammo_dm26: ace_arty_120mm_ammo_dm11 {
		displayName = "120mm DM26 Illum w/Fuze DM93";
		model = QPATHTO_M(120mm\ace_box_dm26.p3d);
		icon = QPATHTO_C(120mm\data\icomap_dm26_ca.paa);
		class TransportWeapons {};
		class TransportMagazines {
			ACE_M_MAG(ace_arty_120mm_dm26,2);
		};
	};
	class ace_arty_120mm_ammo_dm35: ace_arty_120mm_ammo_dm11 {
		displayName = "120mm DM35 BE HC Smoke w/Fuze DM93";
		model = QPATHTO_M(120mm\ace_box_dm35.p3d);
		icon = QPATHTO_C(120mm\data\icomap_dm35_ca.paa);
		class TransportWeapons {};
		class TransportMagazines {
			ACE_M_MAG(ace_arty_120mm_dm35,2);
		};
	};
	// 1 Rnd Collies
	