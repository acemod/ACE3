class CfgMovesBasic {
    class Default;
    // From ACRE
    class ManActions {
        GVAR(stop) = QGVAR(stop);
    };
    class Actions {
        class NoActions: ManActions {
            GVAR(stop)[] = {QGVAR(stop), "Gesture"};
        };

        // fixes grab animation with equipped pistol
        class PistolStandActions: NoActions {
            grabDrag = "AmovPercMstpSlowWrflDnon_AcinPknlMwlkSlowWrflDb_2";
        };
        class LauncherKneelActions: NoActions {
            grabDrag = "AmovPercMstpSlowWrflDnon_AcinPknlMwlkSlowWrflDb_2";
        };
        class CivilStandActions: NoActions {
            grabDrag = "AmovPercMstpSlowWrflDnon_AcinPknlMwlkSlowWrflDb_2";
        };
    };
};

class CfgMovesMaleSdr: CfgMovesBasic {
    class AgonyBase;
    class AgonyBaseRfl;
    class StandBase;
    class HealBase;

    class States {
        // fixes being able to reload in some animations, can't remember now what exactly
        class AinjPfalMstpSnonWnonDnon_carried_Down: AgonyBase {
            canReload = 0;
        };
        class AinjPfalMstpSnonWnonDnon_carried_Up: AgonyBase {
            canReload = 0;
        };
        class AinjPfalMstpSnonWrflDnon_carried_Down: AgonyBase {
            canReload = 0;
        };
        class AinjPfalMstpSnonWrflDnon_carried_Up: AgonyBaseRfl {
            canReload = 0;
        };

        class AmovPpneMstpSnonWnonDnon_injured;
        class AinjPpneMstpSnonWnonDnon: AmovPpneMstpSnonWnonDnon_injured {
            canReload = 0;
        };
        class AmovPpneMstpSrasWrflDnon_injured;
        class AinjPpneMstpSnonWrflDnon: AmovPpneMstpSrasWrflDnon_injured {
            canReload = 0;
        };

        // mark as on ladder animation
        class LadderCivilStatic: StandBase {
            ACE_isLadder = 1;
        };

        // dunno, important
        class AmovPercMstpSnonWnonDnon_AcinPknlMwlkSnonWnonDb_1;
        class AcinPknlMstpSnonWnonDnon: AmovPercMstpSnonWnonDnon_AcinPknlMwlkSnonWnonDb_1 {
            enableDirectControl = 1;
        };
        class AcinPknlMwlkSnonWnonDb: AmovPercMstpSnonWnonDnon_AcinPknlMwlkSnonWnonDb_1 {
            enableDirectControl = 1;
        };

        // fix falling back to unconsciousness animation and disable rotating in that state
        class Unconscious: Default {
            // Prevents AI from moving torso and head when unconscious
            aiming = "aimingNo";
            aimingBody = "aimingUpNo";
            head = "headNo";

            ConnectTo[] = {};
            forceAim = 1;
            static = 1;
        };

        // idk. Flummi?
        class AinvPknlMstpSnonWnonDnon_medic0: HealBase {
            variantsPlayer[] = {};
        };
    };
};
