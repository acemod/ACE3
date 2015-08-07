
#include "script_component.hpp"

["SettingsInitialized", {
    {
        if !(_x select 8 in GVAR(categories)) then {
            GVAR(categories) pushback (_x select 8);
            diag_log format["Category: %1", _x];
        };
    }foreach EGVAR(common,settings);
}] call EFUNC(common,addEventHandler);
