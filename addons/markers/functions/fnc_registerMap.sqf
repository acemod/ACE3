/*
 * Author: SzwedzikPL
 * Server: registers new unique map and returns its class
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Unique map class <STRING>
 *
 * Public: No
 */
#include "script_component.hpp"

if (!isServer || {!GVAR(enableUniqueMaps)}) exitWith {""};

private _registeredMaps = missionNamespace getVariable [QGVAR(registeredMaps), []];
private _newMapID = count _registeredMaps + 1;

if (_newMapID > 999) exitWith {""};

private _map = format ["ACE_map_%1", _newMapID];
_registeredMaps pushBack _map;
missionNamespace setVariable [QGVAR(registeredMaps), _registeredMaps];

_map
