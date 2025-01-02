// CfgGlasses

// Parents
class None;

// Balaclava, black
class G_Balaclava_blk : None { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { Q(G_Balaclava_lowprofile), Q(G_Balaclava_combat) }; components[] = {""}; }; };
class G_Balaclava_combat : G_Balaclava_blk { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { Q(G_Balaclava_blk) }; components[] = {"G_Combat"}; }; };
class G_Balaclava_lowprofile : G_Balaclava_blk { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { Q(G_Balaclava_blk) }; components[] = {"G_Lowprofile"}; }; };


// Stealth Balaclava, black
class G_Balaclava_TI_blk_F : None { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { Q(G_Balaclava_TI_G_blk_F) }; components[] = {""}; }; };
class G_Balaclava_TI_G_blk_F : G_Balaclava_TI_blk_F { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { Q(G_Balaclava_TI_blk_F) }; components[] = {"G_Combat"}; }; };

// Stealth Balaclava, green(tanoa)
class G_Balaclava_TI_tna_F : G_Balaclava_TI_blk_F { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { Q(G_Balaclava_TI_G_tna_F) }; components[] = {""}; }; };
class G_Balaclava_TI_G_tna_F : G_Balaclava_TI_tna_F { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { Q(G_Balaclava_TI_tna_F) }; components[] = {"G_Combat"}; }; };
