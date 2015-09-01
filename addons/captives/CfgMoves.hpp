class CfgMovesBasic {
    class Actions {
        class CivilStandActions;
        class ACE_CivilStandHandcuffedActions: CivilStandActions {
            turnL = "";
            turnR = "";
            stop = "ACE_AmovPercMstpScapWnonDnon";
            StopRelaxed = "ACE_AmovPercMstpScapWnonDnon";
            default = "ACE_AmovPercMstpScapWnonDnon";
            PutDown = "";
            getOver = "";
            throwPrepare = "";
            throwGrenade[] = {"","Gesture"};
        };
        class ACE_CivilStandSurrenderActions: ACE_CivilStandHandcuffedActions {
            stop = "ACE_AmovPercMstpSsurWnonDnon";
            StopRelaxed = "ACE_AmovPercMstpSsurWnonDnon";
            default = "ACE_AmovPercMstpSsurWnonDnon";
            PutDown = "";
        };
        class ACE_CivilHandCuffedFFVActions: ACE_CivilStandHandcuffedActions {
            stop = "ACE_HandcuffedFFV";
            StopRelaxed = "ACE_HandcuffedFFV";
            default = "ACE_HandcuffedFFV";
        };
    };
};

class CfgMovesMaleSdr: CfgMovesBasic {
    class StandBase;
    class States {
        class AmovPercMstpSnonWnonDnon: StandBase {
            ConnectTo[] += {"ACE_AmovPercMstpSnonWnonDnon_AmovPercMstpScapWnonDnon",0.1,"ACE_AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon",0.1};
        };

        class CutSceneAnimationBase;

        #define MACRO_ANIMATION \
            head = "headDefault"; \
            aimingBody = "aimingNo"; \
            forceAim = 1; \
            static = 1;

        //Handcuffed Anims:
        class ACE_AmovPercMstpSnonWnonDnon_AmovPercMstpScapWnonDnon: CutSceneAnimationBase {
            actions = "ACE_CivilStandHandcuffedActions";
            file = "\A3\anims_f\Data\Anim\Sdr\mov\erc\stp\non\non\AmovPercMstpSnonWnonDnon_EaseIn";
            speed = 1;
            looped = 0;
            interpolationRestart = 2;
            ConnectTo[] = {"ACE_AmovPercMstpScapWnonDnon",0.1};
            InterpolateTo[] = {"Unconscious",0.01,"ACE_AmovPercMstpScapWnonDnon_AmovPercMstpSnonWnonDnon",0.1};
            canReload = 0;
            MACRO_ANIMATION
        };
        class ACE_AmovPercMstpScapWnonDnon: ACE_AmovPercMstpSnonWnonDnon_AmovPercMstpScapWnonDnon {
            file = "\A3\anims_f\Data\Anim\Sdr\mov\erc\stp\non\non\AmovPercMstpSnonWnonDnon_Ease";
            speed = 0;
            ConnectTo[] = {"ACE_AmovPercMstpScapWnonDnon_AmovPercMstpSnonWnonDnon",0.1};
            InterpolateTo[] = {"Unconscious",0.01};
            looped = 1;
            MACRO_ANIMATION
        };
        class ACE_AmovPercMstpScapWnonDnon_AmovPercMstpSnonWnonDnon: ACE_AmovPercMstpSnonWnonDnon_AmovPercMstpScapWnonDnon {
            actions = "CivilStandActions";
            file = "\A3\anims_f\Data\Anim\Sdr\mov\erc\stp\non\non\amovpercmstpsnonwnondnon_easeout";
            ConnectTo[] = {"AmovPercMstpSnonWnonDnon",0.1};
            InterpolateTo[] = {"Unconscious",0.01,"ACE_AmovPercMstpSnonWnonDnon_AmovPercMstpScapWnonDnon",0.1};
            MACRO_ANIMATION
        };

        //Handcuffed-FFV:
        class ACE_HandcuffedFFV: ACE_AmovPercMstpScapWnonDnon {
            file = "\A3\cargoposes_F_heli\anim\passenger_flatground_3idleunarmed.rtm";
            actions = "ACE_CivilHandCuffedFFVActions";
            ConnectTo[] = {};
            MACRO_ANIMATION
        };


        //Surrender Anims:
        class ACE_AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon: CutSceneAnimationBase {
            actions = "ACE_CivilStandSurrenderActions";
            file = "\A3\anims_f\Data\Anim\Sdr\mov\erc\stp\non\non\AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
            speed = 1;
            looped = 0;
            interpolationRestart = 2;
            ConnectTo[] = {"ACE_AmovPercMstpSsurWnonDnon",0.1};
            InterpolateTo[] = {"Unconscious",0.01,"ACE_AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon",0.1};
            canReload = 0;
            MACRO_ANIMATION
        };
        class ACE_AmovPercMstpSsurWnonDnon: ACE_AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon {
            file = "\A3\anims_f\Data\Anim\Sdr\mov\erc\stp\sur\non\AmovPercMstpSsurWnonDnon";
            speed = 0;
            looped = 1;
            ConnectTo[] = {"ACE_AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon",0.1};
            InterpolateTo[] = {"Unconscious",0.01};
            MACRO_ANIMATION
        };
        class ACE_AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon: ACE_AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon {
            speed = 0.5;  //for gameplay reasons, slow this down
            actions = "CivilStandActions";
            file = "\A3\anims_f\Data\Anim\Sdr\mov\erc\stp\sur\non\AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon";
            ConnectTo[] = {"AmovPercMstpSnonWnonDnon",0.1};
            InterpolateTo[] = {"Unconscious",0.01,"ACE_AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon",0.1};
            MACRO_ANIMATION
        };
    };
};
