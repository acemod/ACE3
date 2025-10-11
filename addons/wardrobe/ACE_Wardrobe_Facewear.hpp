// Common Components
class G_Lowprofile: EGVAR(wardrobe,base) {
    class modifiableTo {
        class G_Balaclava_lowprofile {};
    };
    components[] = { "G_Lowprofile" };
};
class G_Combat: EGVAR(wardrobe,base) {
    class modifiableTo {
        class G_Balaclava_combat {};
        class G_Balaclava_TI_G_blk_F {};
        class G_Balaclava_TI_G_tna_F {};
    };
    components[] = { "G_Combat" };
};
class G_Aviator: EGVAR(wardrobe,base) {
    class modifiableTo {
        class G_Bandanna_aviator {};
    };
    components[] = { "G_Aviator" };
};
class G_Shades_Black: EGVAR(wardrobe,base) {
    class modifiableTo {
        class G_Bandanna_shades {};
    };
    components[] = { "G_Shades_Black" };
};


// Balaclava, black
class G_Balaclava_blk: EGVAR(wardrobe,base) {
    class modifiableTo {
        class G_Balaclava_lowprofile {};
        class G_Balaclava_combat {};
    };
    components[] = { "G_Balaclava_blk" };
};
class G_Balaclava_combat: EGVAR(wardrobe,base) {
    class modifiableTo {
        class G_Balaclava_blk {};
    };
    components[] = { "G_Balaclava_blk", "G_Combat" };
};
class G_Balaclava_lowprofile: EGVAR(wardrobe,base) {
    class modifiableTo {
        class G_Balaclava_blk {};
    };
    components[] = { "G_Balaclava_blk", "G_Lowprofile" };
};


// Stealth Balaclava, black
class G_Balaclava_TI_blk_F: EGVAR(wardrobe,base) {
    class modifiableTo {
        class G_Balaclava_TI_G_blk_F {};
    };
    components[] = { "G_Balaclava_TI_blk_F" };
};
class G_Balaclava_TI_G_blk_F: EGVAR(wardrobe,base) {
    class modifiableTo {
        class G_Balaclava_TI_blk_F {};
    };
    components[] = { "G_Balaclava_TI_blk_F", "G_Combat" };
};


// Stealth Balaclava, green(tanoa)
class G_Balaclava_TI_tna_F: EGVAR(wardrobe,base) {
    class modifiableTo {
        class G_Balaclava_TI_G_tna_F {};
    };
    components[] = { "G_Balaclava_TI_tna_F" };
};
class G_Balaclava_TI_G_tna_F: EGVAR(wardrobe,base) {
    class modifiableTo {
        class G_Balaclava_TI_tna_F {};
    };
    components[] = { "G_Balaclava_TI_tna_F", "G_Combat" };
};


// Bandana, Black
class G_Bandanna_blk: EGVAR(wardrobe,base) {
    class modifiableTo {
        class G_Bandanna_aviator {};
        class G_Bandanna_sport {};
        class G_Bandanna_shades {};
    };
    components[] = { "G_Bandanna_blk" };
};

class G_Bandanna_shades: EGVAR(wardrobe,base) {

    class modifiableTo {
        class G_Bandanna_blk {};
        class G_Shades_Black {};
    };
    components[] = { "G_Bandanna_blk", "G_Shades_Black" };
};
class G_Bandanna_sport: EGVAR(wardrobe,base) {
    class modifiableTo {
        class G_Bandanna_blk {};
        class G_Sport_Blackred {};
    };
    components[] = { "G_Bandanna_blk", "G_Sport_Blackred"};
};
class G_Bandanna_aviator: EGVAR(wardrobe,base) {
    class modifiableTo {
        class G_Bandanna_blk {};
        class G_Aviator {};
    };
    components[] = { "G_Bandanna_blk", "G_Aviator" };
};


// Eye Protector
class G_EyeProtectors_F: EGVAR(wardrobe,base) {
    class modifiableTo {
        class G_EyeProtectors_Earpiece_F {};
    };
    components[] = { "G_EyeProtectors_F" };
};

class G_EyeProtectors_Earpiece_F: EGVAR(wardrobe,base) {
    class modifiableTo {
        class G_EyeProtectors_F {};
        class G_WirelessEarpiece_F {};
    };
    components[] = { "G_EyeProtectors_F", "G_WirelessEarpiece_F" };
};

class G_WirelessEarpiece_F: EGVAR(wardrobe,base) {
    class modifiableTo {
        class G_EyeProtectors_Earpiece_F {};
    };
    components[] = { "G_WirelessEarpiece_F" };
};
