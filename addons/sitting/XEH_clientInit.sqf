#include "script_component.hpp"

["isNotSitting", {!((_this select 0) getVariable [QGVAR(isSitting), false])}] call EFUNC(common,addCanInteractWithCondition);
