#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(rangeCardOpened) = false;

GVAR(controls) = [];

// Default entries to range card
GVAR(rangeCardInfo) = [100, 3.81, "B_65x39_Caseless", "30Rnd_65x39_caseless_mag", "arifle_MXM_F"];
GVAR(rangeCardCopyInfo) = [];
GVAR(rangeCardData) = createHashMap;

#include "initKeybinds.inc.sqf"
