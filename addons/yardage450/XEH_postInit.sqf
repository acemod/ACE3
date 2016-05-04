#include "script_component.hpp"

#include "initKeybinds.sqf"

GVAR(active) = false;

GVAR(useYards) = false;

GVAR(powerButtonPressed) = false;
GVAR(powerOnTime) = 0;

GVAR(lasing) = false;
GVAR(targetAcquired) = false;
GVAR(targetRangeText) = "---";
