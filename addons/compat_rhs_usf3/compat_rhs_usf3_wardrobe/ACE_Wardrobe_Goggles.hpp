// Macro Definition
#define RHS_SHEMAGH_GOGGLES(ShemaghLow,ShemaghHigh,ShemaghLowGoggles,ShemaghHighGoggles,Ess)\
class ShemaghLow: EGVAR(wardrobe,base) {\
  class modifiableTo {\
    class ShemaghHigh {};\
    class ShemaghLowGoggles {};\
  };\
  components[] = {};\
};\
class ShemaghHigh: EGVAR(wardrobe,base) {\
  class modifiableTo {\
    class ShemaghLow {};\
    class ShemaghHighGoggles {};\
  };\
  components[] = {};\
};\
class ShemaghLowGoggles: EGVAR(wardrobe,base) {\
  class modifiableTo {\
    class ShemaghLow {};\
    class ShemaghHighGoggles {};\
  };\
  components[] = {QUOTE(Ess)};\
};\
class ShemaghHighGoggles: EGVAR(wardrobe,base) {\
  class modifiableTo {\
    class ShemaghHigh {};\
    class ShemaghLowGoggles {};\
  };\
  components[] = {QUOTE(Ess)};\
}

RHS_SHEMAGH_GOGGLES(rhsusf_shemagh_grn,rhsusf_shemagh2_grn,rhsusf_shemagh_gogg_grn,rhsusf_shemagh2_gogg_grn,rhsusf_oakley_goggles_blk);
RHS_SHEMAGH_GOGGLES(rhsusf_shemagh_od,rhsusf_shemagh2_od,rhsusf_shemagh_gogg_od,rhsusf_shemagh2_gogg_od,rhsusf_oakley_goggles_blk);
RHS_SHEMAGH_GOGGLES(rhsusf_shemagh_white,rhsusf_shemagh2_white,rhsusf_shemagh_gogg_white,rhsusf_shemagh2_gogg_white,rhsusf_oakley_goggles_blk);
RHS_SHEMAGH_GOGGLES(rhsusf_shemagh_tan,rhsusf_shemagh2_tan,rhsusf_shemagh_gogg_tan,rhsusf_shemagh2_gogg_tan,rhsusf_oakley_goggles_blk);
