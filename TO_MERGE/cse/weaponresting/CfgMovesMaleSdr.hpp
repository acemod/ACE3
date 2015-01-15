// Adpated from: https://github.com/Taosenai/tmr/blob/master/tmr_autorest/config.cpp

#define ACE_SWAY_DEPLOYED       0.06
#define ACE_SWAY_DEPLOYED_PRONE 0.03
#define ACE_SWAY_RESTED         0.30
#define ACE_SWAY_RESTED_PRONE   0.10

class CfgMovesMaleSdr : CfgMovesBasic {
	class States {
		class AmovPercMstpSrasWrflDnon;
		class AmovPercMstpSrasWrflDnon_ACE_deployed : AmovPercMstpSrasWrflDnon {
			aimPrecision = ACE_SWAY_DEPLOYED;
			actions = "RifleStandActions_ACE_deployed";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"AmovPercMstpSrasWrflDnon_ACE_deployed", 0.02};
			ConnectFrom[] = {"AmovPercMstpSrasWrflDnon_ACE_deployed", 0.02};
			InterpolateFrom[] = {"AmovPercMstpSrasWrflDnon", 0.02};
			InterpolateTo[] = {"AmovPercMstpSrasWrflDnon", 0.02};
		};

		class aadjpercmstpsraswrfldup;
		class aadjpercmstpsraswrfldup_ACE_deployed : aadjpercmstpsraswrfldup {
			aimPrecision = ACE_SWAY_DEPLOYED;
			actions = "RifleAdjustFStandActions_ACE_deployed";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjpercmstpsraswrfldup_ACE_deployed", 0.02};
			ConnectFrom[] = {"aadjpercmstpsraswrfldup_ACE_deployed", 0.02};
			InterpolateFrom[] = {"aadjpercmstpsraswrfldup", 0.02};
			InterpolateTo[] = {"aadjpercmstpsraswrfldup", 0.02};
		};

		class aadjpercmstpsraswrflddown;
		class aadjpercmstpsraswrflddown_ACE_deployed : aadjpercmstpsraswrflddown {
			aimPrecision = ACE_SWAY_DEPLOYED;
			actions = "RifleAdjustBStandActions_ACE_deployed";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjpercmstpsraswrflddown_ACE_deployed", 0.02};
			ConnectFrom[] = {"aadjpercmstpsraswrflddown_ACE_deployed", 0.02};
			InterpolateFrom[] = {"aadjpercmstpsraswrflddown", 0.02};
			InterpolateTo[] = {"aadjpercmstpsraswrflddown", 0.02};
		};

		class aadjpercmstpsraswrfldright;
		class aadjpercmstpsraswrfldright_ACE_deployed : aadjpercmstpsraswrfldright {
			aimPrecision = ACE_SWAY_DEPLOYED;
			actions = "RifleAdjustRStandActions_ACE_deployed";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjpercmstpsraswrfldright_ACE_deployed", 0.02};
			ConnectFrom[] = {"aadjpercmstpsraswrfldright_ACE_deployed", 0.02};
			InterpolateFrom[] = {"aadjpercmstpsraswrfldright", 0.02};
			InterpolateTo[] = {"aadjpercmstpsraswrfldright", 0.02};
		};

		class aadjpercmstpsraswrfldleft;
		class aadjpercmstpsraswrfldleft_ACE_deployed : aadjpercmstpsraswrfldleft {
			aimPrecision = ACE_SWAY_DEPLOYED;
			actions = "RifleAdjustLStandActions_ACE_deployed";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjpercmstpsraswrfldleft_ACE_deployed", 0.02};
			ConnectFrom[] = {"aadjpercmstpsraswrfldleft_ACE_deployed", 0.02};
			InterpolateFrom[] = {"aadjpercmstpsraswrfldleft", 0.02};
			InterpolateTo[] = {"aadjpercmstpsraswrfldleft", 0.02};
		};

		class aadjpknlmstpsraswrfldup;
		class aadjpknlmstpsraswrfldup_ACE_deployed : aadjpknlmstpsraswrfldup {
			aimPrecision = ACE_SWAY_DEPLOYED;
			actions = "RifleAdjustFKneelActions_ACE_deployed";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjpknlmstpsraswrfldup_ACE_deployed", 0.02};
			ConnectFrom[] = {"aadjpknlmstpsraswrfldup_ACE_deployed", 0.02};
			InterpolateFrom[] = {"aadjpknlmstpsraswrfldup", 0.02};
			InterpolateTo[] = {"aadjpknlmstpsraswrfldup", 0.02};
		};

		class amovpknlmstpsraswrfldnon;
		class amovpknlmstpsraswrfldnon_ACE_deployed : amovpknlmstpsraswrfldnon {
			aimPrecision = ACE_SWAY_DEPLOYED;
			actions = "RifleKneelActions_ACE_deployed";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"amovpknlmstpsraswrfldnon_ACE_deployed", 0.02};
			ConnectFrom[] = {"amovpknlmstpsraswrfldnon_ACE_deployed", 0.02};
			InterpolateFrom[] = {"amovpknlmstpsraswrfldnon", 0.02};
			InterpolateTo[] = {"amovpknlmstpsraswrfldnon", 0.02};
		};

		class aadjpknlmstpsraswrflddown;
		class aadjpknlmstpsraswrflddown_ACE_deployed : aadjpknlmstpsraswrflddown {
			aimPrecision = ACE_SWAY_DEPLOYED;
			actions = "RifleAdjustBKneelActions_ACE_deployed";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjpknlmstpsraswrflddown_ACE_deployed", 0.02};
			ConnectFrom[] = {"aadjpknlmstpsraswrflddown_ACE_deployed", 0.02};
			InterpolateFrom[] = {"aadjpknlmstpsraswrflddown", 0.02};
			InterpolateTo[] = {"aadjpknlmstpsraswrflddown", 0.02};
		};

		class aadjpknlmstpsraswrfldleft;
		class aadjpknlmstpsraswrfldleft_ACE_deployed : aadjpknlmstpsraswrfldleft {
			aimPrecision = ACE_SWAY_DEPLOYED;
			actions = "RifleAdjustLKneelActions_ACE_deployed";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjpknlmstpsraswrfldleft_ACE_deployed", 0.02};
			ConnectFrom[] = {"aadjpknlmstpsraswrfldleft_ACE_deployed", 0.02};
			InterpolateFrom[] = {"aadjpknlmstpsraswrfldleft", 0.02};
			InterpolateTo[] = {"aadjpknlmstpsraswrfldleft", 0.02};
		};

		class aadjpknlmstpsraswrfldright;
		class aadjpknlmstpsraswrfldright_ACE_deployed : aadjpknlmstpsraswrfldright {
			aimPrecision = ACE_SWAY_DEPLOYED;
			actions = "RifleAdjustRKneelActions_ACE_deployed";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjpknlmstpsraswrfldright_ACE_deployed", 0.02};
			ConnectFrom[] = {"aadjpknlmstpsraswrfldright_ACE_deployed", 0.02};
			InterpolateFrom[] = {"aadjpknlmstpsraswrfldright", 0.02};
			InterpolateTo[] = {"aadjpknlmstpsraswrfldright", 0.02};
		};

		class aadjppnemstpsraswrfldup;
		class aadjppnemstpsraswrfldup_ACE_deployed : aadjppnemstpsraswrfldup {
			aimPrecision = ACE_SWAY_DEPLOYED_PRONE;
			actions = "RifleAdjustFProneActions_ACE_deployed";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjppnemstpsraswrfldup_ACE_deployed", 0.02};
			ConnectFrom[] = {"aadjppnemstpsraswrfldup_ACE_deployed", 0.02};
			InterpolateFrom[] = {"aadjppnemstpsraswrfldup", 0.02};
			InterpolateTo[] = {"aadjppnemstpsraswrfldup", 0.02};
		};

		class amovppnemstpsraswrfldnon;
		class amovppnemstpsraswrfldnon_ACE_deployed : amovppnemstpsraswrfldnon {
			aimPrecision = ACE_SWAY_DEPLOYED_PRONE;
			actions = "RifleProneActions_ACE_deployed";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"amovppnemstpsraswrfldnon_ACE_deployed", 0.02};
			ConnectFrom[] = {"amovppnemstpsraswrfldnon_ACE_deployed", 0.02};
			InterpolateFrom[] = {"amovppnemstpsraswrfldnon", 0.02};
			InterpolateTo[] = {"amovppnemstpsraswrfldnon", 0.02};
		};

		class AmovPercMstpSrasWrflDnon_ACE_rested : AmovPercMstpSrasWrflDnon {
			aimPrecision = ACE_SWAY_RESTED;
			actions = "RifleStandActions_ACE_rested";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"AmovPercMstpSrasWrflDnon_ACE_rested", 0.02};
			ConnectFrom[] = {"AmovPercMstpSrasWrflDnon_ACE_rested", 0.02};
			InterpolateFrom[] = {"AmovPercMstpSrasWrflDnon", 0.02};
			InterpolateTo[] = {"AmovPercMstpSrasWrflDnon", 0.02};
		};

		class aadjpercmstpsraswrfldup_ACE_rested : aadjpercmstpsraswrfldup {
			aimPrecision = ACE_SWAY_RESTED;
			actions = "RifleAdjustFStandActions_ACE_rested";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjpercmstpsraswrfldup_ACE_rested", 0.02};
			ConnectFrom[] = {"aadjpercmstpsraswrfldup_ACE_rested", 0.02};
			InterpolateFrom[] = {"aadjpercmstpsraswrfldup", 0.02};
			InterpolateTo[] = {"aadjpercmstpsraswrfldup", 0.02};
		};

		class aadjpercmstpsraswrflddown_ACE_rested : aadjpercmstpsraswrflddown {
			aimPrecision = ACE_SWAY_RESTED;
			actions = "RifleAdjustBStandActions_ACE_rested";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjpercmstpsraswrflddown_ACE_rested", 0.02};
			ConnectFrom[] = {"aadjpercmstpsraswrflddown_ACE_rested", 0.02};
			InterpolateFrom[] = {"aadjpercmstpsraswrflddown", 0.02};
			InterpolateTo[] = {"aadjpercmstpsraswrflddown", 0.02};
		};

		class aadjpercmstpsraswrfldright_ACE_rested : aadjpercmstpsraswrfldright {
			aimPrecision = ACE_SWAY_RESTED;
			actions = "RifleAdjustRStandActions_ACE_rested";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjpercmstpsraswrfldright_ACE_rested", 0.02};
			ConnectFrom[] = {"aadjpercmstpsraswrfldright_ACE_rested", 0.02};
			InterpolateFrom[] = {"aadjpercmstpsraswrfldright", 0.02};
			InterpolateTo[] = {"aadjpercmstpsraswrfldright", 0.02};
		};

		class aadjpercmstpsraswrfldleft_ACE_rested : aadjpercmstpsraswrfldleft {
			aimPrecision = ACE_SWAY_RESTED;
			actions = "RifleAdjustLStandActions_ACE_rested";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjpercmstpsraswrfldleft_ACE_rested", 0.02};
			ConnectFrom[] = {"aadjpercmstpsraswrfldleft_ACE_rested", 0.02};
			InterpolateFrom[] = {"aadjpercmstpsraswrfldleft", 0.02};
			InterpolateTo[] = {"aadjpercmstpsraswrfldleft", 0.02};
		};

		class aadjpknlmstpsraswrfldup_ACE_rested : aadjpknlmstpsraswrfldup {
			aimPrecision = ACE_SWAY_RESTED;
			actions = "RifleAdjustFKneelActions_ACE_rested";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjpknlmstpsraswrfldup_ACE_rested", 0.02};
			ConnectFrom[] = {"aadjpknlmstpsraswrfldup_ACE_rested", 0.02};
			InterpolateFrom[] = {"aadjpknlmstpsraswrfldup", 0.02};
			InterpolateTo[] = {"aadjpknlmstpsraswrfldup", 0.02};
		};

		class amovpknlmstpsraswrfldnon_ACE_rested : amovpknlmstpsraswrfldnon {
			aimPrecision = ACE_SWAY_RESTED;
			actions = "RifleKneelActions_ACE_rested";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"amovpknlmstpsraswrfldnon_ACE_rested", 0.02};
			ConnectFrom[] = {"amovpknlmstpsraswrfldnon_ACE_rested", 0.02};
			InterpolateFrom[] = {"amovpknlmstpsraswrfldnon", 0.02};
			InterpolateTo[] = {"amovpknlmstpsraswrfldnon", 0.02};
		};

		class aadjpknlmstpsraswrflddown_ACE_rested : aadjpknlmstpsraswrflddown {
			aimPrecision = ACE_SWAY_RESTED;
			actions = "RifleAdjustBKneelActions_ACE_rested";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjpknlmstpsraswrflddown_ACE_rested", 0.02};
			ConnectFrom[] = {"aadjpknlmstpsraswrflddown_ACE_rested", 0.02};
			InterpolateFrom[] = {"aadjpknlmstpsraswrflddown", 0.02};
			InterpolateTo[] = {"aadjpknlmstpsraswrflddown", 0.02};
		};

		class aadjpknlmstpsraswrfldleft_ACE_rested : aadjpknlmstpsraswrfldleft {
			aimPrecision = ACE_SWAY_RESTED;
			actions = "RifleAdjustLKneelActions_ACE_rested";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjpknlmstpsraswrfldleft_ACE_rested", 0.02};
			ConnectFrom[] = {"aadjpknlmstpsraswrfldleft_ACE_rested", 0.02};
			InterpolateFrom[] = {"aadjpknlmstpsraswrfldleft", 0.02};
			InterpolateTo[] = {"aadjpknlmstpsraswrfldleft", 0.02};
		};

		class aadjpknlmstpsraswrfldright_ACE_rested : aadjpknlmstpsraswrfldright {
			aimPrecision = ACE_SWAY_RESTED;
			actions = "RifleAdjustRKneelActions_ACE_rested";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjpknlmstpsraswrfldright_ACE_rested", 0.02};
			ConnectFrom[] = {"aadjpknlmstpsraswrfldright_ACE_rested", 0.02};
			InterpolateFrom[] = {"aadjpknlmstpsraswrfldright", 0.02};
			InterpolateTo[] = {"aadjpknlmstpsraswrfldright", 0.02};
		};

		class aadjppnemstpsraswrfldup_ACE_rested : aadjppnemstpsraswrfldup {
			aimPrecision = ACE_SWAY_RESTED_PRONE;
			actions = "RifleAdjustFProneActions_ACE_rested";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjppnemstpsraswrfldup_ACE_rested", 0.02};
			ConnectFrom[] = {"aadjppnemstpsraswrfldup_ACE_rested", 0.02};
			InterpolateFrom[] = {"aadjppnemstpsraswrfldup", 0.02};
			InterpolateTo[] = {"aadjppnemstpsraswrfldup", 0.02};
		};

		class aadjppnemstpsraswrfldleft;
		class aadjppnemstpsraswrfldleft_ACE_rested : aadjppnemstpsraswrfldleft {
			aimPrecision = ACE_SWAY_RESTED_PRONE;
			actions = "RifleAdjustLProneActions_ACE_rested";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjppnemstpsraswrfldleft_ACE_rested", 0.02};
			ConnectFrom[] = {"aadjppnemstpsraswrfldleft_ACE_rested", 0.02};
			InterpolateFrom[] = {"aadjppnemstpsraswrfldleft", 0.02};
			InterpolateTo[] = {"aadjppnemstpsraswrfldleft", 0.02};
		};

		class aadjppnemstpsraswrfldright;
		class aadjppnemstpsraswrfldright_ACE_rested : aadjppnemstpsraswrfldright {
			aimPrecision = ACE_SWAY_RESTED_PRONE;
			actions = "RifleAdjustRProneActions_ACE_rested";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjppnemstpsraswrfldright_ACE_rested", 0.02};
			ConnectFrom[] = {"aadjppnemstpsraswrfldright_ACE_rested", 0.02};
			InterpolateFrom[] = {"aadjppnemstpsraswrfldright", 0.02};
			InterpolateTo[] = {"aadjppnemstpsraswrfldright", 0.02};
		};

		class aadjppnemstpsraswrflddown;
		class aadjppnemstpsraswrflddown_ACE_rested : aadjppnemstpsraswrflddown {
			aimPrecision = ACE_SWAY_RESTED_PRONE;
			actions = "RifleAdjustBProneActions_ACE_rested";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"aadjppnemstpsraswrflddown_ACE_rested", 0.02};
			ConnectFrom[] = {"aadjppnemstpsraswrflddown_ACE_rested", 0.02};
			InterpolateFrom[] = {"aadjppnemstpsraswrflddown", 0.02};
			InterpolateTo[] = {"aadjppnemstpsraswrflddown", 0.02};
		};

		class amovppnemstpsraswrfldnon_ACE_rested : amovppnemstpsraswrfldnon {
			aimPrecision = ACE_SWAY_RESTED_PRONE;
			actions = "RifleProneActions_ACE_rested";
			aiming = "aimingLying";
			speed = 0.01;
			onLandEnd = true;
			onLandBeg = true;

			ConnectTo[] = {"amovppnemstpsraswrfldnon_ACE_rested", 0.02};
			ConnectFrom[] = {"amovppnemstpsraswrfldnon_ACE_rested", 0.02};
			InterpolateFrom[] = {"amovppnemstpsraswrfldnon", 0.02};
			InterpolateTo[] = {"amovppnemstpsraswrfldnon", 0.02};
		};
	};
};