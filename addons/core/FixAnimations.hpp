
class CfgMovesBasic;
class CfgMovesMaleSdr: CfgMovesBasic {
  class AgonyBase;
  class AgonyBaseRfl;
  class StandBase;

  class States {
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

    class LadderCivilStatic: StandBase {
      AGM_isLadder = 1;
    };
  };
};
