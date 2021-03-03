#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Condition for showing copperhead interface, used in both interaction menu and inside dialog loop
 *
 * Arguments:
 * Args
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle, player] call ace_clgp_fnc_copperhead_uiCanOpen
 *
 * Public: No
 */

params ["_vehicle", "_player"];
// TRACE_2("copperhead_uiCanOpen",_vehicle,_player);

(_player in _vehicle)
&& {(_vehicle unitTurret _player) isEqualTo [0]}
&& {alive _vehicle}
&& {
    private _hasCopperheadAmmo = false;
    {
        _x params ["_xMag", "_xTurret", "_xAmmo"];
        if ((_xTurret isEqualTo [0]) && {_xAmmo > 0} && {_xMag == "ace_1rnd_155mm_m712"}) exitWith {
            _hasCopperheadAmmo = true;
        };
    } forEach (magazinesAllTurrets _vehicle);
    _hasCopperheadAmmo
}
