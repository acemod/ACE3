#include "script_component.hpp"

ADDON = false;

PREP(onLoadKestrel);
PREP(openKestrel);
PREP(closeKestrel);

GVAR(isKestrel) = false;

ADDON = true;
