#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

// handle JIP
if (isServer) then {
    GVAR(allChildren) = [];
} else {
    // can't use CBA EH in postInit because too late for server PlayerConnected EH
    [QGVAR(setTowParentAllChildren), {
        params ["_children"];
        TRACE_1("setTowParentAllChildren",_children);
        {
            private _parent = _x getVariable QGVAR(parent);
            TRACE_2("setTowParent",_x,_parent);
            _x setTowParent _parent;
        } forEach _children;
    }] call CBA_fnc_addEventHandler;
};

ADDON = true;
