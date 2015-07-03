
#define KICKBACK 1.4

#define MUZZLETEMP 1.2
#define MUZZLEPERM 0.4

#define MUZZLECLIMB_POS 1
#define MUZZLERIGHT_POS 0.2

#define MUZZLECLIMB_MAG 1
#define MUZZLERIGHT_MAG 1

class CfgRecoils {
    class Default {
        // doc: http://forums.bistudio.com/showthread.php?188999-Recoil-Overhaul-Feedback&s=dba8590ec07adb5ffa87f72d38dde6fc&p=2886744&viewfull=1#post2886744
        // {horizontal axis position, vertical axis position, horizontal magnitude, vertical magnitude}
        muzzleOuter[] = {0*MUZZLERIGHT_POS,0.4*MUZZLECLIMB_POS,0.5*MUZZLERIGHT_MAG,0.6*MUZZLECLIMB_MAG};
        // restricted area inside the outer ellipse where the recoil cannot end
        muzzleInner[] = {0,0.05,0.2,0.2};
        // minimum and maximum interval for backward force
        kickBack[] = {0.05*KICKBACK,0.1*KICKBACK};
        permanent = 0.1*MUZZLEPERM;
        temporary = 0.01*MUZZLETEMP;
    };

    class recoil_default: Default {
        muzzleOuter[] = {0.3*MUZZLERIGHT_POS,1*MUZZLECLIMB_POS,0.3*MUZZLERIGHT_MAG,0.2*MUZZLECLIMB_MAG};
        muzzleInner[] = {0,0,0.1,0.1};
        kickBack[] = {0.03*KICKBACK,0.06*KICKBACK};
        permanent = 0.1*MUZZLEPERM;
        temporary = 0.01*MUZZLETEMP;
    };

    class recoil_mk20: recoil_default {
        muzzleOuter[] = {0.2*MUZZLERIGHT_POS,0.6*MUZZLECLIMB_POS,0.2*MUZZLERIGHT_MAG,0.2*MUZZLECLIMB_MAG};
        kickBack[] = {0.01*KICKBACK,0.03*KICKBACK};
        temporary = 0.01*MUZZLETEMP;
    };

    class recoil_mk20c: recoil_default {
        muzzleOuter[] = {0.2*MUZZLERIGHT_POS,0.8*MUZZLECLIMB_POS,0.3*MUZZLERIGHT_MAG,0.2*MUZZLECLIMB_MAG};
        kickBack[] = {0.02*KICKBACK,0.04*KICKBACK};
        temporary = 0.015*MUZZLETEMP;
    };

    class recoil_trg20: recoil_default {
        muzzleOuter[] = {0.2*MUZZLERIGHT_POS,1*MUZZLECLIMB_POS,0.3*MUZZLERIGHT_MAG,0.3*MUZZLECLIMB_MAG};
        kickBack[] = {0.02*KICKBACK,0.04*KICKBACK};
        temporary = 0.015*MUZZLETEMP;
    };

    class recoil_trg21: recoil_default {
        muzzleOuter[] = {0.2*MUZZLERIGHT_POS,0.8*MUZZLECLIMB_POS,0.3*MUZZLERIGHT_MAG,0.2*MUZZLECLIMB_MAG};
        kickBack[] = {0.01*KICKBACK,0.03*KICKBACK};
        temporary = 0.01*MUZZLETEMP;
    };

    class recoil_mx: recoil_default {
        muzzleOuter[] = {0.3*MUZZLERIGHT_POS,1*MUZZLECLIMB_POS,0.4*MUZZLERIGHT_MAG,0.3*MUZZLECLIMB_MAG};
        kickBack[] = {0.02*KICKBACK,0.04*KICKBACK};
        temporary = 0.01*MUZZLETEMP;
    };

    class recoil_mxc: recoil_default {
        muzzleOuter[] = {0.3*MUZZLERIGHT_POS,1.2*MUZZLECLIMB_POS,0.4*MUZZLERIGHT_MAG,0.3*MUZZLECLIMB_MAG};
        kickBack[] = {0.03*KICKBACK,0.06*KICKBACK};
        temporary = 0.015*MUZZLETEMP;
    };

    class recoil_sw: recoil_default {
        muzzleOuter[] = {0.3*MUZZLERIGHT_POS,0.8*MUZZLECLIMB_POS,0.5*MUZZLERIGHT_MAG,0.2*MUZZLECLIMB_MAG};
        kickBack[] = {0.02*KICKBACK,0.04*KICKBACK};
        temporary = 0.01*MUZZLETEMP; //0.005*MUZZLETEMP;
    };

    class recoil_mxm: recoil_default {
        muzzleOuter[] = {0.3*MUZZLERIGHT_POS,0.8*MUZZLECLIMB_POS,0.4*MUZZLERIGHT_MAG,0.3*MUZZLECLIMB_MAG};
        kickBack[] = {0.02*KICKBACK,0.04*KICKBACK};
        temporary = 0.01*MUZZLETEMP;
    };

    class recoil_ktb: recoil_default {
        muzzleOuter[] = {0.3*MUZZLERIGHT_POS,1*MUZZLECLIMB_POS,0.3*MUZZLERIGHT_MAG,0.3*MUZZLECLIMB_MAG};
        kickBack[] = {0.02*KICKBACK,0.04*KICKBACK};
        temporary = 0.01*MUZZLETEMP;
    };

    class recoil_ktbc: recoil_default {
        muzzleOuter[] = {0.3*MUZZLERIGHT_POS,1.2*MUZZLECLIMB_POS,0.3*MUZZLERIGHT_MAG,0.3*MUZZLECLIMB_MAG};
        kickBack[] = {0.03*KICKBACK,0.06*KICKBACK};
        temporary = 0.015*MUZZLETEMP;
    };

    class recoil_smg_01: recoil_default {
        muzzleOuter[] = {0.1*MUZZLERIGHT_POS,0.8*MUZZLECLIMB_POS,0.3*MUZZLERIGHT_MAG,0.2*MUZZLECLIMB_MAG};
        kickBack[] = {0.01*KICKBACK,0.03*KICKBACK};
        temporary = 0.015*MUZZLETEMP;
    };

    class recoil_smg_02: recoil_default {
        muzzleOuter[] = {0.1*MUZZLERIGHT_POS,0.6*MUZZLECLIMB_POS,0.2*MUZZLERIGHT_MAG,0.2*MUZZLECLIMB_MAG};
        kickBack[] = {0.01*KICKBACK,0.02*KICKBACK};
        temporary = 0.01*MUZZLETEMP;
    };

    class recoil_pdw: recoil_default {
        muzzleOuter[] = {0.2*MUZZLERIGHT_POS,1*MUZZLECLIMB_POS,0.3*MUZZLERIGHT_MAG,0.3*MUZZLECLIMB_MAG};
        kickBack[] = {0.02*KICKBACK,0.04*KICKBACK};
        temporary = 0.02*MUZZLETEMP;
    };

    class recoil_sdar: recoil_default {
        muzzleOuter[] = {0.2*MUZZLERIGHT_POS,1*MUZZLECLIMB_POS,0.3*MUZZLERIGHT_MAG,0.3*MUZZLECLIMB_MAG};
        kickBack[] = {0.02*KICKBACK,0.04*KICKBACK};
        temporary = 0.01*MUZZLETEMP;
    };

    class recoil_pistol_p07: recoil_default {
        muzzleOuter[] = {0.2*MUZZLERIGHT_POS,1*MUZZLECLIMB_POS,0.2*MUZZLERIGHT_MAG,0.3*MUZZLECLIMB_MAG};
        kickBack[] = {0.03*KICKBACK,0.06*KICKBACK};
        temporary = 0.03*MUZZLETEMP;
    };

    class recoil_pistol_rook40: recoil_default {
        muzzleOuter[] = {0.2*MUZZLERIGHT_POS,1*MUZZLECLIMB_POS,0.2*MUZZLERIGHT_MAG,0.3*MUZZLECLIMB_MAG};
        kickBack[] = {0.03*KICKBACK,0.06*KICKBACK};
        temporary = 0.02*MUZZLETEMP;
    };

    class recoil_pistol_acpc2: recoil_default {
        muzzleOuter[] = {0.2*MUZZLERIGHT_POS,1.5*MUZZLECLIMB_POS,0.2*MUZZLERIGHT_MAG,0.3*MUZZLECLIMB_MAG};
        kickBack[] = {0.04*KICKBACK,0.08*KICKBACK};
        temporary = 0.04*MUZZLETEMP;
    };

    class recoil_pistol_4five: recoil_default {
        muzzleOuter[] = {0.2*MUZZLERIGHT_POS,1.5*MUZZLECLIMB_POS,0.2*MUZZLERIGHT_MAG,0.3*MUZZLECLIMB_MAG};
        kickBack[] = {0.04*KICKBACK,0.08*KICKBACK};
        temporary = 0.06*MUZZLETEMP;
    };

    class recoil_pistol_zubr: recoil_default {
        muzzleOuter[] = {0.2*MUZZLERIGHT_POS,1.5*MUZZLECLIMB_POS,0.2*MUZZLERIGHT_MAG,0.3*MUZZLECLIMB_MAG};
        kickBack[] = {0.04*KICKBACK,0.08*KICKBACK};
        temporary = 0.08*MUZZLETEMP;
    };

    class recoil_pistol_signal: recoil_default {
        muzzleOuter[] = {0.2*MUZZLERIGHT_POS,1.5*MUZZLECLIMB_POS,0.2*MUZZLERIGHT_MAG,0.3*MUZZLECLIMB_MAG};
        kickBack[] = {0.02*KICKBACK,0.04*KICKBACK};
        temporary = 0.02*MUZZLETEMP;
    };

    class recoil_rpg: recoil_default {
        muzzleOuter[] = {2*MUZZLERIGHT_POS,3*MUZZLECLIMB_POS,1*MUZZLERIGHT_MAG,0.5*MUZZLECLIMB_MAG};
        kickBack[] = {0.08*KICKBACK,0.1*KICKBACK};
        temporary = 0.1*MUZZLETEMP;
    };

    class recoil_nlaw: recoil_default {
        muzzleOuter[] = {2*MUZZLERIGHT_POS,3*MUZZLECLIMB_POS,1*MUZZLERIGHT_MAG,0.5*MUZZLECLIMB_MAG};
        kickBack[] = {0.06*KICKBACK,0.08*KICKBACK};
        temporary = 0.08*MUZZLETEMP;
    };

    class recoil_titan_long: recoil_default {
        muzzleOuter[] = {2*MUZZLERIGHT_POS,3*MUZZLECLIMB_POS,1*MUZZLERIGHT_MAG,0.5*MUZZLECLIMB_MAG};
        kickBack[] = {0.1*KICKBACK,0.12*KICKBACK};
        temporary = 0.15*MUZZLETEMP;
    };

    class recoil_titan_short: recoil_default {
        muzzleOuter[] = {2*MUZZLERIGHT_POS,3*MUZZLECLIMB_POS,1*MUZZLERIGHT_MAG,0.5*MUZZLECLIMB_MAG};
        kickBack[] = {0.1*KICKBACK,0.12*KICKBACK};
        temporary = 0.12*MUZZLETEMP;
    };

    class recoil_mk200: recoil_default {
        muzzleOuter[] = {0.4*MUZZLERIGHT_POS,0.6*MUZZLECLIMB_POS,0.6*MUZZLERIGHT_MAG,0.2*MUZZLECLIMB_MAG};
        kickBack[] = {0.03*KICKBACK,0.06*KICKBACK};
        temporary = 0.01*MUZZLETEMP; //0.005*MUZZLETEMP;
    };

    class recoil_zafir: recoil_default {
        muzzleOuter[] = {0.5*MUZZLERIGHT_POS,1*MUZZLECLIMB_POS,0.7*MUZZLERIGHT_MAG,0.3*MUZZLECLIMB_MAG};
        kickBack[] = {0.02*KICKBACK,0.08*KICKBACK};
        temporary = 0.01*MUZZLETEMP; //0.005*MUZZLETEMP;
    };

    class recoil_m320: recoil_default {
        muzzleOuter[] = {1*MUZZLERIGHT_POS,3*MUZZLECLIMB_POS,0.5*MUZZLERIGHT_MAG,0.6*MUZZLECLIMB_MAG};
        kickBack[] = {0.08*KICKBACK,0.1*KICKBACK};
        temporary = 0.02*MUZZLETEMP;
    };

    class recoil_gm6: recoil_default {
        muzzleOuter[] = {1.4*MUZZLERIGHT_POS,3.5*MUZZLECLIMB_POS,0.7*MUZZLERIGHT_MAG,0.8*MUZZLECLIMB_MAG};
        kickBack[] = {0.1*KICKBACK,0.12*KICKBACK};
        temporary = 0.025*MUZZLETEMP;
    };

    class recoil_ebr: recoil_default {
        muzzleOuter[] = {0.4*MUZZLERIGHT_POS,1.5*MUZZLECLIMB_POS,0.6*MUZZLERIGHT_MAG,0.4*MUZZLECLIMB_MAG};
        kickBack[] = {0.04*KICKBACK,0.07*KICKBACK};
        temporary = 0.01*MUZZLETEMP;
    };

    class recoil_dmr_01: recoil_default {
        muzzleOuter[] = {0.5*MUZZLERIGHT_POS,2*MUZZLECLIMB_POS,0.5*MUZZLERIGHT_MAG,0.5*MUZZLECLIMB_MAG};
        kickBack[] = {0.03*KICKBACK,0.08*KICKBACK};
        temporary = 0.015*MUZZLETEMP;
    };

    class recoil_dmr_02: recoil_default {
        muzzleOuter[] = {0.5*MUZZLERIGHT_POS,2.5*MUZZLECLIMB_POS,0.6*MUZZLERIGHT_MAG,0.5*MUZZLECLIMB_MAG};
        kickBack[] = {0.06*KICKBACK,0.08*KICKBACK};
        temporary = 0.01*MUZZLETEMP;
    };

    class recoil_dmr_03: recoil_default {
        muzzleOuter[] = {0.3*MUZZLERIGHT_POS,1.5*MUZZLECLIMB_POS,0.5*MUZZLERIGHT_MAG,0.4*MUZZLECLIMB_MAG};
        kickBack[] = {0.03*KICKBACK,0.06*KICKBACK};
        temporary = 0.005*MUZZLETEMP;
    };

    class recoil_dmr_04: recoil_default {
        muzzleOuter[] = {0.4*MUZZLERIGHT_POS,1.5*MUZZLECLIMB_POS,0.5*MUZZLERIGHT_MAG,0.4*MUZZLECLIMB_MAG};
        kickBack[] = {0.02*KICKBACK,0.04*KICKBACK};
        temporary = 0.015*MUZZLETEMP;
    };

    class recoil_dmr_05: recoil_default {
        muzzleOuter[] = {0.5*MUZZLERIGHT_POS,2.5*MUZZLECLIMB_POS,0.8*MUZZLERIGHT_MAG,0.6*MUZZLECLIMB_MAG};
        kickBack[] = {0.08*KICKBACK,0.1*KICKBACK};
        temporary = 0.01*MUZZLETEMP;
    };

    class recoil_dmr_06: recoil_default {
        muzzleOuter[] = {0.5*MUZZLERIGHT_POS,2*MUZZLECLIMB_POS,0.7*MUZZLERIGHT_MAG,0.5*MUZZLECLIMB_MAG};
        kickBack[] = {0.05*KICKBACK,0.1*KICKBACK};
        temporary = 0.01*MUZZLETEMP;
    };

    class recoil_mmg_01: recoil_default {
        muzzleOuter[] = {0.6*MUZZLERIGHT_POS,1.5*MUZZLECLIMB_POS,0.8*MUZZLERIGHT_MAG,0.3*MUZZLECLIMB_MAG};
        kickBack[] = {0.02*KICKBACK,0.08*KICKBACK};
        temporary = 0.01*MUZZLETEMP; //0.005*MUZZLETEMP;
    };

    class recoil_mmg_02: recoil_default {
        muzzleOuter[] = {0.5*MUZZLERIGHT_POS,1.5*MUZZLECLIMB_POS,0.6*MUZZLERIGHT_MAG,0.4*MUZZLECLIMB_MAG};
        kickBack[] = {0.04*KICKBACK,0.08*KICKBACK};
        temporary = 0.01*MUZZLETEMP; //0.005*MUZZLETEMP;
    };
};
