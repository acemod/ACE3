
// Completely disable BI's camshake on fire.
#define ACE_CAMSHAKEFIRE_BASE 0
#define ACE_CAMSHAKEFIRE_LESS 0
#define ACE_CAMSHAKEFIRE_MORE 0

// Go through all modes that have a camshakefire defined and change it to ours.
class CfgMovesBasic {
    class Default {
        camShakeFire = ACE_CAMSHAKEFIRE_BASE;
    };
};

class CfgMovesMaleSdr: CfgMovesBasic {
    class States {
        class AmovPercMstpSlowWrflDnon;
        class AmovPknlMstpSlowWrflDnon: AmovPercMstpSlowWrflDnon {
            camShakeFire = ACE_CAMSHAKEFIRE_LESS;
        };

        class AmovPercMstpSrasWrflDnon;
        class AmovPpneMstpSrasWrflDnon: AmovPercMstpSrasWrflDnon {
            camShakeFire = ACE_CAMSHAKEFIRE_LESS;
        };

        class AmovPknlMstpSrasWlnrDnon: Default {
            camShakeFire = ACE_CAMSHAKEFIRE_LESS;
        };

        class AmovPknlMrunSlowWrflDf;
        class AmovPknlMtacSlowWrflDf: AmovPknlMrunSlowWrflDf {
            camShakeFire = ACE_CAMSHAKEFIRE_MORE;
        };

        class AmovPknlMrunSlowWrflDfl;
        class AmovPknlMtacSlowWrflDfl: AmovPknlMrunSlowWrflDfl {
            camShakeFire = ACE_CAMSHAKEFIRE_MORE;
        };

        class AmovPknlMrunSlowWrflDl;
        class AmovPknlMtacSlowWrflDl: AmovPknlMrunSlowWrflDl {
            camShakeFire = ACE_CAMSHAKEFIRE_MORE;
        };

        class AmovPknlMrunSlowWrflDbl;
        class AmovPknlMtacSlowWrflDbl: AmovPknlMrunSlowWrflDbl {
            camShakeFire = ACE_CAMSHAKEFIRE_MORE;
        };

        class AmovPknlMrunSlowWrflDb;
        class AmovPknlMtacSlowWrflDb: AmovPknlMrunSlowWrflDb {
            camShakeFire = ACE_CAMSHAKEFIRE_MORE;
        };

        class AmovPknlMrunSlowWrflDbr;
        class AmovPknlMtacSlowWrflDbr: AmovPknlMrunSlowWrflDbr {
            camShakeFire = ACE_CAMSHAKEFIRE_MORE;
        };

        class AmovPknlMrunSlowWrflDr;
        class AmovPknlMtacSlowWrflDr: AmovPknlMrunSlowWrflDr {
            camShakeFire = ACE_CAMSHAKEFIRE_MORE;
        };

        class AmovPknlMrunSlowWrflDfr;
        class AmovPknlMtacSlowWrflDfr: AmovPknlMrunSlowWrflDfr {
            camShakeFire = ACE_CAMSHAKEFIRE_MORE;
        };

        class AmovPknlMstpSrasWrflDnon;
        class AmovPknlMwlkSrasWrflDf: AmovPknlMstpSrasWrflDnon {
            camShakeFire = ACE_CAMSHAKEFIRE_BASE;
        };

        class AmovPknlMrunSrasWrflDf;
        class AmovPknlMtacSrasWrflDf: AmovPknlMrunSrasWrflDf {
            camShakeFire = ACE_CAMSHAKEFIRE_MORE;
        };

        class AmovPknlMwlkSrasWpstDf;
        class AmovPknlMtacSrasWpstDf: AmovPknlMwlkSrasWpstDf {
            camShakeFire = ACE_CAMSHAKEFIRE_MORE;
        };
    };
};
