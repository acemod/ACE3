#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

["CAManBase", "init", {
    (_this select 0) addEventHandler ["HandleDamage", {
        _this call FUNC(handleDamage);
    }];
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

ADDON = true;
