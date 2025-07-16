#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe, johnb43
 * Impact bar statement.
 *
 * Arguments:
 * 0: Stats array <ARRAY>
 * 1: Item config path <CONFIG>
 * 2: Args for configExtreme <ARRAY>
 * - 0: Stats limits <ARRAY of BOOLs>
 * - 1: Bar limits <ARRAY of NUMBERs>
 *
 * Return Value:
 * Number
 *
 * Public: No
*/

params ["_stats", "_config", "_args"];
_args params ["_hitMinMax", "_initSpeedMinMax"];

private _statValues = [
    [_config],
    _stats,
    [true, false],
    [_hitMinMax select 0, _initSpeedMinMax select 0]
] call BIS_fnc_configExtremes;
(_statValues select 1) params ["_hit", "_initSpeed"];

_hit = linearConversion [_hitMinMax select 0, _hitMinMax select 1, _hit, 0.01, 1];
_initSpeed = linearConversion [_initSpeedMinMax select 0, _initSpeedMinMax select 1, _initSpeed, 0.01, 1];

// If launcher tab
[sqrt (_hit ^ 2 * _initSpeed), _hit] select (GVAR(currentLeftPanel) == IDC_buttonSecondaryWeapon)
