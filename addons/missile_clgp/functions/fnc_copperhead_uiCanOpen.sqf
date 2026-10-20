#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Condition for showing copperhead interface, used in both interaction menu and inside dialog loop
 *
 * Arguments:
 * Args
 *
 * Return Value:
 * <BOOL>
 *
 * Example:
 * [vehicle, player] call ace_missile_clgp_fnc_copperhead_uiCanOpen
 *
 * Public: No
 */

params ["_vehicle", "_player"];
// TRACE_2("copperhead_uiCanOpen",_vehicle,_player);

(_player in _vehicle)
&& {(_vehicle unitTurret _player) isEqualTo [0]}
&& {alive _vehicle}
&& {
    ((magazinesAllTurrets _vehicle) findIf {
        _x params ["_xMag", "_xTurret", "_xAmmo"];
        (_xTurret isEqualTo [0]) && {_xAmmo > 0} && {GVAR(copperheadMagazines) getOrDefaultCall [_xMag, {
            (getNumber (configFile >> "CfgMagazines" >> _xMag >> QGVAR(copperheadInterface))) == 1
        }, true]}
    }) != -1
}
