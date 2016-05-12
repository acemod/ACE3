#include "script_component.hpp"


["minedetector_enabled", {
    params ["_unit", "_type"];
    private _config = [_type] call FUNC(getDetectorConfig);

    private _helperObject = "ACE_LogicDummy" createVehicleLocal (getPos _unit);
    _unit setvariable [QGVAR(helperLogic), _helperObject];

    [FUNC(detectorLoop), 0.01, [_unit, _type, _config, ACE_time, _helperObject]] call CBA_fnc_addPerFrameHandler;
}] call EFUNC(common,addEventhandler);

["minedetector_disabled", {
    params ["_unit", "_type"];
    private _helperObject = _unit getvariable [QGVAR(helperLogic), objNull];
    if !(isNull _helperObject) then {
        deleteVehicle _helperObject;
    };
}] call EFUNC(common,addEventhandler);
