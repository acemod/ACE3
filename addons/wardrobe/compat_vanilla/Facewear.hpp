// CfgGlasses

// Parents
class None;

class G_Lowprofile : None { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { Q(G_Balaclava_lowprofile) }; components[] = {"G_Lowprofile"}; }; };
class G_Combat : None { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { Q(G_Balaclava_combat), Q(G_Balaclava_TI_G_blk_F), Q(G_Balaclava_TI_G_tna_F) }; components[] = {"G_Combat"}; }; };


// Balaclava, black
class G_Balaclava_blk : None { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { Q(G_Balaclava_lowprofile), Q(G_Balaclava_combat) }; components[] = {"G_Balaclava_blk"}; }; };
class G_Balaclava_combat : G_Balaclava_blk { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { Q(G_Balaclava_blk) }; components[] = {"G_Balaclava_blk","G_Combat"}; }; };
class G_Balaclava_lowprofile : G_Balaclava_blk { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { Q(G_Balaclava_blk) }; components[] = {"G_Balaclava_blk","G_Lowprofile"}; }; };


// Stealth Balaclava, black
class G_Balaclava_TI_blk_F : None { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { Q(G_Balaclava_TI_G_blk_F) }; components[] = {"G_Balaclava_TI_blk_F"}; }; };
class G_Balaclava_TI_G_blk_F : G_Balaclava_TI_blk_F { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { Q(G_Balaclava_TI_blk_F) }; components[] = {"G_Balaclava_TI_blk_F","G_Combat"}; }; };


// Stealth Balaclava, green(tanoa)
class G_Balaclava_TI_tna_F : G_Balaclava_TI_blk_F { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { Q(G_Balaclava_TI_G_tna_F) }; components[] = {"G_Balaclava_TI_tna_F"}; }; };
class G_Balaclava_TI_G_tna_F : G_Balaclava_TI_tna_F { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { Q(G_Balaclava_TI_tna_F) }; components[] = {"G_Balaclava_TI_tna_F","G_Combat"}; }; };
