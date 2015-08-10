#include "script_component.hpp"

PREP(lockKeyDown);
PREP(lockKeyUp);

PREP(cycleFireMode);
PREP(showFireMode);

PREP(onFired);
PREP(onOpticLoad);
PREP(onOpticDraw);
PREP(onOpticUnload);

GVAR(isLockKeyDown) = false;
GVAR(pfehID) = -1;
