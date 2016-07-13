class CfgMovesMaleSdr {
    class States {
        // class AmovPercMstpSlowWrflDnon;
        // class AmovPercMrunSlowWrflDf: AmovPercMstpSlowWrflDnon {
        //     speed = 0.635529; //0.715882;
        // };
        // class AmovPercMstpSrasWrflDnon;
        // class AmovPercMrunSrasWrflDf: AmovPercMstpSrasWrflDnon {
        //     speed = 0.607706; //0.684541;
        // };

        // Tactical Jog replacement
        // No more buttplugs
        class AmovPercMwlkSlowWrflDf_ver2;
        class AmovPercMwlkSlowWrflDfl_ver2;
        class AmovPercMtacSlowWrflDf_ver2: AmovPercMwlkSlowWrflDf_ver2 {
            speed = 0.634569;
            file = "\A3\anims_f\Data\Anim\Sdr\Mov\Erc\run\low\Rfl\AmovPercMrunSlowWrflDf";
        };
        class AmovPercMtacSlowWrflDfl_ver2: AmovPercMwlkSlowWrflDfl_ver2 {
            speed = 0.634569;
            file = "\A3\anims_f\Data\Anim\Sdr\Mov\Erc\run\low\Rfl\AmovPercMrunSlowWrflDfl";
        };
        class AmovPercMtacSlowWrflDfr_ver2: AmovPercMtacSlowWrflDf_ver2 {
            speed = 0.634569;
            file = "\A3\anims_f\Data\Anim\Sdr\Mov\Erc\run\low\Rfl\AmovPercMrunSlowWrflDfr";
        };
        class AmovPercMtacSlowWrflDr_ver2: AmovPercMtacSlowWrflDf_ver2 {
            speed = 0.707495;
            file = "\A3\anims_f\Data\Anim\Sdr\Mov\Erc\run\low\Rfl\AmovPercMrunSlowWrflDr";
        };
        class AmovPercMtacSlowWrflDl_ver2: AmovPercMtacSlowWrflDf_ver2 {
            speed = 0.707495;
            file = "\A3\anims_f\Data\Anim\Sdr\Mov\Erc\run\low\Rfl\AmovPercMrunSlowWrflDl";
        };
    };
};
