/*
 * Author: Alganthe
 * Import loadout / default loadouts list from clipboard.
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Public: No
*/
#include "script_component.hpp"
#include "..\defines.hpp"

params ["_display"];

private _data = call (compile copyFromClipboard);

if (isNil "_data" || {!(_data isEqualType [])}) exitWith {
    [_display, localize LSTRING(importFormatError)] call FUNC(message);
};

if (GVAR(shiftState) && {is3DEN}) then {

    {
        if (
                count _x == 2 && 
                {_x select 0 isEqualType ""} && 
                {_x select 0 != ""} &&
                {_x select 1 isEqualType []} && 
                {count (_x select 1) == 10}
        ) then {

            _x params ["_loadoutName", "_loadout"];

            private _sameNameLoadoutsList = GVAR(defaultLoadoutsList) select {_x select 0 == _loadoutName};

           if (count _sameNameLoadoutsList == 0) then {
                GVAR(defaultLoadoutsList) pushBack [_loadoutName, _loadout];
            } else {
                GVAR(defaultLoadoutsList) set [GVAR(defaultLoadoutsList) find (_sameNameLoadoutsList select 0), _loadoutName, _loadout];
            };
        };
    } foreach _data;

    [_display, localize LSTRING(importedDefault)] call FUNC(message);
    set3DENMissionAttributes [[QGVAR(DummyCategory), QGVAR(DefaultLoadoutsListAttribute), GVAR(defaultLoadoutsList)]];

} else {
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


        {
            private _simulationType = getText (configFile >> "CfgWeapons" >> _x >> "simulation");
            private _index = 10 + (["itemmap", "itemcompass", "itemradio", "itemwatch", "itemgps"] find (tolower _simulationType));

            GVAR(currentItems) set [_index, _x];
        } foreach (assignedItems GVAR(center));

        call FUNC(updateUniqueItemsList);

        // Reapply insignia
        [GVAR(center), ""] call bis_fnc_setUnitInsignia;
        [GVAR(center), GVAR(currentInsignia)] call bis_fnc_setUnitInsignia;

        [_display, _display displayCtrl GVAR(currentLeftPanel)] call FUNC(fillLeftPanel);

        [_display, localize LSTRING(importedCurrent)] call FUNC(message);
    };
};

[QGVAR(loadoutImported), [_display, (GVAR(shiftState) && {is3DEN})]] call CBA_fnc_localEvent;
