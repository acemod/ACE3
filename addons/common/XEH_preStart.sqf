#include "script_component.hpp"

#include "XEH_PREP.hpp"

if (isFilePatchingEnabled) then {
    private _notLoaded = configProperties [configfile >> "ace_notLoaded", "isText _x"];
    {
        INFO_2("%1 not loaded because %2",configName _x, getText _x);
    } forEach _notLoaded;
};
