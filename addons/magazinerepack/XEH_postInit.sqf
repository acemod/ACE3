#include "script_component.hpp"

// Inventory context menu action to repack magazines
[
    "#Magazine",
    ["CONTAINER", "MAGAZINE"],
    LSTRING(RepackMagazines),
    [],
    QPATHTOEF(common,UI\repack_ca.paa),
    [
        {true},
        {
            params ["_unit", "", "_magazine"];

            [_unit, _magazine] call FUNC(canRepackMagazine)
        }
    ],
    {
        params ["_unit", "", "_magazine"];

        [_unit, _unit, _magazine] call FUNC(startRepackingMagazine);
    }
] call CBA_fnc_addItemContextMenuOption;
