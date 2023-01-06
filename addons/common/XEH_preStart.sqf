#include "script_component.hpp"

#include "XEH_PREP.hpp"

private _notLoaded = configProperties [configfile >> "ace_notLoaded", "isText _x"];
{
    TRACE_2("not loaded",configName _x, getText _x);
} forEach _notLoaded;
