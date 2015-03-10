#include "script_component.hpp"

if (!hasInterface) exitWith {};

["interact_keyDown", {_this call FUNC(interactEH)}] call EFUNC(common,addEventHandler);
