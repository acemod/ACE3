class CfgMovesBasic;
class CfgMovesMaleSdr: CfgMovesBasic {
    class States {
        // Jog speed adjustment: 12km/h
        class AmovPercMstpSlowWrflDnon;
        class AmovPercMrunSlowWrflDf: AmovPercMstpSlowWrflDnon {
            speed = 0.634570;
        };
        class AmovPercMrunSlowWrflDfl: AmovPercMrunSlowWrflDf {
            speed = 0.634570;
        };
        class AmovPercMrunSlowWrflDl: AmovPercMrunSlowWrflDfl {
            speed = 0.691626;
        };
        class AmovPercMrunSlowWrflDr: AmovPercMrunSlowWrflDfl {
            speed = 0.727404;
        };

        // Jog + raised weapon speed adjustment: 13km/h
        class AmovPercMstpSrasWrflDnon;
        class AmovPercMrunSrasWrflDf: AmovPercMstpSrasWrflDnon {
            speed = 0.677068;
        };

        // Tactical Jog animation replacement and speed adjustment: 10km/h
        class AmovPercMwlkSlowWrflDf_ver2;
        class AmovPercMwlkSlowWrflDfl_ver2;
        class AmovPercMtacSlowWrflDf_ver2: AmovPercMwlkSlowWrflDf_ver2 {
            speed = 0.528808;
            file = "\A3\anims_f\Data\Anim\Sdr\Mov\Erc\run\low\Rfl\AmovPercMrunSlowWrflDf";
        };
        class AmovPercMtacSlowWrflDfl_ver2: AmovPercMwlkSlowWrflDfl_ver2 {
            speed = 0.528808;
            file = "\A3\anims_f\Data\Anim\Sdr\Mov\Erc\run\low\Rfl\AmovPercMrunSlowWrflDfl";
        };
        class AmovPercMtacSlowWrflDfr_ver2: AmovPercMtacSlowWrflDf_ver2 {
            speed = 0.528808;
            file = "\A3\anims_f\Data\Anim\Sdr\Mov\Erc\run\low\Rfl\AmovPercMrunSlowWrflDfr";
        };
        class AmovPercMtacSlowWrflDr_ver2: AmovPercMtacSlowWrflDf_ver2 {
            speed = 0.528808;
            file = "\A3\anims_f\Data\Anim\Sdr\Mov\Erc\run\low\Rfl\AmovPercMrunSlowWrflDr";
        };
        class AmovPercMtacSlowWrflDl_ver2: AmovPercMtacSlowWrflDf_ver2 {
            speed = 0.528808;
            file = "\A3\anims_f\Data\Anim\Sdr\Mov\Erc\run\low\Rfl\AmovPercMrunSlowWrflDl";
        };
        class AmovPercMtacSlowWrflDb_ver2: AmovPercMtacSlowWrflDf_ver2 {
            speed = 0.684541;
            file = "\A3\anims_f\Data\Anim\Sdr\Mov\Erc\run\low\Rfl\AmovPercMrunSlowWrflDb";
            soundEdge[] = {0.25,0.5,0.75,1};
        };
        class AmovPercMtacSlowWrflDbl_ver2: AmovPercMtacSlowWrflDb_ver2 {
            speed = 0.684541;
            file = "\A3\anims_f\Data\Anim\Sdr\Mov\Erc\run\low\Rfl\AmovPercMrunSlowWrflDbl";
        };
        class AmovPercMtacSlowWrflDbr_ver2: AmovPercMtacSlowWrflDb_ver2 {
            speed = 0.684541;
            file = "\A3\anims_f\Data\Anim\Sdr\Mov\Erc\run\low\Rfl\AmovPercMrunSlowWrflDbr";
        };
    };
};
