class CfgWeapons {
	class Launcher;
	class ACE_BaseAimingPost: Launcher {
		displayName = "Aiming Post";
		descriptionShort = "";
		type = 4;
		model = QPATHTO_M(ACE_ARTY_AimingStakesW.p3d);
		picture = QPATHTO_T(data\equip\w_stake_ca.paa);
		class Library {
			libTextDesc = "";
		};
		ACE_Weight = 3;
	};
	class ACE_Arty_AimingPost_M1A2_M58: ACE_BaseAimingPost {
		scope = 2;
		displayName = $STR_DN_ACE_ARTY_AIMINGPOST_M1A2_M58;
		descriptionShort = $STR_DSS_ACE_ARTY_AIMINGPOST_M1A2_M58;
	};
	class ACE_Arty_AimingPost_M1A2_M59: ACE_BaseAimingPost {
		scope = 2;
		displayName = $STR_DN_ACE_ARTY_AIMINGPOST_M1A2_M59;
		descriptionShort = $STR_DSS_ACE_ARTY_AIMINGPOST_M1A2_M59;
	};
	class ACE_Arty_M1A1_Collimator: ACE_BaseAimingPost {
		scope = 2;
		displayName = $STR_DSS_ACE_ARTY_COLLIMATOR_M1A1;
		descriptionShort = $STR_DSS_ACE_ARTY_COLLIMATOR_M1A1;
		picture = QPATHTO_T(data\equip\collimator_item_ca.paa);
		model = QPATHTO_M(sa_collimator_wep.p3d);
		ACE_Weight = 14.5;
	};
	class ACE_Arty_M2A2_Aiming_Circle: ACE_BaseAimingPost {
		scope = 2;
		displayName = $STR_DSS_ACE_ARTY_AIMINGCIRCLE_M2A2;
		descriptionShort = $STR_DSS_ACE_ARTY_AIMINGCIRCLE_M2A2;
		picture = QPATHTO_T(data\equip\m2a2_item_ca.paa);
		model = QPATHTO_M(ace_arty_m2a2_aiming_circle_wep.p3d);
		ACE_Weight = 20.5;
	};
};
