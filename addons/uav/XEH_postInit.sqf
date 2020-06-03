#include "script_component.hpp"

["Air", "init", { // on air vehicle init, add action to class if has pylons
    params ["_vehicle"];
    if ((getNumber (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> QUOTE(ADDON) >> "trackPilotCamera")) < 1) exitWith {};
    private _isUAV = unitIsUAV _vehicle;
    private _hasPilotCamera = hasPilotCamera _vehicle;
    if(_isUAV && _hasPilotCamera) then {
        _pfhID = [{
            params ["_args", "_pfID"];
            _args params ["_vehicle"];

            private _pilotCameraTarget = getPilotCameraTarget _vehicle;
            private _pilotCameraRotation = getPilotCameraRotation _vehicle;
            if (_pilotCameraTarget select 0) then {
                private _pilotCameraTargetPos = _pilotCameraTarget select 1;
                private _pilotCameraTargetRelPos = vectorNormalized ((_vehicle worldToModel (ASLToAGL _pilotCameraTargetPos)) vectorDiff (getPilotCameraPosition _vehicle));
                _pilotCameraRotation = [ -(rad ((_pilotCameraTargetRelPos select 0) atan2 (_pilotCameraTargetRelPos select 1)) ), -(rad asin(_pilotCameraTargetRelPos select 2))]
            };
            _vehicle animateSource ["mainTurret", _pilotCameraRotation select 0];
            _vehicle animateSource ["mainGun", -(_pilotCameraRotation select 1)];

        }, 0.1, [_vehicle]] call CBA_fnc_addPerFrameHandler;
        _vehicle setVariable [QGVAR(pfhID), _pfhID];
    };
}, true, [], true] call CBA_fnc_addClassEventHandler;
