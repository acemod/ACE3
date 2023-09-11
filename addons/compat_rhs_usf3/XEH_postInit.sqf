#include "script_component.hpp"

// Don't duplicate the event
if ("ace_compat_rhs_afrf3_arsenal" call EFUNC(common,isModLoaded)) exitWith {};

#define ITEM_INDEX_SIDE 1
#define ITEM_INDEX_OPTIC 2
#define ITEM_INDEX_BIPOD 3

// Compatibility for attachments
// Will only work for players or RC unit, different arsenal centers will be ignored
[QEGVAR(arsenal,weaponItemChanged), {
    params ["_weapon", "_item", "_itemIndex"];
    if (EGVAR(arsenal,center) != ACE_player) exitWith {};

    switch (_itemIndex) do {
        case ITEM_INDEX_SIDE: {
            call rhs_fnc_anpeq15_rail;
        };
        case ITEM_INDEX_OPTIC: {
            [] call rhs_fnc_preferredOptic;
        };
        case ITEM_INDEX_BIPOD: {
            // Need this call to make sure RHS's functions are set
            call rhs_fnc_accGripod;
            if (getText (configFile >> "CfgWeapons" >> _item >> "rhs_grip_type") == "") then {
                call rhs_grip_deinitialize;
            };
        };
    };
}] call CBA_fnc_addEventHandler;
