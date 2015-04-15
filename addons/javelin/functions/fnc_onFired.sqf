//#define DEBUG_MODE_FULL
#include "script_component.hpp"

PARAMS_7(_shooter,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile);

// Bail on not missile
if(! (_weapon in ["launch_Titan_short_F"]) ) exitWith { false }; 

_pfh_handle = uiNamespace getVariable ["ACE_RscOptics_javelin_PFH", nil];
if(!isNil "_pfh_handle") then {
    //[_pfh_handle] call cba_fnc_removePerFrameHandler;
    //uiNamespace setVariable["ACE_RscOptics_javelin_PFH", nil];
    
    __JavelinIGUITargeting ctrlShow false;
    __JavelinIGUITargetingGate ctrlShow false;
    __JavelinIGUITargetingLines ctrlShow false;
    __JavelinIGUITargetingConstraints ctrlShow false;
};