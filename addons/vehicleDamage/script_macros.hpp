#define CONST_TIME 0.03
#define MAX_CREW_BAILOUT_TIME 12

#define BAILOUT_CHANCE_SHOOT 0.5
#define BAILOUT_CHANCE_MOVE 0.8

#define IS_EXPLOSIVE_AMMO(ammo) (getNumber (ammo call CBA_fnc_getObjectConfig >> "explosive") > 0.5)

#define ENGINE_HITPOINTS [["hitengine"], "engine"]
#define HULL_HITPOINTS [["hithull"],"hull"]
#define TRACK_HITPOINTS [["hitltrack", "hitrtrack"], "track"]
#define WHEEL_HITPOINTS [["hitlbwheel", "hitlmwheel", "hitlfwheel", "hitlf2wheel", "hitrbwheel", "hitrlwheel", "hitrfwheel", "hitrf2wheel"], "wheel"]
#define FUEL_HITPOINTS [["hitfuel"], "fuel"]
#define ALL_HITPOINTS [ENGINE_HITPOINTS, HULL_HITPOINTS, TRACK_HITPOINTS, WHEEL_HITPOINTS, FUEL_HITPOINTS]

#define WARHEAD_TYPE_HE 0
#define WARHEAD_TYPE_AP 1
#define WARHEAD_TYPE_HEAT 2
#define WARHEAD_TYPE_TANDEM 3
#define WARHEAD_TYPE_NONE 4

