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
 * call ace_grenades_fnc_changeFuse
 *
 * Public: No
 */

{
    _x params ["_mag", "_throwableMag"];

    [
        _mag,
        "CONTAINER",
        "Covert to short fuse",
        nil,
        QPATHTOEF(explosives,UI\Place_Explosive_ca.paa),
        [
            {true},
            {
                params ["", "", "_item", "", "_magArr"];
                _item isEqualTo (_magArr #0);
            }
        ],
        {
            params ["_unit", "", "", "", "_magArr"];
            _unit addMagazine (_magArr #1);
            false;
        },
        true,
        [_mag,_throwableMag]
    ] call CBA_fnc_addItemContextMenuOption;

    [
        _throwableMag,
        "CONTAINER",
        "Remove short fuse",
        nil,
        QPATHTOEF(explosives,UI\Place_Explosive_ca.paa),
        [
            {true},
            {
                params ["", "", "_item", "", "_magArr"];
                _item isEqualTo (_magArr #1);
            }
        ],
        {
            params ["_unit", "", "", "", "_magArr"];
            _unit addMagazine (_magArr #0);
            false;
        },
        true,
        [_mag,_throwableMag]
    ] call CBA_fnc_addItemContextMenuOption;
} forEach [
    ["SatchelCharge_Remote_Mag", "ACE_SatchelCharge_Remote_Mag_Throwable"],
    ["DemoCharge_Remote_Mag", "ACE_DemoCharge_Remote_Mag_Throwable"]
];
