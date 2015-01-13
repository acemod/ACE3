// by commy2
#include "script_component.hpp"

private ["_player", "_weapon"];

_player = _this select 0;
_weapon = _this select 1;

// don't consume the barrel, but rotate through them.
//player removeItem "ACE_SpareBarrel";

[localize "STR_ACE_Overheating_SwappedBarrel", QUOTE(PATHOF(UI\spare_barrel_ca.paa))] call EFUNC(core,displayTextPicture);

_player setVariable [format [QGVAR(%1), _weapon], [0, 0], false];
