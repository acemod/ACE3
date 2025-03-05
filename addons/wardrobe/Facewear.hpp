// CfgGlasses

// Parents
class None;
class G_WirelessEarpiece_base_F;
class G_EyeProtectors_base_F;

// Common Components
class G_Lowprofile: None {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { "G_Balaclava_lowprofile" };
        components[] = {"G_Lowprofile"};
    };
};
class G_Combat: None {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { "G_Balaclava_combat", "G_Balaclava_TI_G_blk_F", "G_Balaclava_TI_G_tna_F" };
        components[] = {"G_Combat"};
    };
};

class G_Aviator: None {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { "G_Bandanna_aviator" };
        components[] = {"G_Aviator"};
    };
};
class G_Shades_Black: None {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { "G_Bandanna_shades" }; 
        components[] = {"G_Shades_Black"};
    };
};


// Balaclava, black
class G_Balaclava_blk: None {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { "G_Balaclava_lowprofile", "G_Balaclava_combat" };
        components[] = { "G_Balaclava_blk" };
    };
};
class G_Balaclava_combat: G_Balaclava_blk {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { "G_Balaclava_blk" };
        components[] = {"G_Balaclava_blk", "G_Combat"};
    };
};
class G_Balaclava_lowprofile: G_Balaclava_blk {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { "G_Balaclava_blk" };
        components[] = { "G_Balaclava_blk", "G_Lowprofile" };
    };
};

// Stealth Balaclava, black
class G_Balaclava_TI_blk_F: None {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { "G_Balaclava_TI_G_blk_F" };
        components[] = { "G_Balaclava_TI_blk_F" };
    };
};
class G_Balaclava_TI_G_blk_F: G_Balaclava_TI_blk_F {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { "G_Balaclava_TI_blk_F" };  
        components[] = { "G_Balaclava_TI_blk_F", "G_Combat" };
    };
};

// Stealth Balaclava, green(tanoa)
class G_Balaclava_TI_tna_F: G_Balaclava_TI_blk_F {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { "G_Balaclava_TI_G_tna_F" };
        components[] = { "G_Balaclava_TI_tna_F" };
    };
};
class G_Balaclava_TI_G_tna_F: G_Balaclava_TI_tna_F {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { "G_Balaclava_TI_tna_F" };  
        components[] = { "G_Balaclava_TI_tna_F", "G_Combat" };
    };
};

// Bandana, Black
class G_Bandanna_blk: G_Balaclava_blk {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { "G_Bandanna_aviator", "G_Bandanna_sport", "G_Bandanna_shades" };
        components[] = { "G_Bandanna_blk" };
    };
};

class G_Bandanna_shades: G_Bandanna_blk {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { "G_Bandanna_blk", "G_Shades_Black" };  
        components[] = { "G_Bandanna_blk", "G_Shades_Black" };
    };
};
class G_Bandanna_sport: G_Bandanna_shades {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { "G_Bandanna_blk", "G_Sport_Blackred" };
        components[] = { "G_Bandanna_blk", "G_Sport_Blackred" };
    };
};
class G_Bandanna_aviator: G_Bandanna_shades {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { "G_Bandanna_blk", "G_Aviator" };       
        components[] = { "G_Bandanna_blk", "G_Aviator" };
    };
};


// Eye Protector
class G_EyeProtectors_F:  G_EyeProtectors_base_F {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { "G_EyeProtectors_Earpiece_F" };               
        components[] = { "G_EyeProtectors_F" };
    };
};
class G_EyeProtectors_Earpiece_F: G_EyeProtectors_base_F {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { "G_EyeProtectors_F", "G_WirelessEarpiece_F" };
        components[] = { "G_EyeProtectors_F", "G_WirelessEarpiece_F" };
    };
};
class G_WirelessEarpiece_F:   G_WirelessEarpiece_base_F {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { "G_EyeProtectors_Earpiece_F" };               
        components[] = { "G_WirelessEarpiece_F" };
    };
};
