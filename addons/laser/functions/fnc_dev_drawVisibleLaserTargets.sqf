// Dev Debug Function
// Displays lasers and attempts to lock on to codes 1111 and 1112 from player's view
#include "script_component.hpp"

[GVAR(laserEmitters), {
    // TRACE_2("",_key,_value);
    _value params ["_owner", "_owner", "_laserMethod", "_waveLength", "_laserCode", "_beamSpread"];

    // Draw vanila lasers [RED]
    if (_laserMethod isEqualTo QFUNC(findLaserSource)) then {
        private _targetObject = _owner getVariable [QGVAR(targetObject), objNull];
        private _targetPosASL = getPosASL _targetObject;
        drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\select_target_ca.paa", [1,0,0,1], (ASLtoAGL _targetPosASL), 1, 1, 0, "", 0.5, 0.025, "TahomaB"];
        
        private _resultsLaser = _value call FUNC(findLaserSource);
        private _resultsRay = [_resultsLaser select 0, _resultsLaser select 1, _owner] call FUNC(shootRay);
        
        private _rayPos = _resultsRay select 0;
        if (isNil "_rayPos") exitWith {systemChat format ["nil ray - %1 - %2", _resultsLaser, _resultRay];  x3 = _resultsLaser; };
        private _diff = _rayPos vectorDistance (getPosASL _targetObject);
        if (_diff < 5) exitWith {};
        drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\select_target_ca.paa", [1,0,0,1], (ASLtoAGL _rayPos), 2, 2, 0, format ["Diff %1",_diff], 0.5, 0.025, "TahomaB"];
    };
}] call CBA_fnc_hashEachPair;


// Try searching for lasers from player position:
private _playerPosASL = AGLtoASL (positionCameraToWorld [0,0,0]);
private _viewDir = (_playerPosASL) vectorFromTo (AGLtoASL positionCameraToWorld [0,0,1]);

private _results = [_playerPosASL, _viewDir, 30, [1550,1550], 1111, ace_player] call FUNC(seekerFindLaserSpot);
private _resultPos = _results select 0;
if (!isNil "_resultPos") then {
    // Draw lock results
    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\select_target_ca.paa", [0,0,1,1], (ASLtoAGL _resultPos), 1.5, 1.5, 45, format ["1111 from %1", _results select 1], 0.5, 0.025, "TahomaB"];
};

private _playerPosASL = AGLtoASL (positionCameraToWorld [0,0,0]);
private _viewDir = (_playerPosASL) vectorFromTo (AGLtoASL positionCameraToWorld [0,0,1]);

private _results = [_playerPosASL, _viewDir, 30, [1550,1550], 1112, ace_player] call FUNC(seekerFindLaserSpot);
private _resultPos = _results select 0;
if (!isNil "_resultPos") then {
    // Draw lock results
    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\select_target_ca.paa", [0,0,1,1], (ASLtoAGL _resultPos), 1.5, 1.5, 45, format ["1112 from %1", _results select 1], 0.5, 0.025, "TahomaB"];
};
