#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe, johnb43
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

params ["_display"];

// Can be either a singular loadout or an array of loadouts
private _extendedLoadout = if (isMultiplayer) then {
    ("ace" callExtension ["clipboard:loadout", []]) params ["_loadout", "_code"];
    if (_code != 0) exitWith {};
    parseSimpleArray _loadout
} else {
    call compile copyFromClipboard
};

// If error, exit
if (isNil "_extendedLoadout" || {!(_extendedLoadout isEqualType [])}) exitWith {
    [_display, LLSTRING(importFormatError)] call FUNC(message);
};

if (GVAR(shiftState) && {is3DEN}) then {
    // Supports CBA extended loadout or getUnitLoadout arrays
    {
        if (
            count _x == 2 &&
            {(_x select 0) isEqualType ""} &&
            {(_x select 0) != ""} &&
            {(_x select 1) isEqualType []} &&
            {count (_x select 1) in [2, 10]}
        ) then {
            _x call FUNC(addDefaultLoadout);
        };
    } forEach _extendedLoadout;

    [_display, LLSTRING(importedDefault)] call FUNC(message);

    set3DENMissionAttributes [[QGVAR(DummyCategory), QGVAR(DefaultLoadoutsListAttribute), GVAR(defaultLoadoutsList)]];
} else {
    // If _extendedLoadout is in getUnitLoadout array, change into CBA extended loadout array
    if (count _extendedLoadout == 10) then {
        _extendedLoadout = [_extendedLoadout, createHashMap];
    };

    // Check if CBA extended loadout array
    if ((count _extendedLoadout) == 2) then {
        [GVAR(center), _extendedLoadout] call CBA_fnc_setLoadout;

        // Update current item list and unique items
        [true] call FUNC(refresh);

        _extendedLoadout params ["_loadout", "_extendedInfo"];

        // Reapply insignia
        if (QGVAR(insignia) in _extendedInfo) then {
            GVAR(currentInsignia) = _extendedInfo getOrDefault [QGVAR(insignia), ""];
        } else {
            [GVAR(center), ""] call BIS_fnc_setUnitInsignia;
            [GVAR(center), GVAR(currentInsignia)] call BIS_fnc_setUnitInsignia;
        };

        // Save face
        if (QGVAR(face) in _extendedInfo) then {
            GVAR(currentFace) = _extendedInfo getOrDefault [QGVAR(face), GVAR(currentFace)];
        };

        // Save voice
        if (QGVAR(voice) in _extendedInfo) then {
            GVAR(currentVoice) = _extendedInfo getOrDefault [QGVAR(voice), GVAR(currentVoice)];
        };

        // Fill left panel
        [_display, _display displayCtrl GVAR(currentLeftPanel)] call FUNC(fillLeftPanel);

        [_display, LLSTRING(importedCurrent)] call FUNC(message);
    };
};

[QGVAR(loadoutImported), [_display, GVAR(shiftState) && {is3DEN}]] call CBA_fnc_localEvent;
