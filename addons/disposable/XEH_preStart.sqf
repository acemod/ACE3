#include "script_component.hpp"

#include "XEH_PREP.hpp"

// Show warning for launchers still using disposables
{
    private _nonInheritedCfg = configProperties [_x, "configName _x == 'ACE_UsedTube'", false];
    if ((count _nonInheritedCfg) == 1) then {
        private _weapon = configName _x;
        if (_weapon != "launch_NLAW_F") then { // ignore the one we modifiy ourselves
            WARNING_1("[%1] ACE_disposables functionality will be removed in a future version - switch to CBA Disposables",_weapon);
        };
    };
} forEach ("isText (_x >> 'ACE_UsedTube')" configClasses (configFile >> "CfgWeapons"));
