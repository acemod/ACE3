#include "script_component.hpp"

if (!hasInterface) exitWith {};

["interactMenuOpened", {_this call FUNC(interactEH)}] call CBA_fnc_addEventHandler;
