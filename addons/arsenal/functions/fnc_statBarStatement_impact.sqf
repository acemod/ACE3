#include "script_component.hpp"

params ["_stats", "_config", "_args"];
_args params ["_hitMinMax", "_initSpeedMinMax", "_launcherTabIDC"];

private _statValues = [
    [_config],
    _stats,
    [true, false],
    [_hitMinMax select 0, _initSpeedMinMax select 0]
] call BIS_fnc_configExtremes;
(_statValues select 1) params ["_hit", "_initSpeed"];

_hit = linearConversion [_hitMinMax select 0, _hitMinMax select 1, _hit, 0.01, 1];
_initSpeed = linearConversion [_initSpeedMinMax select 0, _initSpeedMinMax select 1, _initSpeed, 0.01, 1];

[sqrt(_hit^2 * _initSpeed), _hit] select (GVAR(currentLeftPanel) == _launcherTabIDC)