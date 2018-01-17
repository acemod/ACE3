/*
 * Author: Maddmatt, commy2
 * Generate an amount of secondary explosions
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Amount <NUMBER>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

#define SECONDARIES_DELAY (1 + random 45)

params ["_vehicle", "_amount"];

if (isNil "_amount") then {
    // calculate amount of secondary explosions if not specified
    _amount = 0;

    {
        _x params ["_magazine", "_count"];

        private _ammo = getText (_magazine call CBA_fnc_getItemConfig >> "ammo");

        if (IS_EXPLOSIVE_AMMO(_ammo)) then {
            if (_ammo isKindOf "ShellBase") then {
                ADD(_amount,_count);
            } else {
                ADD(_amount,_count/50);
            };
        };
    } forEach magazinesAmmo _vehicle;
};

if (_amount <= 0) exitWith {};

private _fnc_secondaryExplosion = {
    params ["_vehicle", "_amount", "_fnc_secondaryExplosion"];

    private _position = _vehicle modelToWorld (_vehicle selectionPosition "destructionEffect2");

    // these CfgAmmo objects are always global
    "SmallSecondary" createVehicle _position;

    DEC(_amount);

    if (!isNull _vehicle && {_amount > 0}) then {
        [_fnc_secondaryExplosion, [_vehicle, _amount, _fnc_secondaryExplosion], SECONDARIES_DELAY] call CBA_fnc_waitAndExecute;
    };
};

[_fnc_secondaryExplosion, [_vehicle, _amount, _fnc_secondaryExplosion], SECONDARIES_DELAY] call CBA_fnc_waitAndExecute;

nil

/*SencondaryExplosion
    SecondaryExp
    SecondarySmoke
    GrenadeExploLight
*/
