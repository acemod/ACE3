class CfgMovesBasic {
    class Actions {
        class CivilStandActions;
        class ACE_CivilStandCaptiveActions: CivilStandActions {
            turnL = "";
            turnR = "";
            stop = "ACE_AmovPercMstpScapWnonDnon";
            StopRelaxed = "ACE_AmovPercMstpScapWnonDnon";
            default = "ACE_AmovPercMstpScapWnonDnon";
            getOver = "";
            throwPrepare = "";
            throwGrenade[] = {"","Gesture"};
        };
    };
};

class CfgMovesMaleSdr: CfgMovesBasic {
    class StandBase;
    class States {
        class AmovPercMstpSnonWnonDnon: StandBase {
            ConnectTo[] += {"ACE_AmovPercMstpSnonWnonDnon_AmovPercMstpScapWnonDnon",0.1};
        };

        class CutSceneAnimationBase;
        class ACE_AmovPercMstpSnonWnonDnon_AmovPercMstpScapWnonDnon: CutSceneAnimationBase {
            actions = "ACE_CivilStandCaptiveActions";
            file = "\A3\anims_f\Data\Anim\Sdr\mov\erc\stp\non\non\AmovPercMstpSnonWnonDnon_EaseIn";
            speed = 1;
            looped = 0;
            interpolationRestart = 2;
            ConnectTo[] = {"ACE_AmovPercMstpScapWnonDnon",0.1};
            InterpolateTo[] = {"Unconscious",0.01,"ACE_AmovPercMstpScapWnonDnon_AmovPercMstpSnonWnonDnon",0.1};
        };

        class ACE_AmovPercMstpScapWnonDnon: ACE_AmovPercMstpSnonWnonDnon_AmovPercMstpScapWnonDnon {
            file = "\A3\anims_f\Data\Anim\Sdr\mov\erc\stp\non\non\AmovPercMstpSnonWnonDnon_Ease";
            speed = 0;
            ConnectTo[] = {"ACE_AmovPercMstpScapWnonDnon_AmovPercMstpSnonWnonDnon",0.1};
            InterpolateTo[] = {"Unconscious",0.01};
            looped = 1;
        };

        class ACE_AmovPercMstpScapWnonDnon_AmovPercMstpSnonWnonDnon: ACE_AmovPercMstpSnonWnonDnon_AmovPercMstpScapWnonDnon {
            actions = "CivilStandActions";
            file = "\A3\anims_f\Data\Anim\Sdr\mov\erc\stp\non\non\amovpercmstpsnonwnondnon_easeout";
            ConnectTo[] = {"AmovPercMstpSnonWnonDnon",0.1};
            InterpolateTo[] = {"Unconscious",0.01,"ACE_AmovPercMstpSnonWnonDnon_AmovPercMstpScapWnonDnon",0.1};
        };
    };
};

/*
player playMove "ACE_AmovPercMstpScapWnonDnon";
player switchMove "ACE_AmovPercMstpScapWnonDnon_AmovPercMstpSnonWnonDnon";
 */

/*class CfgMovesBasic;
class CfgMovesMaleSdr: CfgMovesBasic {
class States {
    class CutSceneAnimationBase;
    class AmovPercMstpSnonWnonDnon_EaseIn: CutSceneAnimationBase {
    head = "headDefault";
    static = 1;
    disableWeapons = 0;
    forceAim = 0;
    InterpolateTo[] = {"AmovPercMstpSnonWnonDnon_EaseOut",0.02,"Unconscious",0.1};
    };
    class AmovPercMstpSnonWnonDnon_Ease: AmovPercMstpSnonWnonDnon_EaseIn {
    looped = 1;
    InterpolateTo[] = {"Unconscious",0.1};
    };
    class AmovPercMstpSnonWnonDnon_EaseOut: AmovPercMstpSnonWnonDnon_EaseIn {
    InterpolateTo[] = {"AmovPercMstpSnonWnonDnon_EaseIn",0.02,"Unconscious",0.1};
    };

    class AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon: CutSceneAnimationBase {
    InterpolateTo[] = {"Unconscious",0.01,"AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon",0.1};
    };

    class AmovPercMstpSsurWnonDnon: AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon {
    looped = 1;
    InterpolateTo[] = {"Unconscious",0.01};
    };

    class AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon: AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon {
    InterpolateTo[] = {"Unconscious",0.01,"AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon",0.1};
    };
};
};*/

