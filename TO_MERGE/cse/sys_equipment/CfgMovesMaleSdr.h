// Adpated from: https://github.com/Taosenai/tmr/blob/master/tmr_autorest/config.cpp

#define CSE_SWAY_DEPLOYED       0.06
#define CSE_SWAY_DEPLOYED_PRONE 0.03
#define CSE_SWAY_RESTED         0.30
#define CSE_SWAY_RESTED_PRONE   0.10

class CfgMovesMaleSdr : CfgMovesBasic {
	class States {
		class AmovPercMstpSrasWrflDnon;
		class AmovPercMstpSrasWrflDnon_cse_deployed : AmovPercMstpSrasWrflDnon {
			aimPrecision = CSE_SWAY_DEPLOYED;
			actions = "RifleStandActions_cse_deployed";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"AmovPercMstpSrasWrflDnon_cse_deployed", 0.02};
			ConnectFrom[] = {"AmovPercMstpSrasWrflDnon_cse_deployed", 0.02};
			InterpolateFrom[] = {"AmovPercMstpSrasWrflDnon", 0.02};
			InterpolateTo[] = {"AmovPercMstpSrasWrflDnon", 0.02};
		};

		class aadjpercmstpsraswrfldup;
		class aadjpercmstpsraswrfldup_cse_deployed : aadjpercmstpsraswrfldup {
			aimPrecision = CSE_SWAY_DEPLOYED;
			actions = "RifleAdjustFStandActions_cse_deployed";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjpercmstpsraswrfldup_cse_deployed", 0.02};
			ConnectFrom[] = {"aadjpercmstpsraswrfldup_cse_deployed", 0.02};
			InterpolateFrom[] = {"aadjpercmstpsraswrfldup", 0.02};
			InterpolateTo[] = {"aadjpercmstpsraswrfldup", 0.02};
		};

		class aadjpercmstpsraswrflddown;
		class aadjpercmstpsraswrflddown_cse_deployed : aadjpercmstpsraswrflddown {
			aimPrecision = CSE_SWAY_DEPLOYED;
			actions = "RifleAdjustBStandActions_cse_deployed";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjpercmstpsraswrflddown_cse_deployed", 0.02};
			ConnectFrom[] = {"aadjpercmstpsraswrflddown_cse_deployed", 0.02};
			InterpolateFrom[] = {"aadjpercmstpsraswrflddown", 0.02};
			InterpolateTo[] = {"aadjpercmstpsraswrflddown", 0.02};
		};

		class aadjpercmstpsraswrfldright;
		class aadjpercmstpsraswrfldright_cse_deployed : aadjpercmstpsraswrfldright {
			aimPrecision = CSE_SWAY_DEPLOYED;
			actions = "RifleAdjustRStandActions_cse_deployed";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjpercmstpsraswrfldright_cse_deployed", 0.02};
			ConnectFrom[] = {"aadjpercmstpsraswrfldright_cse_deployed", 0.02};
			InterpolateFrom[] = {"aadjpercmstpsraswrfldright", 0.02};
			InterpolateTo[] = {"aadjpercmstpsraswrfldright", 0.02};
		};

		class aadjpercmstpsraswrfldleft;
		class aadjpercmstpsraswrfldleft_cse_deployed : aadjpercmstpsraswrfldleft {
			aimPrecision = CSE_SWAY_DEPLOYED;
			actions = "RifleAdjustLStandActions_cse_deployed";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjpercmstpsraswrfldleft_cse_deployed", 0.02};
			ConnectFrom[] = {"aadjpercmstpsraswrfldleft_cse_deployed", 0.02};
			InterpolateFrom[] = {"aadjpercmstpsraswrfldleft", 0.02};
			InterpolateTo[] = {"aadjpercmstpsraswrfldleft", 0.02};
		};

		class aadjpknlmstpsraswrfldup;
		class aadjpknlmstpsraswrfldup_cse_deployed : aadjpknlmstpsraswrfldup {
			aimPrecision = CSE_SWAY_DEPLOYED;
			actions = "RifleAdjustFKneelActions_cse_deployed";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjpknlmstpsraswrfldup_cse_deployed", 0.02};
			ConnectFrom[] = {"aadjpknlmstpsraswrfldup_cse_deployed", 0.02};
			InterpolateFrom[] = {"aadjpknlmstpsraswrfldup", 0.02};
			InterpolateTo[] = {"aadjpknlmstpsraswrfldup", 0.02};
		};

		class amovpknlmstpsraswrfldnon;
		class amovpknlmstpsraswrfldnon_cse_deployed : amovpknlmstpsraswrfldnon {
			aimPrecision = CSE_SWAY_DEPLOYED;
			actions = "RifleKneelActions_cse_deployed";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"amovpknlmstpsraswrfldnon_cse_deployed", 0.02};
			ConnectFrom[] = {"amovpknlmstpsraswrfldnon_cse_deployed", 0.02};
			InterpolateFrom[] = {"amovpknlmstpsraswrfldnon", 0.02};
			InterpolateTo[] = {"amovpknlmstpsraswrfldnon", 0.02};
		};

		class aadjpknlmstpsraswrflddown;
		class aadjpknlmstpsraswrflddown_cse_deployed : aadjpknlmstpsraswrflddown {
			aimPrecision = CSE_SWAY_DEPLOYED;
			actions = "RifleAdjustBKneelActions_cse_deployed";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjpknlmstpsraswrflddown_cse_deployed", 0.02};
			ConnectFrom[] = {"aadjpknlmstpsraswrflddown_cse_deployed", 0.02};
			InterpolateFrom[] = {"aadjpknlmstpsraswrflddown", 0.02};
			InterpolateTo[] = {"aadjpknlmstpsraswrflddown", 0.02};
		};

		class aadjpknlmstpsraswrfldleft;
		class aadjpknlmstpsraswrfldleft_cse_deployed : aadjpknlmstpsraswrfldleft {
			aimPrecision = CSE_SWAY_DEPLOYED;
			actions = "RifleAdjustLKneelActions_cse_deployed";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjpknlmstpsraswrfldleft_cse_deployed", 0.02};
			ConnectFrom[] = {"aadjpknlmstpsraswrfldleft_cse_deployed", 0.02};
			InterpolateFrom[] = {"aadjpknlmstpsraswrfldleft", 0.02};
			InterpolateTo[] = {"aadjpknlmstpsraswrfldleft", 0.02};
		};

		class aadjpknlmstpsraswrfldright;
		class aadjpknlmstpsraswrfldright_cse_deployed : aadjpknlmstpsraswrfldright {
			aimPrecision = CSE_SWAY_DEPLOYED;
			actions = "RifleAdjustRKneelActions_cse_deployed";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjpknlmstpsraswrfldright_cse_deployed", 0.02};
			ConnectFrom[] = {"aadjpknlmstpsraswrfldright_cse_deployed", 0.02};
			InterpolateFrom[] = {"aadjpknlmstpsraswrfldright", 0.02};
			InterpolateTo[] = {"aadjpknlmstpsraswrfldright", 0.02};
		};

		class aadjppnemstpsraswrfldup;
		class aadjppnemstpsraswrfldup_cse_deployed : aadjppnemstpsraswrfldup {
			aimPrecision = CSE_SWAY_DEPLOYED_PRONE;
			actions = "RifleAdjustFProneActions_cse_deployed";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjppnemstpsraswrfldup_cse_deployed", 0.02};
			ConnectFrom[] = {"aadjppnemstpsraswrfldup_cse_deployed", 0.02};
			InterpolateFrom[] = {"aadjppnemstpsraswrfldup", 0.02};
			InterpolateTo[] = {"aadjppnemstpsraswrfldup", 0.02};
		};

		class amovppnemstpsraswrfldnon;
		class amovppnemstpsraswrfldnon_cse_deployed : amovppnemstpsraswrfldnon {
			aimPrecision = CSE_SWAY_DEPLOYED_PRONE;
			actions = "RifleProneActions_cse_deployed";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"amovppnemstpsraswrfldnon_cse_deployed", 0.02};
			ConnectFrom[] = {"amovppnemstpsraswrfldnon_cse_deployed", 0.02};
			InterpolateFrom[] = {"amovppnemstpsraswrfldnon", 0.02};
			InterpolateTo[] = {"amovppnemstpsraswrfldnon", 0.02};
		};

		class AmovPercMstpSrasWrflDnon_cse_rested : AmovPercMstpSrasWrflDnon {
			aimPrecision = CSE_SWAY_RESTED;
			actions = "RifleStandActions_cse_rested";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"AmovPercMstpSrasWrflDnon_cse_rested", 0.02};
			ConnectFrom[] = {"AmovPercMstpSrasWrflDnon_cse_rested", 0.02};
			InterpolateFrom[] = {"AmovPercMstpSrasWrflDnon", 0.02};
			InterpolateTo[] = {"AmovPercMstpSrasWrflDnon", 0.02};
		};

		class aadjpercmstpsraswrfldup_cse_rested : aadjpercmstpsraswrfldup {
			aimPrecision = CSE_SWAY_RESTED;
			actions = "RifleAdjustFStandActions_cse_rested";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjpercmstpsraswrfldup_cse_rested", 0.02};
			ConnectFrom[] = {"aadjpercmstpsraswrfldup_cse_rested", 0.02};
			InterpolateFrom[] = {"aadjpercmstpsraswrfldup", 0.02};
			InterpolateTo[] = {"aadjpercmstpsraswrfldup", 0.02};
		};

		class aadjpercmstpsraswrflddown_cse_rested : aadjpercmstpsraswrflddown {
			aimPrecision = CSE_SWAY_RESTED;
			actions = "RifleAdjustBStandActions_cse_rested";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjpercmstpsraswrflddown_cse_rested", 0.02};
			ConnectFrom[] = {"aadjpercmstpsraswrflddown_cse_rested", 0.02};
			InterpolateFrom[] = {"aadjpercmstpsraswrflddown", 0.02};
			InterpolateTo[] = {"aadjpercmstpsraswrflddown", 0.02};
		};

		class aadjpercmstpsraswrfldright_cse_rested : aadjpercmstpsraswrfldright {
			aimPrecision = CSE_SWAY_RESTED;
			actions = "RifleAdjustRStandActions_cse_rested";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjpercmstpsraswrfldright_cse_rested", 0.02};
			ConnectFrom[] = {"aadjpercmstpsraswrfldright_cse_rested", 0.02};
			InterpolateFrom[] = {"aadjpercmstpsraswrfldright", 0.02};
			InterpolateTo[] = {"aadjpercmstpsraswrfldright", 0.02};
		};

		class aadjpercmstpsraswrfldleft_cse_rested : aadjpercmstpsraswrfldleft {
			aimPrecision = CSE_SWAY_RESTED;
			actions = "RifleAdjustLStandActions_cse_rested";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjpercmstpsraswrfldleft_cse_rested", 0.02};
			ConnectFrom[] = {"aadjpercmstpsraswrfldleft_cse_rested", 0.02};
			InterpolateFrom[] = {"aadjpercmstpsraswrfldleft", 0.02};
			InterpolateTo[] = {"aadjpercmstpsraswrfldleft", 0.02};
		};

		class aadjpknlmstpsraswrfldup_cse_rested : aadjpknlmstpsraswrfldup {
			aimPrecision = CSE_SWAY_RESTED;
			actions = "RifleAdjustFKneelActions_cse_rested";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjpknlmstpsraswrfldup_cse_rested", 0.02};
			ConnectFrom[] = {"aadjpknlmstpsraswrfldup_cse_rested", 0.02};
			InterpolateFrom[] = {"aadjpknlmstpsraswrfldup", 0.02};
			InterpolateTo[] = {"aadjpknlmstpsraswrfldup", 0.02};
		};

		class amovpknlmstpsraswrfldnon_cse_rested : amovpknlmstpsraswrfldnon {
			aimPrecision = CSE_SWAY_RESTED;
			actions = "RifleKneelActions_cse_rested";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"amovpknlmstpsraswrfldnon_cse_rested", 0.02};
			ConnectFrom[] = {"amovpknlmstpsraswrfldnon_cse_rested", 0.02};
			InterpolateFrom[] = {"amovpknlmstpsraswrfldnon", 0.02};
			InterpolateTo[] = {"amovpknlmstpsraswrfldnon", 0.02};
		};

		class aadjpknlmstpsraswrflddown_cse_rested : aadjpknlmstpsraswrflddown {
			aimPrecision = CSE_SWAY_RESTED;
			actions = "RifleAdjustBKneelActions_cse_rested";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjpknlmstpsraswrflddown_cse_rested", 0.02};
			ConnectFrom[] = {"aadjpknlmstpsraswrflddown_cse_rested", 0.02};
			InterpolateFrom[] = {"aadjpknlmstpsraswrflddown", 0.02};
			InterpolateTo[] = {"aadjpknlmstpsraswrflddown", 0.02};
		};

		class aadjpknlmstpsraswrfldleft_cse_rested : aadjpknlmstpsraswrfldleft {
			aimPrecision = CSE_SWAY_RESTED;
			actions = "RifleAdjustLKneelActions_cse_rested";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjpknlmstpsraswrfldleft_cse_rested", 0.02};
			ConnectFrom[] = {"aadjpknlmstpsraswrfldleft_cse_rested", 0.02};
			InterpolateFrom[] = {"aadjpknlmstpsraswrfldleft", 0.02};
			InterpolateTo[] = {"aadjpknlmstpsraswrfldleft", 0.02};
		};

		class aadjpknlmstpsraswrfldright_cse_rested : aadjpknlmstpsraswrfldright {
			aimPrecision = CSE_SWAY_RESTED;
			actions = "RifleAdjustRKneelActions_cse_rested";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjpknlmstpsraswrfldright_cse_rested", 0.02};
			ConnectFrom[] = {"aadjpknlmstpsraswrfldright_cse_rested", 0.02};
			InterpolateFrom[] = {"aadjpknlmstpsraswrfldright", 0.02};
			InterpolateTo[] = {"aadjpknlmstpsraswrfldright", 0.02};
		};

		class aadjppnemstpsraswrfldup_cse_rested : aadjppnemstpsraswrfldup {
			aimPrecision = CSE_SWAY_RESTED_PRONE;
			actions = "RifleAdjustFProneActions_cse_rested";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjppnemstpsraswrfldup_cse_rested", 0.02};
			ConnectFrom[] = {"aadjppnemstpsraswrfldup_cse_rested", 0.02};
			InterpolateFrom[] = {"aadjppnemstpsraswrfldup", 0.02};
			InterpolateTo[] = {"aadjppnemstpsraswrfldup", 0.02};
		};
		
		class aadjppnemstpsraswrfldleft;
		class aadjppnemstpsraswrfldleft_cse_rested : aadjppnemstpsraswrfldleft {
			aimPrecision = CSE_SWAY_RESTED_PRONE;
			actions = "RifleAdjustLProneActions_cse_rested";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjppnemstpsraswrfldleft_cse_rested", 0.02};
			ConnectFrom[] = {"aadjppnemstpsraswrfldleft_cse_rested", 0.02};
			InterpolateFrom[] = {"aadjppnemstpsraswrfldleft", 0.02};
			InterpolateTo[] = {"aadjppnemstpsraswrfldleft", 0.02};
		};
		
		class aadjppnemstpsraswrfldright;
		class aadjppnemstpsraswrfldright_cse_rested : aadjppnemstpsraswrfldright {
			aimPrecision = CSE_SWAY_RESTED_PRONE;
			actions = "RifleAdjustRProneActions_cse_rested";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjppnemstpsraswrfldright_cse_rested", 0.02};
			ConnectFrom[] = {"aadjppnemstpsraswrfldright_cse_rested", 0.02};
			InterpolateFrom[] = {"aadjppnemstpsraswrfldright", 0.02};
			InterpolateTo[] = {"aadjppnemstpsraswrfldright", 0.02};
		};
		
		class aadjppnemstpsraswrflddown;
		class aadjppnemstpsraswrflddown_cse_rested : aadjppnemstpsraswrflddown {
			aimPrecision = CSE_SWAY_RESTED_PRONE;
			actions = "RifleAdjustBProneActions_cse_rested";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjppnemstpsraswrflddown_cse_rested", 0.02};
			ConnectFrom[] = {"aadjppnemstpsraswrflddown_cse_rested", 0.02};
			InterpolateFrom[] = {"aadjppnemstpsraswrflddown", 0.02};
			InterpolateTo[] = {"aadjppnemstpsraswrflddown", 0.02};
		};
		
		class amovppnemstpsraswrfldnon_cse_rested : amovppnemstpsraswrfldnon {
			aimPrecision = CSE_SWAY_RESTED_PRONE;
			actions = "RifleProneActions_cse_rested";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"amovppnemstpsraswrfldnon_cse_rested", 0.02};
			ConnectFrom[] = {"amovppnemstpsraswrfldnon_cse_rested", 0.02};
			InterpolateFrom[] = {"amovppnemstpsraswrfldnon", 0.02};
			InterpolateTo[] = {"amovppnemstpsraswrfldnon", 0.02};
		};
	};
};