//#define DEBUG_MODE_FULL
#include "script_component.hpp"
//_this=[TEST_AI_HELICOPTER,"missiles_DAGR","missiles_DAGR","Far_AI","M_PG_AT","24Rnd_PG_missiles",163988: rocket_01_fly_f.p3d]
TRACE_1("enter", _this);
PARAMS_7(_shooter,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile);

if(!local _shooter) exitWith { false };

switch _weapon do {
    case "missiles_DAGR": {
        _this call FUNC(guidance_DAGR);
    };
    case "GBU12BombLauncher": {
        _this call FUNC(guidance_LGB);
    };
};

//_this call FUNC(guidance_HellfireII);
