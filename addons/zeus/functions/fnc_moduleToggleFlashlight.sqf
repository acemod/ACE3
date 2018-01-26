/*
 * Author: alganthe
 * Zeus module function to toggle Flashlights
 *
 * Arguments:
 * 0: Logic object <OBJECT>
 * 1: Toggle mode <BOOL>
 * 2: Add gear <BOOL>
 * 3: Target of the toggle <SCALAR> 0: blufor; 1: opfor; 2: indep; 3: civ; 4: selected group
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC, true, true, 4] call ace_zeus_fnc_moduleToggleFlashlight
 *
 * Public: No
*/

#include "script_component.hpp"

params ["_logic", "_toggle", "_addGear", "_target"];

private _units = [];

if (_target == 4) then {
    _units =  units (attachedTo _logic);
} else {
    _units =  allUnits select {alive _x && {side _x == ([blufor, opfor, independent, civilian] select _target)}},
};

if (_toggle) then {
    {
        // enableGunLights doesn't work on players
        if !(isPlayer _x || {(currentWeapon _x) isEqualTo ""}) then {
            private _pointer = (_x weaponAccessories (currentWeapon _x)) select 1;

            if (!(_pointer isEqualTo "") && {isNull (configfile >> "CfgWeapons" >> _pointer >> "ItemInfo" >> "Pointer")}) then {
                [QGVAR(enableFlashlight), [_x, "forceOn"], _x] call CBA_fnc_targetEvent;

            } else {
                if (_addGear) then {
                    // Retrieve compatible items for the pointer slot
                    private _pointerSlotCompatible = [currentWeapon _x, "pointer"] call CBA_fnc_compatibleItems;

                    // Get flashlights from the array above and select the first one
                    private _flashlight = (_pointerSlotCompatible select {isNull (configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "Pointer")}) select 0;

                    [QEGVAR(common,addWeaponItem), [_x, (currentWeapon _x), _flashlight], _x] call CBA_fnc_targetEvent;
                    [QGVAR(enableFlashlight), [_x, "forceOn"], _x] call CBA_fnc_targetEvent;
                };
            };
        };
    } foreach _units;

} else {
    {
        if !(isPlayer _x || {(currentWeapon _x) isEqualTo ""}) then {
            [QGVAR(enableFlashlight), [_x, "forceOff"], _x] call CBA_fnc_targetEvent;
        };
    } foreach _units;
};

deleteVehicle _logic;
