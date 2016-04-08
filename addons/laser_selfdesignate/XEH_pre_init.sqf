#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(active) = false;

FUNC(getPosASL) = {visiblePositionASL (_this select 0)};

ADDON = true;
