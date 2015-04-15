
class CfgRecoils {
    class Default {
        muzzleOuter[] = {0,"0.4f","0.5f","0.6f"};
        muzzleInner[] = {0,"0.05f","0.2f","0.2f"};
        kickBack[] = {"0.05f",0.1};
        permanent = 0.1;
        temporary = 0.01;
    };

    class recoil_default: Default {
        muzzleOuter[] = {0.3,1,0.3,0.2};
        muzzleInner[] = {0,0,0.1,0.1};
        kickBack[] = {0.03,0.06};
        permanent = 0.1;
        temporary = 0.01;
    };

    class recoil_mk20: recoil_default {
        muzzleOuter[] = {0.2,0.6,0.2,0.2};
        kickBack[] = {0.01,0.03};
        temporary = 0.01;
    };

    class recoil_mk20c: recoil_default {
        muzzleOuter[] = {0.2,0.8,0.3,0.2};
        kickBack[] = {0.02,0.04};
        temporary = 0.015;
    };

    class recoil_trg20: recoil_default {
        muzzleOuter[] = {0.2,1,0.3,0.3};
        kickBack[] = {0.02,0.04};
        temporary = 0.015;
    };

    class recoil_trg21: recoil_default {
        muzzleOuter[] = {0.2,0.8,0.3,0.2};
        kickBack[] = {0.01,0.03};
        temporary = 0.01;
    };

    class recoil_mx: recoil_default {
        muzzleOuter[] = {0.3,1,0.4,0.3};
        kickBack[] = {0.02,0.04};
        temporary = 0.01;
    };

    class recoil_mxc: recoil_default {
        muzzleOuter[] = {0.3,1.2,0.4,0.3};
        kickBack[] = {0.03,0.06};
        temporary = 0.015;
    };

    class recoil_sw: recoil_default {
        muzzleOuter[] = {0.3,0.8,0.5,0.2};
        kickBack[] = {0.02,0.04};
        temporary = 0.005;
    };

    class recoil_mxm: recoil_default {
        muzzleOuter[] = {0.3,0.8,0.4,0.3};
        kickBack[] = {0.02,0.04};
        temporary = 0.01;
    };

    class recoil_ktb: recoil_default {
        muzzleOuter[] = {0.3,1,0.3,0.3};
        kickBack[] = {0.02,0.04};
        temporary = 0.01;
    };

    class recoil_ktbc: recoil_default {
        muzzleOuter[] = {0.3,1.2,0.3,0.3};
        kickBack[] = {0.03,0.06};
        temporary = 0.015;
    };

    class recoil_smg_01: recoil_default {
        muzzleOuter[] = {0.1,0.8,0.3,0.2};
        kickBack[] = {0.01,0.03};
        temporary = 0.015;
    };

    class recoil_smg_02: recoil_default {
        muzzleOuter[] = {0.1,0.6,0.2,0.2};
        kickBack[] = {0.01,0.02};
        temporary = 0.01;
    };

    class recoil_pdw: recoil_default {
        muzzleOuter[] = {0.2,1,0.3,0.3};
        kickBack[] = {0.02,0.04};
        temporary = 0.02;
    };

    class recoil_sdar: recoil_default {
        muzzleOuter[] = {0.2,1,0.3,0.3};
        kickBack[] = {0.02,0.04};
        temporary = 0.01;
    };

    class recoil_pistol_p07: recoil_default {
        muzzleOuter[] = {0.2,1,0.2,0.3};
        kickBack[] = {0.03,0.06};
        temporary = 0.03;
    };

    class recoil_pistol_rook40: recoil_default {
        muzzleOuter[] = {0.2,1,0.2,0.3};
        kickBack[] = {0.03,0.06};
        temporary = 0.02;
    };

    class recoil_pistol_acpc2: recoil_default {
        muzzleOuter[] = {0.2,1.5,0.2,0.3};
        kickBack[] = {0.04,0.08};
        temporary = 0.04;
    };

    class recoil_pistol_4five: recoil_default {
        muzzleOuter[] = {0.2,1.5,0.2,0.3};
        kickBack[] = {0.04,0.08};
        temporary = 0.06;
    };

    class recoil_pistol_zubr: recoil_default {
        muzzleOuter[] = {0.2,1.5,0.2,0.3};
        kickBack[] = {0.04,0.08};
        temporary = 0.08;
    };

    class recoil_pistol_signal: recoil_default {
        muzzleOuter[] = {0.2,1.5,0.2,0.3};
        kickBack[] = {0.02,0.04};
        temporary = 0.02;
    };

    class recoil_rpg: recoil_default {
        muzzleOuter[] = {2,3,1,0.5};
        kickBack[] = {0.08,0.1};
        temporary = 0.1;
    };

    class recoil_nlaw: recoil_default {
        muzzleOuter[] = {2,3,1,0.5};
        kickBack[] = {0.06,0.08};
        temporary = 0.08;
    };

    class recoil_titan_long: recoil_default {
        muzzleOuter[] = {2,3,1,0.5};
        kickBack[] = {0.1,0.12};
        temporary = 0.15;
    };

    class recoil_titan_short: recoil_default {
        muzzleOuter[] = {2,3,1,0.5};
        kickBack[] = {0.1,0.12};
        temporary = 0.12;
    };

    class recoil_mk200: recoil_default {
        muzzleOuter[] = {0.4,0.6,0.6,0.2};
        kickBack[] = {0.03,0.06};
        temporary = 0.005;
    };

    class recoil_zafir: recoil_default {
        muzzleOuter[] = {0.5,1,0.7,0.3};
        kickBack[] = {0.02,0.08};
        temporary = 0.005;
    };

    class recoil_m320: recoil_default {
        muzzleOuter[] = {1,3,0.5,0.6};
        kickBack[] = {0.08,0.1};
        temporary = 0.02;
    };

    class recoil_gm6: recoil_default {
        muzzleOuter[] = {1.4,3.5,0.7,0.8};
        kickBack[] = {0.1,0.12};
        temporary = 0.025;
    };

    class recoil_ebr: recoil_default {
        muzzleOuter[] = {0.4,1.5,0.6,0.4};
        kickBack[] = {0.04,0.07};
        temporary = 0.01;
    };

    class recoil_dmr_01: recoil_default {
        muzzleOuter[] = {0.5,2,0.5,0.5};
        kickBack[] = {0.03,0.08};
        temporary = 0.015;
    };

    class recoil_dmr_02: recoil_default {
        muzzleOuter[] = {0.5,2.5,0.6,0.5};
        kickBack[] = {0.06,0.08};
        temporary = 0.01;
    };

    class recoil_dmr_03: recoil_default {
        muzzleOuter[] = {0.3,1.5,0.5,0.4};
        kickBack[] = {0.03,0.06};
        temporary = 0.005;
    };

    class recoil_dmr_04: recoil_default {
        muzzleOuter[] = {0.4,1.5,0.5,0.4};
        kickBack[] = {0.02,0.04};
        temporary = 0.015;
    };

    class recoil_dmr_05: recoil_default {
        muzzleOuter[] = {0.5,2.5,0.8,0.6};
        kickBack[] = {0.08,0.1};
        temporary = 0.01;
    };

    class recoil_dmr_06: recoil_default {
        muzzleOuter[] = {0.5,2,0.7,0.5};
        kickBack[] = {0.05,0.1};
        temporary = 0.01;
    };

    class recoil_mmg_01: recoil_default {
        muzzleOuter[] = {0.6,1.5,0.8,0.3};
        kickBack[] = {0.02,0.08};
        temporary = 0.005;
    };

    class recoil_mmg_02: recoil_default {
        muzzleOuter[] = {0.5,1.5,0.6,0.4};
        kickBack[] = {0.04,0.08};
        temporary = 0.005;
    };
};
