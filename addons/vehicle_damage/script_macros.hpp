#define CONST_TIME 0.03
#define MAX_CREW_BAILOUT_TIME 12

#define BAILOUT_CHANCE_SHOOT 0.5
#define BAILOUT_CHANCE_MOVE 0.8

#define IS_EXPLOSIVE_AMMO(ammo) (getNumber (ammo call CBA_fnc_getObjectConfig >> "explosive") > 0.5)

#define ENGINE_HITPOINTS [["hitengine"], "engine"]
#define HULL_HITPOINTS [["hithull", "hitbody", "#structural"],"hull"]
#define TRACK_HITPOINTS [["hitltrack", "hitrtrack"], "track"]
#define WHEEL_HITPOINTS [["hitlbwheel", "hitlmwheel", "hitlfwheel", "hitlf2wheel", "hitrbwheel", "hitrmwheel", "hitrlwheel", "hitrfwheel", "hitrf2wheel"], "wheel"]
#define FUEL_HITPOINTS [["hitfuel"], "fuel"]
#define ALL_HITPOINTS [ENGINE_HITPOINTS, HULL_HITPOINTS, TRACK_HITPOINTS, WHEEL_HITPOINTS, FUEL_HITPOINTS]

#define CRITICAL_HITPOINTS ["hithull", 0.89, "hitbody", 0.89, "#structural", 0.89, "hitengine", 0.9]

#define WARHEAD_TYPE_HE 0
#define WARHEAD_TYPE_AP 1
#define WARHEAD_TYPE_HEAT 2
#define WARHEAD_TYPE_TANDEM 3
#define WARHEAD_TYPE_NONE 4

#define EJECT_IF_DESTROYED_VEHICLES ["Boat_Transport_02_base_F", "Rubber_duck_base_F"]


#define CREATE_INCENDIARY_AMMO(ammo,base,inc) class ammo : base { GVAR(incendiary) = inc; }
