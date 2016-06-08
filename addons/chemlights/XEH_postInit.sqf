#include "script_component.hpp"

if (isServer) then {
    [QGVAR(IRTimer), {_this call FUNC(IRTimer)}] call CBA_fnc_addEventHandler;
};

if (!hasInterface) exitWith {};

["firedPlayer", DFUNC(throwEH)] call EFUNC(common,addEventHandler);
["firedPlayerNonLocal", DFUNC(throwEH)] call EFUNC(common,addEventHandler);
["firedNonPlayer", DFUNC(throwEH)] call EFUNC(common,addEventHandler);

["interactMenuOpened", {_this call FUNC(interactEH)}] call EFUNC(common,addEventHandler);
