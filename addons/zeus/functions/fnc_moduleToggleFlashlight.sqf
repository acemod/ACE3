#include "script_component.hpp"
/*
 * Author: alganthe, mharis001
 * Zeus module function to toggle flashlights.
 *
 * Arguments:
 * 0: Logic object <OBJECT>
 * 1: Toggle mode <BOOL>
 * 2: Add gear <BOOL>
 * 3: Target units (-1 - Selected group, 0 - BLUFOR, 1 - OPFOR, 2 - Independent, 3 - Civilian) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC, true, true, -1] call ace_zeus_fnc_moduleToggleFlashlight
 *
 * Public: No
 */

params ["_logic", "_toggle", "_addGear", "_target"];
TRACE_1("params",_this);

// Create array of target units
private _units = [];

if (_target == -1) then {
    _units = (units attachedTo _logic) select {alive _x && {!([_x] call EFUNC(common,isPlayer))} && {!(currentWeapon _x isEqualTo "")}};
} else {
    private _side = [west, east, independent, civilian] select _target;
    _units = allUnits select {alive _x && {side _x == _side} && {!([_x] call EFUNC(common,isPlayer))} && {!(currentWeapon _x isEqualTo "")}};
};

// Toggle flashlights for units
if (_toggle) then {
    private _cfgWeapons = configFile >> "CfgWeapons";
    {
        private _weapon = currentWeapon _x;
        private _pointer = (_x weaponAccessories _weapon) select 1;

        if (!(_pointer isEqualTo "") && {getNumber (_cfgWeapons >> _pointer >> "ItemInfo" >> "FlashLight" >> "size") > 0}) then {
            [QEGVAR(ai,enableGunLights), [_x, "forceOn"], _x] call CBA_fnc_targetEvent;
        } else {
            if (_addGear) then {
                // Get compatible items for pointer slot
                private _compatibleItems = [_weapon, "pointer"] call CBA_fnc_compatibleItems;

                // Get random flashlight from compatible pointer slot items
                private _flashlightItem = selectRandom (_compatibleItems select {getNumber (_cfgWeapons >> _x >> "ItemInfo" >> "FlashLight" >> "size") > 0});

                // Add flashlight to weapon and enable
                [QEGVAR(common,addWeaponItem), [_x, _weapon, _flashlightItem], _x] call CBA_fnc_targetEvent;
                [QEGVAR(ai,enableGunLights), [_x, "forceOn"], _x] call CBA_fnc_targetEvent;
                TRACE_2("Added flashlight to unit",_x,_flashlightItem);
            };
        };
    } forEach _units;
} else {
    {
        [QEGVAR(ai,enableGunLights), [_x, "forceOff"], _x] call CBA_fnc_targetEvent;
    } forEach _units;
};

deleteVehicle _logic;
