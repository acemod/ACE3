class CfgMovesBasic {
    class StandBase;
};

class CfgMovesMaleSdr: CfgMovesBasic {
    class States {
        // rifle
        class AmovPercMstpSlowWrflDnon: StandBase {
            variantsPlayer[] = {/*"AidlPercMstpSlowWrflDnon_G01", 0.5, "AidlPercMstpSlowWrflDnon_G02", 0.125, "AidlPercMstpSlowWrflDnon_G03", 0.125, "AidlPercMstpSlowWrflDnon_G04", 0.125, "AidlPercMstpSlowWrflDnon_G05", 0.125*/};
        };
        class AmovPknlMstpSlowWrflDnon: AmovPercMstpSlowWrflDnon {
            variantsPlayer[] = {/*"AidlPknlMstpSlowWrflDnon_G01", 0.25, "AidlPknlMstpSlowWrflDnon_G02", 0.25, "AidlPknlMstpSlowWrflDnon_G03", 0.25*/};
        };

        // pistol
        class AmovPercMstpSrasWpstDnon;
        class AmovPercMstpSlowWpstDnon: AmovPercMstpSrasWpstDnon {
            variantsPlayer[] = {/*"AidlPercMstpSlowWpstDnon_G01", 0.333, "AidlPercMstpSlowWpstDnon_G02", 0.333, "AidlPercMstpSlowWpstDnon_G03", 0.334*/};
        };

        class AmovPknlMstpSrasWpstDnon;
        class AmovPknlMstpSlowWpstDnon: AmovPknlMstpSrasWpstDnon {
            variantsPlayer[] = {/*"AidlPknlMstpSlowWpstDnon_G03", 0.333, "AidlPknlMstpSlowWpstDnon_G02", 0.333, "AidlPknlMstpSlowWpstDnon_G01", 0.334*/};
        };

        // none
        class AmovPercMstpSnonWnonDnon: StandBase {
            variantsPlayer[] = {/*"AidlPercMstpSnonWnonDnon_G01", 0.16, "AidlPercMstpSnonWnonDnon_G02", 0.16, "AidlPercMstpSnonWnonDnon_G03", 0.16, "AidlPercMstpSnonWnonDnon_G04", 0.16, "AidlPercMstpSnonWnonDnon_G05", 0.16, "AidlPercMstpSnonWnonDnon_G06", 0.16*/};
        };
        class AmovPknlMstpSnonWnonDnon: AmovPercMstpSnonWnonDnon {
            variantsPlayer[] = {/*"AidlPknlMstpSnonWnonDnon_G01", 0.33, "AidlPknlMstpSnonWnonDnon_G02", 0.33, "AidlPknlMstpSnonWnonDnon_G03", 0.33*/};
        };
    };
};
