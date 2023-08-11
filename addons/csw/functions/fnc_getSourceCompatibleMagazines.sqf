#include "script_component.hpp"
/*
 * Author: LinkIsGrim
 * Gets compatible magazines to load a CSW from a magazine source
 *
 * Arguments:
 * 0: Magazine Source <OBJECT>
 * 1: CSW <OBJECT> (default: objNull)
 *
 * Return Value:
 * Magazines <ARRAY>
 *   Magazine classname <STRING>
 *   Magazine ammo <NUMBER>
 *
 * Example:
 * [backpackContainer player, cursorObject] call ace_csw_fnc_getSourceCompatibleMagazines
 *
 * Public: Yes
 */
params [["_source", objNull, [objNull]], ["_csw", objNull, [objNull]]];

if (isNull _source || {isNull _csw}) exitWith {[]};

if !(typeOf _csw in GVAR(initializedStaticTypes)) exitWith {[]};

private _magazines = magazinesAmmoCargo _source;

if (_magazines isEqualTo []) exitWith {[]};

private _compatibleMagazines = [_csw] call FUNC(compatibleMagazines);

private _return = _magazines select {(_x select 0) in _compatibleMagazines};

// sort by ammo count, highest to lowest
_return sort false;

_return
