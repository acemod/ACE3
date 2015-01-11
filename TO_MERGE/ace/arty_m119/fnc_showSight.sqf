//fnc_showSight.sqf
#include "script_component.hpp"
disableSerialization;
createDialog "acex_arty_m137_dialog";
PARAMS_1(_gun);

GVAR(m137Gun) = _gun;