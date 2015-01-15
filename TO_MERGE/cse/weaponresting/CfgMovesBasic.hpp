// Adpated from: https://github.com/Taosenai/tmr/blob/master/tmr_autorest/config.cpp

#define ACE_DEPLOYED_TURNSPEED 0.1
class CfgMovesBasic {
	class Default;
	class Actions {
		class RifleStandActions;
		class RifleStandActions_ACE_deployed : RifleStandActions {
			stop = "AmovPercMstpSrasWrflDnon_ACE_deployed";
			default = "AmovPercMstpSrasWrflDnon_ACE_deployed";
			turnL = "AmovPercMstpSrasWrflDnon_ACE_deployed";
			turnR = "AmovPercMstpSrasWrflDnon_ACE_deployed";
			turnSpeed = ACE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustLStandActions;
		class RifleAdjustLStandActions_ACE_deployed : RifleAdjustLStandActions {
			stop = "AadjPercMstpSrasWrflDleft_ACE_deployed";
			default = "AadjPercMstpSrasWrflDleft_ACE_deployed";
			AdjustL = "AadjPercMstpSrasWrflDleft_ACE_deployed";
			turnL = "AadjPercMstpSrasWrflDleft_ACE_deployed";
			turnR = "AadjPercMstpSrasWrflDleft_ACE_deployed";
			turnSpeed = ACE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustRStandActions;
		class RifleAdjustRStandActions_ACE_deployed : RifleAdjustRStandActions {
			stop = "AadjPercMstpSrasWrflDright_ACE_deployed";
			default = "AadjPercMstpSrasWrflDright_ACE_deployed";
			AdjustRight = "AadjPercMstpSrasWrflDright_ACE_deployed";
			turnL = "AadjPercMstpSrasWrflDright_ACE_deployed";
			turnR = "AadjPercMstpSrasWrflDright_ACE_deployed";
			turnSpeed = ACE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustFStandActions;
		class RifleAdjustFStandActions_ACE_deployed : RifleAdjustFStandActions {
			stop = "AadjPercMstpSrasWrflDup_ACE_deployed";
			default = "AadjPercMstpSrasWrflDup_ACE_deployed";
			AdjustF = "AadjPercMstpSrasWrflDup_ACE_deployed";
			turnL = "AadjPercMstpSrasWrflDup_ACE_deployed";
			turnR = "AadjPercMstpSrasWrflDup_ACE_deployed";
			turnSpeed = ACE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustBStandActions;
		class RifleAdjustBStandActions_ACE_deployed : RifleAdjustBStandActions {
			stop = "AadjPercMstpSrasWrflDdown_ACE_deployed";
			default = "AadjPercMstpSrasWrflDdown_ACE_deployed";
			AdjustB = "AadjPercMstpSrasWrflDdown_ACE_deployed";
			turnR = "AadjPercMstpSrasWrflDdown_ACE_deployed";
			turnL = "AadjPercMstpSrasWrflDdown_ACE_deployed";
			turnSpeed = ACE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustLKneelActions;
		class RifleAdjustLKneelActions_ACE_deployed : RifleAdjustLKneelActions {
			stop = "AadjPknlMstpSrasWrflDleft_ACE_deployed";
			default = "AadjPknlMstpSrasWrflDleft_ACE_deployed";
			turnL = "AadjPknlMstpSrasWrflDleft_ACE_deployed";
			turnR = "AadjPknlMstpSrasWrflDleft_ACE_deployed";
			turnSpeed = ACE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustRKneelActions;
		class RifleAdjustRKneelActions_ACE_deployed : RifleAdjustRKneelActions {
			stop = "AadjPknlMstpSrasWrflDright_ACE_deployed";
			default = "AadjPknlMstpSrasWrflDright_ACE_deployed";
			turnL = "AadjPknlMstpSrasWrflDright_ACE_deployed";
			turnR = "AadjPknlMstpSrasWrflDright_ACE_deployed";
			turnSpeed = ACE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustFKneelActions;
		class RifleAdjustFKneelActions_ACE_deployed : RifleAdjustFKneelActions {
			stop = "AadjPknlMstpSrasWrflDup_ACE_deployed";
			default = "AadjPknlMstpSrasWrflDup_ACE_deployed";
			turnL = "AadjPknlMstpSrasWrflDup_ACE_deployed";
			turnR = "AadjPknlMstpSrasWrflDup_ACE_deployed";
			turnSpeed = ACE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustBKneelActions;
		class RifleAdjustBKneelActions_ACE_deployed : RifleAdjustBKneelActions {
			stop = "AadjPknlMstpSrasWrflDdown_ACE_deployed";
			default = "AadjPknlMstpSrasWrflDdown_ACE_deployed";
			turnL = "AadjPknlMstpSrasWrflDdown_ACE_deployed";
			turnR = "AadjPknlMstpSrasWrflDdown_ACE_deployed";
			turnSpeed = ACE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleKneelActions;
		class RifleKneelActions_ACE_deployed : RifleKneelActions {
			stop = "AmovPknlMstpSrasWrflDnon_ACE_deployed";
			default = "AmovPknlMstpSrasWrflDnon_ACE_deployed";
			crouch = "AmovPknlMstpSrasWrflDnon_ACE_deployed";
			turnL = "AmovPknlMstpSrasWrflDnon_ACE_deployed";
			turnR = "AmovPknlMstpSrasWrflDnon_ACE_deployed";
			turnSpeed = ACE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleProneActions;
		class RifleProneActions_ACE_deployed : RifleProneActions {
			stop = "AmovPpneMstpSrasWrflDnon_ACE_deployed";
			default = "AmovPpneMstpSrasWrflDnon_ACE_deployed";
			turnL = "AmovPpneMstpSrasWrflDnon_ACE_deployed";
			turnR = "AmovPpneMstpSrasWrflDnon_ACE_deployed";
			turnSpeed = ACE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustFProneActions;
		class RifleAdjustFProneActions_ACE_deployed : RifleAdjustFProneActions {
			stop = "aadjppnemstpsraswrfldup_ACE_deployed";
			default = "aadjppnemstpsraswrfldup_ACE_deployed";
			turnL = "aadjppnemstpsraswrfldup_ACE_deployed";
			turnR = "aadjppnemstpsraswrfldup_ACE_deployed";
			turnSpeed = ACE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleStandActions_ACE_rested : RifleStandActions {
			stop = "AmovPercMstpSrasWrflDnon_ACE_rested";
			default = "AmovPercMstpSrasWrflDnon_ACE_rested";
			turnL = "AmovPercMstpSrasWrflDnon_ACE_rested";
			turnR = "AmovPercMstpSrasWrflDnon_ACE_rested";
			turnSpeed = ACE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustLStandActions_ACE_rested : RifleAdjustLStandActions {
			stop = "AadjPercMstpSrasWrflDleft_ACE_rested";
			default = "AadjPercMstpSrasWrflDleft_ACE_rested";
			AdjustL = "AadjPercMstpSrasWrflDleft_ACE_rested";
			turnL = "AadjPercMstpSrasWrflDleft_ACE_rested";
			turnR = "AadjPercMstpSrasWrflDleft_ACE_rested";
			turnSpeed = ACE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustRStandActions_ACE_rested : RifleAdjustRStandActions {
			stop = "AadjPercMstpSrasWrflDright_ACE_rested";
			default = "AadjPercMstpSrasWrflDright_ACE_rested";
			AdjustRight = "AadjPercMstpSrasWrflDright_ACE_rested";
			turnL = "AadjPercMstpSrasWrflDright_ACE_rested";
			turnR = "AadjPercMstpSrasWrflDright_ACE_rested";
			turnSpeed = ACE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustFStandActions_ACE_rested : RifleAdjustFStandActions {
			stop = "AadjPercMstpSrasWrflDup_ACE_rested";
			default = "AadjPercMstpSrasWrflDup_ACE_rested";
			AdjustF = "AadjPercMstpSrasWrflDup_ACE_rested";
			turnL = "AadjPercMstpSrasWrflDup_ACE_rested";
			turnR = "AadjPercMstpSrasWrflDup_ACE_rested";
			turnSpeed = ACE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustBStandActions_ACE_rested : RifleAdjustBStandActions {
			stop = "AadjPercMstpSrasWrflDdown_ACE_rested";
			default = "AadjPercMstpSrasWrflDdown_ACE_rested";
			AdjustB = "AadjPercMstpSrasWrflDdown_ACE_rested";
			turnR = "AadjPercMstpSrasWrflDdown_ACE_rested";
			turnL = "AadjPercMstpSrasWrflDdown_ACE_rested";
			turnSpeed = ACE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustLKneelActions_ACE_rested : RifleAdjustLKneelActions {
			stop = "AadjPknlMstpSrasWrflDleft_ACE_rested";
			default = "AadjPknlMstpSrasWrflDleft_ACE_rested";
			turnL = "AadjPknlMstpSrasWrflDleft_ACE_rested";
			turnR = "AadjPknlMstpSrasWrflDleft_ACE_rested";
			turnSpeed = ACE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustRKneelActions_ACE_rested : RifleAdjustRKneelActions {
			stop = "AadjPknlMstpSrasWrflDright_ACE_rested";
			default = "AadjPknlMstpSrasWrflDright_ACE_rested";
			turnL = "AadjPknlMstpSrasWrflDright_ACE_rested";
			turnR = "AadjPknlMstpSrasWrflDright_ACE_rested";
			turnSpeed = ACE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustFKneelActions_ACE_rested : RifleAdjustFKneelActions {
			stop = "AadjPknlMstpSrasWrflDup_ACE_rested";
			default = "AadjPknlMstpSrasWrflDup_ACE_rested";
			turnL = "AadjPknlMstpSrasWrflDup_ACE_rested";
			turnR = "AadjPknlMstpSrasWrflDup_ACE_rested";
			turnSpeed = ACE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustBKneelActions_ACE_rested : RifleAdjustBKneelActions {
			stop = "AadjPknlMstpSrasWrflDdown_ACE_rested";
			default = "AadjPknlMstpSrasWrflDdown_ACE_rested";
			turnL = "AadjPknlMstpSrasWrflDdown_ACE_rested";
			turnR = "AadjPknlMstpSrasWrflDdown_ACE_rested";
			turnSpeed = ACE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleKneelActions_ACE_rested : RifleKneelActions {
			stop = "AmovPknlMstpSrasWrflDnon_ACE_rested";
			default = "AmovPknlMstpSrasWrflDnon_ACE_rested";
			crouch = "AmovPknlMstpSrasWrflDnon_ACE_rested";
			turnL = "AmovPknlMstpSrasWrflDnon_ACE_rested";
			turnR = "AmovPknlMstpSrasWrflDnon_ACE_rested";
			turnSpeed = ACE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleProneActions_ACE_rested : RifleProneActions {
			stop = "AmovPpneMstpSrasWrflDnon_ACE_rested";
			default = "AmovPpneMstpSrasWrflDnon_ACE_rested";
			turnL = "AmovPpneMstpSrasWrflDnon_ACE_rested";
			turnR = "AmovPpneMstpSrasWrflDnon_ACE_rested";
			turnSpeed = ACE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustLProneActions;
		class RifleAdjustLProneActions_ACE_rested : RifleAdjustLProneActions {
			stop = "aadjppnemstpsraswrfldleft_ACE_rested";
			default = "aadjppnemstpsraswrfldleft_ACE_rested";
			turnL = "aadjppnemstpsraswrfldleft_ACE_rested";
			turnR = "aadjppnemstpsraswrfldleft_ACE_rested";
			turnSpeed = ACE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustRProneActions;
		class RifleAdjustRProneActions_ACE_rested : RifleAdjustRProneActions {
			stop = "aadjppnemstpsraswrfldright_ACE_rested";
			default = "aadjppnemstpsraswrfldright_ACE_rested";
			turnL = "aadjppnemstpsraswrfldright_ACE_rested";
			turnR = "aadjppnemstpsraswrfldright_ACE_rested";
			turnSpeed = ACE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustBProneActions;
		class RifleAdjustBProneActions_ACE_rested : RifleAdjustBProneActions {
			stop = "aadjppnemstpsraswrflddown_ACE_rested";
			default = "aadjppnemstpsraswrflddown_ACE_rested";
			turnL = "aadjppnemstpsraswrflddown_ACE_rested";
			turnR = "aadjppnemstpsraswrflddown_ACE_rested";
			turnSpeed = ACE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};

		class RifleAdjustFProneActions_ACE_rested : RifleAdjustFProneActions {
			stop = "aadjppnemstpsraswrfldup_ACE_rested";
			default = "aadjppnemstpsraswrfldup_ACE_rested";
			turnL = "aadjppnemstpsraswrfldup_ACE_rested";
			turnR = "aadjppnemstpsraswrfldup_ACE_rested";
			turnSpeed = ACE_DEPLOYED_TURNSPEED;
			limitFast = 1;
		};
	};
};
