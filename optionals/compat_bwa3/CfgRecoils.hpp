
#define KICKBACK 1.4

#define MUZZLETEMP 1.2
#define MUZZLEPERM 0.4

#define MUZZLECLIMB_POS 1
#define MUZZLERIGHT_POS 0.2

#define MUZZLECLIMB_MAG 1
#define MUZZLERIGHT_MAG 1

class cfgRecoils {
  class recoil_default;
  class BWA3_recoil_P8: recoil_default {
    muzzleOuter[] = {0.2*MUZZLERIGHT_POS,1.0*MUZZLECLIMB_POS,0.2*MUZZLERIGHT_MAG,0.3*MUZZLECLIMB_MAG};
    kickBack[] = {0.03*KICKBACK,0.06*KICKBACK};
    temporary = 0.03*MUZZLETEMP;
  };

  class BWA3_recoil_MP7: recoil_default {
    muzzleOuter[] = {0.2*MUZZLERIGHT_POS,1.0*MUZZLECLIMB_POS,0.3*MUZZLERIGHT_MAG,0.3*MUZZLECLIMB_MAG};
    kickBack[] = {0.02*KICKBACK,0.04*KICKBACK};
    temporary = 0.015*MUZZLETEMP;
  };

  class BWA3_recoil_G36: recoil_default {
    muzzleOuter[] = {0.2*MUZZLERIGHT_POS,0.6*MUZZLECLIMB_POS,0.2*MUZZLERIGHT_MAG,0.3*MUZZLECLIMB_MAG};
    kickBack[] = {0.01*KICKBACK,0.03*KICKBACK};
    temporary = 0.01*MUZZLETEMP;
  };
  class BWA3_recoil_G36K: recoil_default {
    muzzleOuter[] = {0.2*MUZZLERIGHT_POS,0.8*MUZZLECLIMB_POS,0.3*MUZZLERIGHT_MAG,0.3*MUZZLECLIMB_MAG};
    kickBack[] = {0.02*KICKBACK,0.04*KICKBACK};
    temporary = 0.015*MUZZLETEMP;
  };
  class BWA3_recoil_G36_LMG: recoil_default {
    muzzleOuter[] = {0.2*MUZZLERIGHT_POS,0.6*MUZZLECLIMB_POS,0.3*MUZZLERIGHT_MAG,0.2*MUZZLECLIMB_MAG};
    kickBack[] = {0.01*KICKBACK,0.03*KICKBACK};
    temporary = 0.005*MUZZLETEMP;
  };

  class BWA3_recoil_G28: recoil_default {
    muzzleOuter[] = {0.4*MUZZLERIGHT_POS,1.4*MUZZLECLIMB_POS,0.6*MUZZLERIGHT_MAG,0.4*MUZZLECLIMB_MAG};
    kickBack[] = {0.03*KICKBACK,0.07*KICKBACK};
    temporary = 0.01*MUZZLETEMP;
  };
  class BWA3_recoil_G27: recoil_default {
    muzzleOuter[] = {0.4*MUZZLERIGHT_POS,1.6*MUZZLECLIMB_POS,0.6*MUZZLERIGHT_MAG,0.4*MUZZLECLIMB_MAG};
    kickBack[] = {0.04*KICKBACK,0.08*KICKBACK};
    temporary = 0.015*MUZZLETEMP;
  };

  class BWA3_recoil_MG4: recoil_default {
    muzzleOuter[] = {0.4*MUZZLERIGHT_POS,0.6*MUZZLECLIMB_POS,0.6*MUZZLERIGHT_MAG,0.2*MUZZLECLIMB_MAG};
    kickBack[] = {0.03*KICKBACK,0.06*KICKBACK};
    temporary = 0.005*MUZZLETEMP;
  };

  class BWA3_recoil_MG5: recoil_default {};

  class BWA3_recoil_G82: recoil_default {
    muzzleOuter[] = {1.4*MUZZLERIGHT_POS,3.5*MUZZLECLIMB_POS,0.7*MUZZLERIGHT_MAG,0.8*MUZZLECLIMB_MAG};
    kickBack[] = {0.1*KICKBACK,0.12*KICKBACK};
    temporary = 0.025*MUZZLETEMP;
  };
};
