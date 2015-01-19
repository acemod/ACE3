// by commy2
#include "script_component.hpp"

GVAR(isKestrel) = true;
GVAR(isKestrelWheel) = true;

(["ACE_KestrelWheel"] call BIS_fnc_rscLayer) cutRsc ["ACE_KestrelWheel", "PLAIN", 0, false];
(["ACE_Kestrel"]      call BIS_fnc_rscLayer) cutRsc ["ACE_Kestrel",      "PLAIN", 0, false];
