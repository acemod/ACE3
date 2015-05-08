#include "script_component.hpp"

if (!GVAR(changeAllowed)) exitWith {};  // if viewdistance is disabled from config, exit here.
[] call FUNC(initViewDistance);