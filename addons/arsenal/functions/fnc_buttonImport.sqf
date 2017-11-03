#include "script_component.hpp"
#include "..\defines.hpp"

params ["_display"];

private _data = call (compile copyFromClipboard);

if !(_data isEqualType []) exitWith {
    [_display, "Wrong format given"] call FUNC(message);
};

if (count _data == 10) then {
    GVAR(center) setUnitLoadout _data;

    GVAR(currentItems) = ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", [], [], [], [], [], []];
    for "_index" from 0 to 15 do {
        switch (_index) do {
            case 0;
            case 1;
            case 2:{
                GVAR(currentItems) set [_index, ((LIST_DEFAULTS select 0) select _index)];
            };
            case 3;
            case 4;
            case 5;
            case 6;
            case 7;
            case 8;
            case 9: {
                GVAR(currentItems) set [_index, (LIST_DEFAULTS select _index) select 0];

            };
            case 10: {
                {(GVAR(currentItems) select 15) pushBack _x} forEach (uniformItems GVAR(center));
            };
            case 11: {
                {(GVAR(currentItems) select 16) pushBack _x} forEach (vestItems GVAR(center));
            };
            case 12: {
                {(GVAR(currentItems) select 17) pushBack _x} forEach (backpackItems GVAR(center));
            };
            case 13: {
                GVAR(currentItems) set [18, (primaryWeaponItems GVAR(center)) + (primaryWeaponMagazine GVAR(center))];
            };
            case 14: {
                GVAR(currentItems) set [19, (secondaryWeaponItems GVAR(center)) + (secondaryWeaponMagazine GVAR(center))];
            };
            case 15: {
                GVAR(currentItems) set [20, (handgunItems GVAR(center)) + (handgunMagazine GVAR(center))];
            };
        };
    };

    // Reapply insignia
    [GVAR(center), ""] call bis_fnc_setUnitInsignia;
    [GVAR(center), GVAR(currentInsignia)] call bis_fnc_setUnitInsignia;

    [_display, _display displayCtrl GVAR(currentLeftPanel)] call FUNC(fillLeftPanel);

    [_display, "Loadout imported from clipboard"] call FUNC(message); // TBL
};
