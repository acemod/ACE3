#include "script_component.hpp"
/*
 * Author: LinkIsGrim
 * PFEH for FUNC(doArtilleryFire). Handles reloading and weapon downtime.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Target Position (AGL) <ARRAY>
 * 2: Magazine Type <STRING>
 * 3: Rounds left <NUMBER>
 * 4: Vehicle uses CSW <BOOL>
 * 5: Time of last round fired <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject] call ace_artillerytables_fnc_doArtilleryFire
 *
 * Public: No
 */
params ["_args", "_id"];
_args params ["_vehicle", "_position", "_magazine", "_roundsLeft", "_usingCSW", "_lastFired"];

// Exit on timeout or rounds complete
if (CBA_missionTime - _lastFired >= 30 || {_roundsLeft isEqualTo 0}) exitWith {
    _vehicle setVariable [QEGVAR(csw,forcedMag), nil, true];
    [_id] call CBA_fnc_removePerFrameHandler;
};

(weaponState [_vehicle, [0]]) params ["", "", "", "", "_ammoCount", "_roundReloadPhase", "_magazineReloadPhase"];

if (_ammoCount > 0 && {_roundReloadPhase isEqualTo 0} && {_magazineReloadPhase isEqualTo 0}) exitWith {
    _vehicle doArtilleryFire [_position, _magazine, 1];
    _args set [3, _roundsLeft - 1];
    _args set [6, CBA_missionTime];
};
