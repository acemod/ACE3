// CfgGlasses

// Parents
class None;

// Balaclava, black
class G_Balaclava_blk : None { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { Q(G_Balaclava_lowprofile), Q(G_Balaclava_combat) }; components[] = {""}; }; };
class G_Balaclava_combat : G_Balaclava_blk { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { Q(G_Balaclava_blk) }; components[] = {"G_Combat"}; }; };
class G_Balaclava_lowprofile : G_Balaclava_blk { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { Q(G_Balaclava_blk) }; components[] = {"G_Lowprofile"}; }; };
