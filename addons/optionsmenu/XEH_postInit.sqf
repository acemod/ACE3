
#include "script_component.hpp"

["SettingsInitialized", {
    GVAR(categories) pushBack "";  //Ensure All Catagories is at top
    {
        if !(_x select 8 in GVAR(categories)) then {
            GVAR(categories) pushBack (_x select 8);
        };
    }forEach EGVAR(common,settings);
}] call EFUNC(common,addEventHandler);
