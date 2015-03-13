#include "script_component.hpp"

// Calculate the light
_data = [[], FUNC(determineMapLight), missionNamespace, QGVAR(mapLight), 0.1] call EFUNC(common,cachedCall);
diag_log _data;
_darkMap = _data select 0;
_color = _data select 1;
_fill = _data select 2;
_externalLight = _data select 3;
if (_darkMap) then {
    ((findDisplay 12) displayCtrl 51) drawRectangle [(getArray(configFile >> 'CfgWorlds' >> worldName >> 'centerPosition')),80000,80000,0,_color,_fill];
} else {
    if (_externalLight) then {
        [] spawn {
            _light = ACE_player getVariable ['ace_map_light',objNull];
            if (isNull _light) then {
                _type = if (ACE_player == vehicle ACE_player) then { 'ACE_Flashlight' } else { 'ACE_Dashlight' };
                _light = _type createVehicle (getPos ACE_player);
                _light attachTo [(vehicle ACE_player), if (_type == 'ACE_Flashlight') then { [0,0.4,1] } else { [0,0,-1]}];
                ACE_player setVariable ['ace_map_light',_light];
                waitUntil {sleep 0.1; !visibleMap; };
                deleteVehicle _light;
                ACE_player setVariable ['ace_map_light',objNull];
            };
        };
    };
};

_ctrl = ((findDisplay 12) displayCtrl 51);
_scale = ctrlMapScale _ctrl;

_speed = 0;
if (vehicle ACE_player == ACE_player) then {
    _speed = vectorMagnitude (velocity ACE_player);
};


if (_speed > 0.1) then {
    if (ctrlMapAnimDone _ctrl) then {

        _amplitude = (_speed - 0.1) / 5 * (1000 * _scale);
        _time = 0.1;

        _shakePos = [(GVAR(lastStillPosition) select 0) + sin((time + _time - GVAR(lastStillTime))*100) * _amplitude * 0.25,
                     (GVAR(lastStillPosition) select 1) + sin((time + _time - GVAR(lastStillTime))*260) * _amplitude];

        _ctrl ctrlMapAnimAdd [_time, _scale, _shakePos];
        ctrlMapAnimCommit _ctrl;

        GVAR(isShaking) = true;
    };
} else {
    if (GVAR(isShaking)) then {
        _ctrl ctrlMapAnimAdd [0, _scale, GVAR(lastStillPosition)];
        ctrlMapAnimCommit _ctrl;
        GVAR(isShaking) = false;
    } else {
        ctrlMapAnimClear _ctrl;
        GVAR(lastStillPosition) = _ctrl ctrlMapScreenToWorld [0.5, 0.5];
        GVAR(lastStillTime) = time;

        if (GVAR(limitZoom)) then {
            if (GVAR(minMapSize) >= _scale) then {
                _ctrl ctrlMapAnimAdd [0, GVAR(minMapSize) + 0.001, (_ctrl ctrlMapScreenToWorld [0.5, 0.5])];
                ctrlMapAnimCommit _ctrl;
            };
        };
    };
};
