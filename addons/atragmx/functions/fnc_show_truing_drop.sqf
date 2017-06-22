/*
 * Author: Ruthberg
 * Shows/Hides the truing drop controls
 *
 * Arguments:
 * visible - <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * false call ace_atragmx_fnc_show_truing_drop
 *
 * Public: No
 */
#include "script_component.hpp"

GVAR(showTruingDrop) = _this;

{ctrlShow [_x, _this]} forEach [18000, 18001, 18002, 18003, 18004, 18005, 18006, 18007, 18008, 18009, 18010, 18011, 18012, 18013, 18014, 18015, 18016, 18017, 18018, 18019, 18020];

if (_this) then {
    if (GVAR(currentUnit) == 2) then {
        ctrlSetText [18000, format["ZR=%1meters", Round(GVAR(workingMemory) select 2)]];
    } else {
        ctrlSetText [18000, format["ZR=%1yards", Round((GVAR(workingMemory) select 2) * 1.0936133)]];
    };
    private _dropUnit = GVAR(currentScopeUnit);
    if (_dropUnit == 3) then {
        switch (GVAR(currentScopeClickUnit)) do {
            case 0: { _dropUnit = 1; };
            case 1: { _dropUnit = 2; };
            case 2: { _dropUnit = 0; };
        };
    };
    switch (_dropUnit) do {
        case 0: { ctrlSetText [18001, "Drop=mils"]; };
        case 1: { ctrlSetText [18001, "Drop=tmoa"]; };
        case 2: { ctrlSetText [18001, "Drop=smoa"]; };
    };
    false call FUNC(calculate_truing_drop);
    call FUNC(update_truing_drop_selection);
};
