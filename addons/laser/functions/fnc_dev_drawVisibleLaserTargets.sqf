// This is a debug function for displaying visible lasers for ourselves
#include "script_component.hpp"

private _playerPosASL = AGLtoASL (positionCameraToWorld [0,0,0]);
private _viewDir = (_playerPosASL) vectorFromTo (AGLtoASL positionCameraToWorld [0,0,1]);

// private _results = [_playerPosASL, _viewDir, ace_player, vehicle ace_player] call FUNC(shootRay);

private _results = [_playerPosASL, _viewDir, 30, [1550,1550], 1111, ace_player] call FUNC(seekerFindLaserSpot);
private _resultPos = _results select 0;
systemChat format ["%1",_resultPos];

[GVAR(laserEmitters), {
    // TRACE_2("",_key,_value);
    _value params ["_owner", "_owner", "_laserMethod", "_waveLength", "_laserCode", "_beamSpread"];
    private _targetObject = _owner getVariable [QGVAR(targetObject), objNull];

    private _targetPosASL = getPosASL _targetObject;
    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\select_target_ca.paa", [1,0,1,1], (ASLtoAGL _targetPosASL), 0.75, 0.75, 45, "", 0.5, 0.025, "TahomaB"];

}] call CBA_fnc_hashEachPair;
