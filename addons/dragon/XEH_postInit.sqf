#include "script_component.hpp"

[QGVAR(detachSight), LINKFUNC(sightDetach)] call CBA_fnc_addEventHandler;
[QGVAR(attachSight), LINKFUNC(sightAttach)] call CBA_fnc_addEventHandler;

["vehicle", {
    params ["","_vehicle"];
    TRACE_2("vehicle change",_vehicle,typeOf _vehicle);
    if (!(_vehicle isKindOf QGVAR(staticBase))) exitWith {};

    _vehicle animate ["rest_rotate", 0];

    if (isNil QGVAR(pfID)) then {GVAR(pfID) = -1};
    [GVAR(pfID)] call CBA_fnc_removePerFrameHandler;

    private _lastView = cameraView;
    if (!(_lastView in ["INTERNAL", "EXTERNAL"])) then { _lastView == "INTERNAL"; };

    GVAR(pfID) = [{
        params ["_args"];
        (_this select 0) params ["_vehicle", "_lastView"];

        if ((!alive _vehicle) || {!alive ACE_player} || {(vehicle ACE_player) != _vehicle}) exitWith {
            TRACE_1("exiting PFEH",GVAR(pfID));
            [GVAR(pfID)] call CBA_fnc_removePerFrameHandler;
            if ((alive _vehicle) && {!alive gunner _vehicle}) then {
                TRACE_1("reseting rest rotate anim",_vehicle);
                _vehicle animate ["rest_rotate", -0.35];
            };
        };

        if (cameraView in ["INTERNAL", "EXTERNAL"]) then {
            _args set [1, cameraView];
        } else {
            if ((cameraOn == _vehicle) && {!(_vehicle getVariable [QGVAR(sightAttached), ((typeOf _vehicle) == QGVAR(staticAssembled))])}) then {
                _vehicle switchCamera _lastView;
            };
        };
    }, 0, [_vehicle, _lastView]] call CBA_fnc_addPerFrameHandler;
    TRACE_1("started PFEH",GVAR(pfID));
}, true] call CBA_fnc_addPlayerEventHandler;
