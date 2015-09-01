// by commy2
#include "script_component.hpp"

((_this select 0) displayCtrl 1016) ctrlShow GVAR(mapShowCursorCoordinates);

// hide time when no map in inventory
((_this select 0) displayCtrl 101) ctrlShow GVAR(hasWatch);
