// CfgWeapons

// Variations
// 01 sides up 02 normal 03 front up 04 l side up 05 r side up
// 06-08 anzac
// 09 rebel - not compatible
//Colors
// 01 green 02 tiger 03 black 04 spray 05 tiger green 06 erdl brown 07 leopard 08 erdl
// 09 gray <- Fuck this - inheritance is fucking horrible as fuck.

// Macros
#define CN(variation,color) vn_b_boonie_##variation##_##color

// Base Boonie
#define CAMO_BASE 01
class CN(02,CAMO_BASE) : vn_b_headgear_base { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { Q(CN(01,CAMO_BASE)), Q(CN(03,CAMO_BASE)), Q(CN(04,CAMO_BASE)), Q(CN(05,CAMO_BASE)) }; }; };
class CN(01,CAMO_BASE) : CN(02,CAMO_BASE)   { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { Q(CN(02,CAMO_BASE)), Q(CN(03,CAMO_BASE)), Q(CN(04,CAMO_BASE)), Q(CN(05,CAMO_BASE)) }; }; };
class CN(03,CAMO_BASE) : CN(02,CAMO_BASE)   { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { Q(CN(01,CAMO_BASE)), Q(CN(02,CAMO_BASE)), Q(CN(04,CAMO_BASE)), Q(CN(05,CAMO_BASE)) }; }; };
class CN(04,CAMO_BASE) : CN(02,CAMO_BASE)   { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { Q(CN(01,CAMO_BASE)), Q(CN(02,CAMO_BASE)), Q(CN(03,CAMO_BASE)), Q(CN(05,CAMO_BASE)) }; }; };
class CN(05,CAMO_BASE) : CN(02,CAMO_BASE)   { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { Q(CN(01,CAMO_BASE)), Q(CN(02,CAMO_BASE)), Q(CN(03,CAMO_BASE)), Q(CN(04,CAMO_BASE)) }; }; };


#define CN_COLORS(CAMO)\
class CN(02,CAMO) : CN(02,01)   { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { Q(CN(01,CAMO)), Q(CN(03,CAMO)), Q(CN(04,CAMO)), Q(CN(05,CAMO)) }; }; };\
class CN(01,CAMO) : CN(02,CAMO) { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { Q(CN(02,CAMO)), Q(CN(03,CAMO)), Q(CN(04,CAMO)), Q(CN(05,CAMO)) }; }; };\
class CN(03,CAMO) : CN(02,CAMO) { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { Q(CN(01,CAMO)), Q(CN(02,CAMO)), Q(CN(04,CAMO)), Q(CN(05,CAMO)) }; }; };\
class CN(04,CAMO) : CN(02,CAMO) { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { Q(CN(01,CAMO)), Q(CN(02,CAMO)), Q(CN(03,CAMO)), Q(CN(05,CAMO)) }; }; };\
class CN(05,CAMO) : CN(02,CAMO) { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { Q(CN(01,CAMO)), Q(CN(02,CAMO)), Q(CN(03,CAMO)), Q(CN(04,CAMO)) }; }; };\

CN_COLORS(02)
CN_COLORS(03)
CN_COLORS(04)
CN_COLORS(05)


// Base classes in CfgWeapons.hpp
// 06-08 anzac

#define BOONIE_ANZAC(VAR)
class CN(06,VAR) : CN(02,01)  { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { Q(CN(07,VAR)), Q(CN(08,VAR)) }; }; };
class CN(07,VAR) : CN(06,VAR) { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { Q(CN(06,VAR)), Q(CN(08,VAR)) }; }; };
class CN(08,VAR) : CN(06,VAR) { class PVAR(wardrobe) : EGVAR(wardrobe,base) { modifiableTo[] = { Q(CN(06,VAR)), Q(CN(07,VAR)) }; }; };

BOONIE_ANZAC(01)
BOONIE_ANZAC(02)