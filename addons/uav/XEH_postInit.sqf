#include "script_component.hpp"

["Air", "init", {
    params ["_vehicle"];
    if (!unitIsUAV _vehicle) exitWith {};
    if (!hasPilotCamera _vehicle) exitWith {};
    if ((getNumber (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> QUOTE(ADDON) >> "trackPilotCamera")) == 1) then {
        GVAR(singleOperatorUAVs) pushBack _vehicle;
    };
}, true, [], true] call CBA_fnc_addClassEventHandler;


GVAR(pfehID) = [{
    if (count GVAR(singleOperatorUAVs) < 1) exitWith {};
    {
        if(!alive _x) exitWith {
            GVAR(singleOperatorUAVs) deleteAt (GVAR(singleOperatorUAVs) find _x);
        };
        private _pilotCameraTarget = getPilotCameraTarget _x;
        if(!isUAVConnected _x && {!(_pilotCameraTarget select 0)}) exitWith {};

        private _pilotCameraRotation = getPilotCameraRotation _x;
        if (_pilotCameraTarget select 0) then {
            private _pilotCameraTargetPos = _pilotCameraTarget select 1;
            private _pilotCameraTargetRelPos = vectorNormalized ((_x worldToModel (ASLToAGL _pilotCameraTargetPos)) vectorDiff (getPilotCameraPosition _x));
            _pilotCameraRotation = [ -(rad ((_pilotCameraTargetRelPos select 0) atan2 (_pilotCameraTargetRelPos select 1)) ), -(rad asin(_pilotCameraTargetRelPos select 2))]
        };
        _x animateSource ["mainTurret", _pilotCameraRotation select 0];
        _x animateSource ["mainGun", -(_pilotCameraRotation select 1)];

    } forEach GVAR(singleOperatorUAVs);
}, 0.1, []] call CBA_fnc_addPerFrameHandler;
