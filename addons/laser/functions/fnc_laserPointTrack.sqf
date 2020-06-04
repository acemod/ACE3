#include "script_component.hpp"
/*
 * Author: LorenLuke
 * Toggles laser point tracking when a laser is on, for tracking coordinates;
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [vehicle player] call ace_laser_fnc_laserPointTrack
 *
 * Public: No
 */
 

params ["_vehicle"];

GVAR(TrackerpfID) = [{
    params ["_args", "_pfID"];
    _args params ["_vehicle"];
    if (!(hasPilotCamera _vehicle)) exitWith {
        [_pfID] call CBA_fnc_removePerFrameHandler;
    };
    if (isNull(laserTarget _vehicle)) exitWith {
        [_pfID] call CBA_fnc_removePerFrameHandler;
    };
    if (!((getPilotCameraTarget _vehicle) select 0)) exitWith {
    };
    if (isNull((getPilotCameraTarget _vehicle) select 2)) then {
        private _distance = ((getPilotCameraTarget _vehicle) select 1) distance getPosASL (laserTarget _vehicle);
        if (_distance > 0.15) then {
            private _vehPos = getPosASL _vehicle;
            private _vectorToLaser = _vehPos vectorFromTo (getPosASL (laserTarget _vehicle));
            private _vectorToSpot = _vehPos vectorFromTo ((getPilotCameraTarget _vehicle) select 1);
            if (acos(_vectorToLaser vectorCos _vectorToSpot) < 0.025) then {
                _vehicle setPilotCameraTarget getPosASL (laserTarget _vehicle);
            };
        };
    };
}, 0, [_vehicle]] call CBA_fnc_addPerFrameHandler;


