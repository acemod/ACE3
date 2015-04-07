#define DEBUG_MODE_FULL
#include "script_component.hpp"

FUNC(guidance_Hellfire_LOAL_HI_PFH) = {
 
};

FUNC(guidance_Hellfire_LOAL_DIR_PFH) = {

};


FUNC(guidance_Hellfire_LOAL_HI) = {
    PARAMS_7(_shooter,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile);
    
    GVAR(lastTime) = time;
    [FUNC(guidance_Hellfire_LOAL_HI_PFH), 0, _this] call cba_fnc_addPerFrameHandler;
};


FUNC(guidance_Hellfire_LOAL_DIR) = {
    PARAMS_7(_shooter,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile);
    
    GVAR(lastTime) = time;
    [FUNC(guidance_Hellfire_LOAL_DIR_PFH), 0, _this] call cba_fnc_addPerFrameHandler;
};

PARAMS_7(_shooter,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile);
_fireMode = _shooter getVariable ["ACE_FIRE_SELECTION", ACE_DEFAULT_FIRE_SELECTION];

switch (_fireMode select 0) do {
    // Default to FIREMODE_DIRECT_LOAL
    // FIREMODE_DIRECT_LOAL
    default {
        LOG("Initiating Hellfire II FIREMODE_LOAL_DIR");
        _this call FUNC(guidance_Hellfire_LOAL_DIR);
    };
};