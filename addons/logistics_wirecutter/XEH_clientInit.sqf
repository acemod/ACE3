#include "script_component.hpp"

if (!hasInterface) exitWith {};

["ace_interactMenuOpened", {_this call FUNC(interactEH)}] call CBA_fnc_addEventHandler;
