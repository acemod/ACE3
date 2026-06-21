#include "script_component.hpp"
/*
 * Author: Ampersand
 * Create dummy with weapon that is cooking off for when actual weapon will not fire
 *
 * Arguments:
 * 0: Input <BOOLEAN>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [player, currentWeaponMode player, currentMuzzle player] call ace_overheating_fnc_cookoffWeaponDummy
 */

params ["_unit", "_mode", "_muzzle", ["_loadout", []], ["_animation", ""], ["_proxy", ""]];

private _unitLoadout = getUnitLoadout _unit;
if (_muzzle == primaryWeapon _unit) then {
    _loadout = [_unitLoadout select 0,[],[],[],[],[],"","",[],["","","","","",""]];
    _proxy = "proxy:\a3\characters_f\proxies\weapon.001";
    _animation = "AmovPercMstpSrasWrflDnon";
} else {
    _loadout = [[],[],_unitLoadout select 2,[],[],[],"","",[],["","","","","",""]];
    _proxy = "proxy:\a3\characters_f\proxies\pistol.001";
    _animation = "AmovPercMstpSrasWpstDnon";
};

private _dummy = _unit getVariable [format [QGVAR(%1_dummy), _muzzle], objNull];
if (isNull _dummy) then {
    _dummy = createAgent [QGVAR(dummy), [0, 0, 0], [], 0, "CAN_COLLIDE"];
};
_dummy setUnitLoadout _loadout;
_dummy disableAI "ALL";
_dummy allowDamage false;
_dummy switchmove _animation;
_dummy attachTo [_unit, [0, 0, 0], _proxy, true];

//_dummy addEventHandler ["Deleted", {}];
_dummy forceWeaponFire [_muzzle, _mode];
_unit setAmmo [_muzzle, (_unit ammo _muzzle) - 1];

private _isNextRoundCool = true; // reuse dummy if next round is also going to be cooked off
if (_isNextRoundCool) then {
    deleteVehicle _dummy;
} else {
    _unit setVariable [format [QGVAR(%1_dummy), _muzzle], _dummy];
};
