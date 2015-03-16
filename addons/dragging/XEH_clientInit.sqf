// by PabstMirror, commy2

#include "script_component.hpp"

GVAR(currentHeightChange) = 0;

//[{_this call DFUNC(handleScrollWheel)}] call FUNC(common,addScrollWheelEventHandler);

if (isNil QGVAR(maxWeight)) then {
    GVAR(maxWeight) = 800;
};

["isNotDragging", {!((_this select 0) getVariable [QGVAR(isDragging), false])}] call EFUNC(common,addCanInteractWithCondition);
