//XEH_pre_init.sqf
#include "script_component.hpp"

ADDON = false;

GVAR(activeGun) = nil;
GVAR(m137Gun) = nil;
GVAR(gunActionIds) = [];
GVAR(m137_shift) = false;
GVAR(m137_ctrl) = false;

PREP(endShift);
PREP(alignGun);

PREP(adjustTraverse);
PREP(adjustElevation);
PREP(recoil);
PREP(levelGun);

PREP(m137_monitorSight);
PREP(m137_bubbleLevel);
PREP(m137_keyDown);
PREP(m137_keyUp);
PREP(m137_stopMonitorSight);
PREP(m137_adjustAzimuth);
PREP(m137_adjustElevation);
PREP(m137_adjustReset);
PREP(m137_adjustOpticElevation);
PREP(m137_changeView);

PREP(XEH_getin);
PREP(XEH_getout);

PREP(textPad);

ADDON = true;