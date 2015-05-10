
#include "script_component.hpp"
PARAMS_5(_displayName,_iconImage,_conditionCode,_toggleCode,_closeCode);

GVAR(deviceKeyHandlingArray) pushBack [_displayName,_iconImage,_conditionCode,_toggleCode,_closeCode];
[] call FUNC(deviceKeyFindValidIndex);
