#include "script_component.hpp"

ADDON = false;

// Effects classes

PREP(doFlameout);

PREP(doCookoff);
GVAR(cookOffCount) = 0;

//BIS_fn_createFireEffect


ADDON = true;
