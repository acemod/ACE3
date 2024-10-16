#define COMBAT_GOGGLES \
    ACE_Overlay = QPATHTOF(textures\HUD\CombatGoggles.paa); \
    ACE_OverlayCracked = QPATHTOF(textures\HUD\CombatGogglesCracked.paa); \
    ACE_Resistance = 2; \
    ACE_Protection = 1

#define GLASSESDEFAULT [false,[false,0,0,0],false]
#define GETGLASSES(unit) GETVAR(unit,GVAR(Condition),GLASSESDEFAULT)
#define SETGLASSES(unit,value) SETVAR(unit,GVAR(Condition),value)

#define COLOUR 8.0

#define DIRT 0
#define DUST 1
#define BROKEN 2

#define GETDIRT (GETGLASSES(ace_player) select DIRT)
#define GETDUST (GETGLASSES(ace_player) select DUST)
#define GETBROKEN (GETGLASSES(ace_player) select BROKEN)
#define GETDUSTT(type) ((GETGLASSES(ace_player) select DUST) select type)
#define SETDUST(type,value) (GETGLASSES(ace_player) select DUST) set [type,value]

#define DACTIVE 0
#define DTIME 1
#define DBULLETS 2
#define DAMOUNT 3

#define GLASSDISPLAY GETUVAR(GVAR(Display),displayNull)

#define CLAMP(x,low,high) (if(x > high)then{high}else{if(x < low)then{low}else{x}})

#define IDD_GOGGLES 1044
#define IDC_GOGGLES_OVERLAY 10650

#define IDD_GOGGLESEFFECTS 1045
#define IDC_GOGGLESEFFECTS_DIRT 10660
#define IDC_GOGGLESEFFECTS_DUST 10662
