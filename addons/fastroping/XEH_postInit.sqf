#include "script_component.hpp"

[QGVAR(deployRopes), {
    _this call FUNC(deployRopes);
}] call CFUNC(addEventHandler);

[QGVAR(startFastRope), {
    [FUNC(fastRopeServerPFH), 0, _this] call CBA_fnc_addPerFrameHandler;
}] call CFUNC(addEventHandler);
