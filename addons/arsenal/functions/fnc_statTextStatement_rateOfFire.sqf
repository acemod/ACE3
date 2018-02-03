#include "script_component.hpp"

params ["_stat", "_config", "_args"];
_args params ["_statMinMax", "_configExtremeBool"];

private _statValues = [
    [_config],
    [_stat],
    [_configExtremeBool],
    [_statMinMax select 0]
] call BIS_fnc_configExtremes;

format ["%1 rpm", round (60 / ((_statValues select 1) select 0))]
