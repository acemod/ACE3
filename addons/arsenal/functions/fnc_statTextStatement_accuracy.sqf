#include "script_component.hpp"

params ["_stat", "_config", "_args"];
_args params ["_statMinMax", "_configExtremeBool"];

private _statValues = [
    [_config],
    [_stat],
    [_configExtremeBool],
    [_statMinMax select 0]
] call BIS_fnc_configExtremes;

private _dispersion = (_statValues select 1) select 0;

format ["%1 MIL (%2 MOA)", (_dispersion * 1000) toFixed 2, (_dispersion / pi * 10800) ToFixed 1];
