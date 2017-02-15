#include "script_component.hpp"

#include "initKeybinds.sqf"

GVAR(RangeCardOpened) = false;

GVAR(controls) = [];

GVAR(zeroRange) = 100;
GVAR(boreHeight) = 3.81;
GVAR(ammoClass) = "B_65x39_Caseless";
GVAR(magazineClass) = "30Rnd_65x39_caseless_mag";
GVAR(weaponClass) = "arifle_MXM_F";

GVAR(zeroRangeCopy) = 100;
GVAR(boreHeightCopy) = 3.81;
GVAR(ammoClassCopy) = "";//"ACE_762x51_Ball_M118LR";
GVAR(magazineClassCopy) = "";//"ACE_20Rnd_762x51_M118LR_Mag";
GVAR(weaponClassCopy) = "";//srifle_DMR_06_olive_F";
