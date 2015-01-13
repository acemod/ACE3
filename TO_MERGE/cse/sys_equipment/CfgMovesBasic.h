// Adpated from: https://github.com/Taosenai/tmr/blob/master/tmr_autorest/config.cpp

#define CSE_DEPLOYED_TURNSPEED 0.1

class CfgMovesBasic {
	class Default;

	class Actions {
		class RifleStandActions;
		class RifleStandActions_cse_deployed : RifleStandActions {
			stop = "AmovPercMstpSrasWrflDnon_cse_deployed";
			default = "AmovPercMstpSrasWrflDnon_cse_deployed";
			turnL = "AmovPercMstpSrasWrflDnon_cse_deployed";
			turnR = "AmovPercMstpSrasWrflDnon_cse_deployed";
			turnSpeed = CSE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustLStandActions;
		class RifleAdjustLStandActions_cse_deployed : RifleAdjustLStandActions {
			stop = "AadjPercMstpSrasWrflDleft_cse_deployed";
			default = "AadjPercMstpSrasWrflDleft_cse_deployed";
			AdjustL = "AadjPercMstpSrasWrflDleft_cse_deployed";
			turnL = "AadjPercMstpSrasWrflDleft_cse_deployed";
			turnR = "AadjPercMstpSrasWrflDleft_cse_deployed";
			turnSpeed = CSE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustRStandActions;
		class RifleAdjustRStandActions_cse_deployed : RifleAdjustRStandActions {
			stop = "AadjPercMstpSrasWrflDright_cse_deployed";
			default = "AadjPercMstpSrasWrflDright_cse_deployed";
			AdjustRight = "AadjPercMstpSrasWrflDright_cse_deployed";
			turnL = "AadjPercMstpSrasWrflDright_cse_deployed";
			turnR = "AadjPercMstpSrasWrflDright_cse_deployed";
			turnSpeed = CSE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustFStandActions;
		class RifleAdjustFStandActions_cse_deployed : RifleAdjustFStandActions {
			stop = "AadjPercMstpSrasWrflDup_cse_deployed";
			default = "AadjPercMstpSrasWrflDup_cse_deployed";
			AdjustF = "AadjPercMstpSrasWrflDup_cse_deployed";
			turnL = "AadjPercMstpSrasWrflDup_cse_deployed";
			turnR = "AadjPercMstpSrasWrflDup_cse_deployed";
			turnSpeed = CSE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustBStandActions;
		class RifleAdjustBStandActions_cse_deployed : RifleAdjustBStandActions {
			stop = "AadjPercMstpSrasWrflDdown_cse_deployed";
			default = "AadjPercMstpSrasWrflDdown_cse_deployed";
			AdjustB = "AadjPercMstpSrasWrflDdown_cse_deployed";
			turnR = "AadjPercMstpSrasWrflDdown_cse_deployed";
			turnL = "AadjPercMstpSrasWrflDdown_cse_deployed";
			turnSpeed = CSE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustLKneelActions;
		class RifleAdjustLKneelActions_cse_deployed : RifleAdjustLKneelActions {
			stop = "AadjPknlMstpSrasWrflDleft_cse_deployed";
			default = "AadjPknlMstpSrasWrflDleft_cse_deployed";
			turnL = "AadjPknlMstpSrasWrflDleft_cse_deployed";
			turnR = "AadjPknlMstpSrasWrflDleft_cse_deployed";
			turnSpeed = CSE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustRKneelActions;
		class RifleAdjustRKneelActions_cse_deployed : RifleAdjustRKneelActions {
			stop = "AadjPknlMstpSrasWrflDright_cse_deployed";
			default = "AadjPknlMstpSrasWrflDright_cse_deployed";
			turnL = "AadjPknlMstpSrasWrflDright_cse_deployed";
			turnR = "AadjPknlMstpSrasWrflDright_cse_deployed";
			turnSpeed = CSE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustFKneelActions;
		class RifleAdjustFKneelActions_cse_deployed : RifleAdjustFKneelActions {
			stop = "AadjPknlMstpSrasWrflDup_cse_deployed";
			default = "AadjPknlMstpSrasWrflDup_cse_deployed";
			turnL = "AadjPknlMstpSrasWrflDup_cse_deployed";
			turnR = "AadjPknlMstpSrasWrflDup_cse_deployed";
			turnSpeed = CSE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustBKneelActions;
		class RifleAdjustBKneelActions_cse_deployed : RifleAdjustBKneelActions {
			stop = "AadjPknlMstpSrasWrflDdown_cse_deployed";
			default = "AadjPknlMstpSrasWrflDdown_cse_deployed";
			turnL = "AadjPknlMstpSrasWrflDdown_cse_deployed";
			turnR = "AadjPknlMstpSrasWrflDdown_cse_deployed";
			turnSpeed = CSE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleKneelActions;
		class RifleKneelActions_cse_deployed : RifleKneelActions {
			stop = "AmovPknlMstpSrasWrflDnon_cse_deployed";
			default = "AmovPknlMstpSrasWrflDnon_cse_deployed";
			crouch = "AmovPknlMstpSrasWrflDnon_cse_deployed";
			turnL = "AmovPknlMstpSrasWrflDnon_cse_deployed";
			turnR = "AmovPknlMstpSrasWrflDnon_cse_deployed";
			turnSpeed = CSE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleProneActions;
		class RifleProneActions_cse_deployed : RifleProneActions {
			stop = "AmovPpneMstpSrasWrflDnon_cse_deployed";
			default = "AmovPpneMstpSrasWrflDnon_cse_deployed";
			turnL = "AmovPpneMstpSrasWrflDnon_cse_deployed";
			turnR = "AmovPpneMstpSrasWrflDnon_cse_deployed";
			turnSpeed = CSE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustFProneActions;
		class RifleAdjustFProneActions_cse_deployed : RifleAdjustFProneActions {
			stop = "aadjppnemstpsraswrfldup_cse_deployed";
			default = "aadjppnemstpsraswrfldup_cse_deployed";
			turnL = "aadjppnemstpsraswrfldup_cse_deployed";
			turnR = "aadjppnemstpsraswrfldup_cse_deployed";
			turnSpeed = CSE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleStandActions_cse_rested : RifleStandActions {
			stop = "AmovPercMstpSrasWrflDnon_cse_rested";
			default = "AmovPercMstpSrasWrflDnon_cse_rested";
			turnL = "AmovPercMstpSrasWrflDnon_cse_rested";
			turnR = "AmovPercMstpSrasWrflDnon_cse_rested";
			turnSpeed = CSE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustLStandActions_cse_rested : RifleAdjustLStandActions {
			stop = "AadjPercMstpSrasWrflDleft_cse_rested";
			default = "AadjPercMstpSrasWrflDleft_cse_rested";
			AdjustL = "AadjPercMstpSrasWrflDleft_cse_rested";
			turnL = "AadjPercMstpSrasWrflDleft_cse_rested";
			turnR = "AadjPercMstpSrasWrflDleft_cse_rested";
			turnSpeed = CSE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustRStandActions_cse_rested : RifleAdjustRStandActions {
			stop = "AadjPercMstpSrasWrflDright_cse_rested";
			default = "AadjPercMstpSrasWrflDright_cse_rested";
			AdjustRight = "AadjPercMstpSrasWrflDright_cse_rested";
			turnL = "AadjPercMstpSrasWrflDright_cse_rested";
			turnR = "AadjPercMstpSrasWrflDright_cse_rested";
			turnSpeed = CSE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustFStandActions_cse_rested : RifleAdjustFStandActions {
			stop = "AadjPercMstpSrasWrflDup_cse_rested";
			default = "AadjPercMstpSrasWrflDup_cse_rested";
			AdjustF = "AadjPercMstpSrasWrflDup_cse_rested";
			turnL = "AadjPercMstpSrasWrflDup_cse_rested";
			turnR = "AadjPercMstpSrasWrflDup_cse_rested";
			turnSpeed = CSE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustBStandActions_cse_rested : RifleAdjustBStandActions {
			stop = "AadjPercMstpSrasWrflDdown_cse_rested";
			default = "AadjPercMstpSrasWrflDdown_cse_rested";
			AdjustB = "AadjPercMstpSrasWrflDdown_cse_rested";
			turnR = "AadjPercMstpSrasWrflDdown_cse_rested";
			turnL = "AadjPercMstpSrasWrflDdown_cse_rested";
			turnSpeed = CSE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustLKneelActions_cse_rested : RifleAdjustLKneelActions {
			stop = "AadjPknlMstpSrasWrflDleft_cse_rested";
			default = "AadjPknlMstpSrasWrflDleft_cse_rested";
			turnL = "AadjPknlMstpSrasWrflDleft_cse_rested";
			turnR = "AadjPknlMstpSrasWrflDleft_cse_rested";
			turnSpeed = CSE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustRKneelActions_cse_rested : RifleAdjustRKneelActions {
			stop = "AadjPknlMstpSrasWrflDright_cse_rested";
			default = "AadjPknlMstpSrasWrflDright_cse_rested";
			turnL = "AadjPknlMstpSrasWrflDright_cse_rested";
			turnR = "AadjPknlMstpSrasWrflDright_cse_rested";
			turnSpeed = CSE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustFKneelActions_cse_rested : RifleAdjustFKneelActions {
			stop = "AadjPknlMstpSrasWrflDup_cse_rested";
			default = "AadjPknlMstpSrasWrflDup_cse_rested";
			turnL = "AadjPknlMstpSrasWrflDup_cse_rested";
			turnR = "AadjPknlMstpSrasWrflDup_cse_rested";
			turnSpeed = CSE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustBKneelActions_cse_rested : RifleAdjustBKneelActions {
			stop = "AadjPknlMstpSrasWrflDdown_cse_rested";
			default = "AadjPknlMstpSrasWrflDdown_cse_rested";
			turnL = "AadjPknlMstpSrasWrflDdown_cse_rested";
			turnR = "AadjPknlMstpSrasWrflDdown_cse_rested";
			turnSpeed = CSE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleKneelActions_cse_rested : RifleKneelActions {
			stop = "AmovPknlMstpSrasWrflDnon_cse_rested";
			default = "AmovPknlMstpSrasWrflDnon_cse_rested";
			crouch = "AmovPknlMstpSrasWrflDnon_cse_rested";
			turnL = "AmovPknlMstpSrasWrflDnon_cse_rested";
			turnR = "AmovPknlMstpSrasWrflDnon_cse_rested";
			turnSpeed = CSE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleProneActions_cse_rested : RifleProneActions {
			stop = "AmovPpneMstpSrasWrflDnon_cse_rested";
			default = "AmovPpneMstpSrasWrflDnon_cse_rested";
			turnL = "AmovPpneMstpSrasWrflDnon_cse_rested";
			turnR = "AmovPpneMstpSrasWrflDnon_cse_rested";
			turnSpeed = CSE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustLProneActions;
		class RifleAdjustLProneActions_cse_rested : RifleAdjustLProneActions {
			stop = "aadjppnemstpsraswrfldleft_cse_rested";
			default = "aadjppnemstpsraswrfldleft_cse_rested";
			turnL = "aadjppnemstpsraswrfldleft_cse_rested";
			turnR = "aadjppnemstpsraswrfldleft_cse_rested";
			turnSpeed = CSE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustRProneActions;
		class RifleAdjustRProneActions_cse_rested : RifleAdjustRProneActions {
			stop = "aadjppnemstpsraswrfldright_cse_rested";
			default = "aadjppnemstpsraswrfldright_cse_rested";
			turnL = "aadjppnemstpsraswrfldright_cse_rested";
			turnR = "aadjppnemstpsraswrfldright_cse_rested";
			turnSpeed = CSE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustBProneActions;
		class RifleAdjustBProneActions_cse_rested : RifleAdjustBProneActions {
			stop = "aadjppnemstpsraswrflddown_cse_rested";
			default = "aadjppnemstpsraswrflddown_cse_rested";
			turnL = "aadjppnemstpsraswrflddown_cse_rested";
			turnR = "aadjppnemstpsraswrflddown_cse_rested";
			turnSpeed = CSE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustFProneActions_cse_rested : RifleAdjustFProneActions {
			stop = "aadjppnemstpsraswrfldup_cse_rested";
			default = "aadjppnemstpsraswrfldup_cse_rested";
			turnL = "aadjppnemstpsraswrfldup_cse_rested";
			turnR = "aadjppnemstpsraswrfldup_cse_rested";
			turnSpeed = CSE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};		
	};
};
