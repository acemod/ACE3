#include "script_component.hpp"

// THIS FUNCTION SHOULD NOT BE USED BECAUSE IT CAUSES AN SEARCH AND REBUILD

PARAMS_1(_round);

GVAR(objects) = GVAR(objects) - [_round];
