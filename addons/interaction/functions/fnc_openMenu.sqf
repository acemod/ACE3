// by commy2
#include "script_component.hpp"

private "_target";
_target = [cursorTarget, GVAR(Target)] select (_this == "Default");

[0, _target, ""] call FUNC(showMenu);
