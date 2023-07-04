#include "script_component.hpp"

if (hasInterface) then {
    ["ace_interactMenuOpened", {_this call FUNC(interactEH)}] call CBA_fnc_addEventHandler;
    GVAR(possibleWirecutters) = configProperties [configFile >> "CfgWeapons", "getNumber (_x >> 'ACE_isWirecutter') == 1", true];
};

if (isServer) then {
    [QGVAR(destroyFence), {_this call FUNC(destroyFence)}] call CBA_fnc_addEventHandler;
};
