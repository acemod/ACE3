#include "script_component.hpp"

[QGVAR(deployRopes), {
    _this call FUNC(deployRopes);
}] call EFUNC(common,addEventHandler);

[QGVAR(startFastRope), {
    [FUNC(fastRopeServerPFH), 0, _this] call CBA_fnc_addPerFrameHandler;
}] call EFUNC(common,addEventHandler);

[QGVAR(ropeDetach), {
    params ["_object", "_rope"];
    _object ropeDetach _rope;
}] call EFUNC(common,addEventHandler);
