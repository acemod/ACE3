#include "script_component.hpp"

ADDON = false;

PREP(onLoadKestrel);
PREP(onLoadKestrelWheel);
PREP(openKestrel);
PREP(closeKestrel);

GVAR(isKestrel) = false;
GVAR(isKestrelWheel) = false;

ADDON = true;
