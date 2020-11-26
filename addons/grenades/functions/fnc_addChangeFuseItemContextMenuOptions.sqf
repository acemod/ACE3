#include "script_component.hpp"
/*
 * Author: Cyruz
 * Allows conversion of explosive charges in to throwable versions
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_grenades_fnc_addChangeFuseItemContextMenuOptions
 *
 * Public: No
 */
 TRACE_1("addChangeFuseItemContextMenuOptions",_this);

{
    _x params ["_mag", "_throwableMag"];

    [
        _mag,
        "CONTAINER",
        LLSTRING(convert_fuse),
        nil,
        "\a3\ui_f\data\igui\cfg\simpletasks\types\destroy_ca.paa",
        [
            {true},
            {
                params ["", "", "_item", "", "_magArr"];
                _item isEqualTo (_magArr select 0);
            }
        ],
        {
            params ["_unit", "", "", "_slot", "_magArr"];
            private _containerStr = toLower ((_slot splitString "_") select 0);
            [_unit, (_magArr select 1), _containerStr, -1] call ace_common_fnc_addToInventory;
            false;
        },
        true,
        [_mag,_throwableMag]
    ] call CBA_fnc_addItemContextMenuOption;

    [
        _throwableMag,
        "CONTAINER",
        LLSTRING(remove_fuse),
        nil,
        "\a3\ui_f\data\igui\cfg\simpletasks\types\destroy_ca.paa",
        [
            {true},
            {
                params ["", "", "_item", "", "_magArr"];
                _item isEqualTo (_magArr select 1);
            }
        ],
        {
            params ["_unit", "", "", "_slot", "_magArr"];
            private _containerStr = toLower ((_slot splitString "_") select 0);
            [_unit, (_magArr select 0), _containerStr, -1] call ace_common_fnc_addToInventory;
            false;
        },
        true,
        [_mag,_throwableMag]
    ] call CBA_fnc_addItemContextMenuOption;
} forEach [
    ["SatchelCharge_Remote_Mag", "ACE_SatchelCharge_Remote_Mag_Throwable"],
    ["DemoCharge_Remote_Mag", "ACE_DemoCharge_Remote_Mag_Throwable"]
];
