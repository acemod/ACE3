
class CfgMovesBasic {
    class DefaultDie;

    class ManActions {
        ACE_SpottingScope = "ACE_SpottingScope";
    };
};

class CfgMovesMaleSdr: CfgMovesBasic {
    class States {
        class ACE_KIA_SpottingScope: DefaultDie {
            actions = "DeadActions";
            file = "\A3\anims_f\Data\Anim\Sdr\dth\pne\stp\ras\Rfl\AdthPpneMstpSrasWrflDnon_1";
            speed = 1;
            looped = "false";
            terminal = 1;
            soundEnabled = 0;
            connectTo[] = {"Unconscious",0.1};
        };

        class Crew;
        class ACE_SpottingScope: Crew {
            file = "\A3\anims_f\Data\Anim\Sdr\Mov\pne\stp\non\non\AmovPpneMstpSnonWnonDnon";
            interpolateTo[] = {"ACE_KIA_SpottingScope",1};
        };
    };
};
