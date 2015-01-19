// by commy2
#include "script_component.hpp"

GVAR(isKestrel) = false;
GVAR(isKestrelWheel) = false;

(["ACE_KestrelWheel"] call BIS_fnc_rscLayer) cutText  ["", "PLAIN", 0, false];
(["ACE_Kestrel"]      call BIS_fnc_rscLayer) cutText  ["", "PLAIN", 0, false];
