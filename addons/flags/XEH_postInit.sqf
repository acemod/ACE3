#include "script_component.hpp"

if (hasInterface) then {
    GVAR(isPlacing) = PLACE_CANCEL;
    ["ace_interactMenuOpened", {GVAR(isPlacing) = PLACE_CANCEL;}] call CBA_fnc_addEventHandler;
};
