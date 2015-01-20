// by commy2
#include "script_component.hpp"

GVAR(isKestrel) = true;

(["ACE_Kestrel"] call BIS_fnc_rscLayer) cutRsc ["ACE_Kestrel", "PLAIN", 0, false];
