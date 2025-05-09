// SAF requires RHS USAF, so we can use their Googles
// Combat Helmets
HELMET_GOGGLES(rhssaf_helmet_m97_black_nocamo,rhssaf_helmet_m97_black_nocamo_black_ess_bare,rhs_ess_black);
HELMET_GOGGLES(rhssaf_helmet_m97_nostrap_blue,rhssaf_helmet_m97_nostrap_blue_tan_ess_bare,rhs_ess_black);
HELMET_GOGGLES(rhssaf_helmet_m97_digital,rhssaf_helmet_m97_digital_black_ess_bare,rhs_ess_black);
HELMET_GOGGLES(rhssaf_helmet_m97_md2camo,rhssaf_helmet_m97_md2camo_black_ess_bare,rhs_ess_black);
HELMET_GOGGLES(rhssaf_helmet_m97_oakleaf,rhssaf_helmet_m97_oakleaf_black_ess_bare,rhs_ess_black);
HELMET_GOGGLES(rhssaf_helmet_m97_olive_nocamo,rhssaf_helmet_m97_olive_nocamo_black_ess_bare,rhs_ess_black);

//Special Case
class rhssaf_helmet_m97_woodland: EGVAR(wardrobe,base) {
    class modifiableTo { class rhssaf_helmet_m97_woodland_black_ess_bare; class rhssaf_helmet_m97_veil_woodland; };
    components[] = {};
};
class rhssaf_helmet_m97_woodland_black_ess_bare: EGVAR(wardrobe,base) {
    class modifiableTo { class rhssaf_helmet_m97_woodland; };
    components[] = {"rhs_ess_black"};
    alternativeDisplayName = ECSTRING(wardrobe,gogglesOff);
};

class rhssaf_helmet_m97_veil_woodland: EGVAR(wardrobe,base) {
    class modifiableTo { class rhssaf_helmet_m97_woodland; };
    components[] = {"rhssaf_veil_Green"};
    alternativeDisplayName = ECSTRING(wardrobe,maskOff);
};