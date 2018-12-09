#include "script_component.hpp"
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
 * Example:
 * call ACE_map_fnc_updateMapEffects
 *
 * Public: No
 */

params ["_mapCtrl"];
private _mapScale = ctrlMapScale _mapCtrl;
private _mapCentre = _mapCtrl ctrlMapScreenToWorld [0.5, 0.5];

if (GVAR(mapIllumination)) then {
    //get nearby lighting
    private _light = [[ACE_player], FUNC(determineMapLight), missionNamespace, QGVAR(mapLight), 0.1] call EFUNC(common,cachedCall);

    _light params ["_applyLighting", "_lightLevel"];

    if (_applyLighting) then {
        [_mapCtrl, _mapScale, _mapCentre, _lightLevel] call FUNC(simulateMapLight);
    };
};

if (GVAR(mapShake)) then {

    // Only shake map while moving on foot
    private _speed = 0;
    if ((alive ACE_player) && {vehicle ACE_player == ACE_player}) then {
        _speed = vectorMagnitude (velocity ACE_player);
    };

    // If speed is large enough, create anims to shake map
    if (_speed > 0.1) then {
        if (ctrlMapAnimDone _mapCtrl) then {

            private _amplitude = (_speed - 0.1) / 5 * (1000 * _mapScale);
            private _time = 0.1;

            private _shakePos = [(GVAR(lastStillPosition) select 0) + sin((CBA_missionTime + _time - GVAR(lastStillTime))*100) * _amplitude * 0.25,
                         (GVAR(lastStillPosition) select 1) + sin((CBA_missionTime + _time - GVAR(lastStillTime))*260) * _amplitude];

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
            GVAR(lastStillTime) = CBA_missionTime;
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
