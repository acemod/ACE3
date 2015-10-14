/*
* Author: Rocko and esteldunedain
* On map draw, updates the effects
*
* Arguments:
* None
*
* Return Value:
* None
*
* Public: No
*/

#include "script_component.hpp"
private ["_mapCtrl", "_mapScale", "_mapCentre", "_light"];
_mapCtrl = findDisplay 12 displayCtrl 51;
_mapScale = ctrlMapScale _mapCtrl;
_mapCentre = _mapCtrl ctrlMapScreenToWorld [0.5, 0.5];

if (GVAR(mapIllumination)) then {
    //get nearby lighting
    _light = [[ACE_player], FUNC(determineMapLight), missionNamespace, QGVAR(mapLight), 0.1] call EFUNC(common,cachedCall);

    _light params ["_applyLighting", "_lightLevel"];

    if (_applyLighting) then {
        [_mapCtrl, _mapScale, _mapCentre, _lightLevel] call FUNC(simulateMapLight);
    };
};

if (GVAR(mapShake)) then {
    private ["_speed","_amplitude", "_time", "_shakePos"];

    // Only shake map while moving on foot
    _speed = 0;
    if (vehicle ACE_player == ACE_player) then {
        _speed = vectorMagnitude (velocity ACE_player);
    };

    // If speed is large enough, create anims to shake map
    if (_speed > 0.1) then {
        if (ctrlMapAnimDone _mapCtrl) then {

            _amplitude = (_speed - 0.1) / 5 * (1000 * _mapScale);
            _time = 0.1;

            _shakePos = [(GVAR(lastStillPosition) select 0) + sin((ACE_time + _time - GVAR(lastStillTime))*100) * _amplitude * 0.25,
                         (GVAR(lastStillPosition) select 1) + sin((ACE_time + _time - GVAR(lastStillTime))*260) * _amplitude];

            _mapCtrl ctrlMapAnimAdd [_time, _mapScale, _shakePos];
            ctrlMapAnimCommit _mapCtrl;

            GVAR(isShaking) = true;
        };
    } else {
        if (GVAR(isShaking)) then {
            // Stop shaking, return to original position
            ctrlMapAnimClear _mapCtrl;
            _mapCtrl ctrlMapAnimAdd [0, _mapScale, GVAR(lastStillPosition)];
            ctrlMapAnimCommit _mapCtrl;
            GVAR(isShaking) = false;
        } else {
            // The map is still, store state
            GVAR(lastStillPosition) = _mapCentre;
            GVAR(lastStillTime) = ACE_time;
        };
    };
};

if (GVAR(mapLimitZoom)) then {
    if (GVAR(minMapSize) >= _mapScale) then {
        ctrlMapAnimClear _mapCtrl;
        _mapCtrl ctrlMapAnimAdd [0, GVAR(minMapSize) + 0.001, _mapCentre];
        ctrlMapAnimCommit _mapCtrl;
    };
};
