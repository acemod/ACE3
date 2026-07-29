#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Gets compatible magazines to load a CSW from a magazine source.
 *
 * Arguments:
 * 0: Magazine Source <OBJECT> (default: objNull)
 * 1: CSW <OBJECT> (default: objNull)
 *
 * Return Value:
 * Magazines, grouped by classname, fullest of each type first <ARRAY>
 *   Magazine classname <STRING>
 *   Magazine ammo <NUMBER>
 *
 * Example:
 * [backpackContainer player, cursorObject] call ace_csw_fnc_getSourceCompatibleMagazines
 *
 * Public: Yes
 */

params [["_source", objNull, [objNull]], ["_csw", objNull, [objNull]]];

if (isNull _source || {!alive _csw}) exitWith {[]};

private _magazines = magazinesAmmoCargo _source;
if (_magazines isEqualTo []) exitWith {[]};

private _compatibleMagazines = [_csw] call FUNC(compatibleMagazines);
if (_compatibleMagazines isEqualTo createHashMap) exitWith {[]};

private _return = _magazines select {(_x select 0) in _compatibleMagazines};

// Sorting an array of [classname, ammo] compares the classname first, so this groups by type and
// puts the fullest magazine of each type at the front of its group. Callers dedupe on classname and
// take the first hit, which is why they never have to scan a source twice
_return sort false;

_return // return
