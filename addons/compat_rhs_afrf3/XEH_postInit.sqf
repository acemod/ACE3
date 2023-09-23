#include "script_component.hpp"

private _russianRankIcons = [
    QPATHTOEF(nametags,UI\icons_russia\private_gs.paa),
    QPATHTOEF(nametags,UI\icons_russia\corporal_gs.paa),
    QPATHTOEF(nametags,UI\icons_russia\sergeant_gs.paa),
    QPATHTOEF(nametags,UI\icons_russia\lieutenant_gs.paa),
    QPATHTOEF(nametags,UI\icons_russia\captain_gs.paa),
    QPATHTOEF(nametags,UI\icons_russia\major_gs.paa),
    QPATHTOEF(nametags,UI\icons_russia\colonel_gs.paa)
];

{
    [_x, _russianRankIcons] call EFUNC(nametags,setFactionRankIcons);
} forEach [
    "rhs_faction_msv",
    "rhs_faction_vdv",
    "rhs_faction_vmf",
    "rhs_faction_vv",
    "rhs_faction_tv",
    "rhs_faction_vpvo",
    "rhs_faction_vvs",
    "rhs_faction_vvs_c",
    "rhs_faction_rva"
];

if ("ace_compat_rhs_afrf3_arsenal" call EFUNC(common,isModLoaded)) then {

    #define ITEM_INDEX_SIDE 1
    #define ITEM_INDEX_OPTIC 2
    #define ITEM_INDEX_BIPOD 3

    // Compatibility for attachments
    // Will only work for ACE_player, different arsenal centers will be ignored
    [QEGVAR(arsenal,weaponItemChanged), {
        params ["_weapon", "_item", "_itemIndex"];
        if (EGVAR(arsenal,center) != ACE_player) exitWith {};

        switch (_itemIndex) do {
            case ITEM_INDEX_SIDE: {
                call rhs_fnc_anpeq15_rail;
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
};
