#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Renders weapons on the backs of players.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */

private _units = GVAR(units);

if (_units isEqualTo []) exitWith {};

// Sort units by distance if there is a render limit greater than 0
if (GVAR(renderLimit) > 0) then {
    private _unitsWithDistance = GVAR(units) apply {[ACE_player distance _x, _x]};
    _unitsWithDistance sort true;
    _units = _unitsWithDistance apply {_x#1};
};

private _renderedUnits = 0;
{
    private _weaponHolder = _x getVariable [QGVAR(weaponHolder), objNull];

    if (_renderedUnits != GVAR(renderLimit) && {isNull objectParent _x}) then {
        _weaponHolder hideObject false;

        // Don't update orientation if not on screen, always update for player
        if (_x == player || {!(worldToScreen ASLToAGL getPosWorld _weaponHolder isEqualTo [])}) then {
            private _lShoulder = _x selectionPosition "leftshoulder";
            private _rShoulder = _x selectionPosition "rightshoulder";
            private _lUpLeg    = _x selectionPosition "leftupleg";

            private _ab = _lShoulder vectorFromTo _rShoulder;
            private _bc = _lShoulder vectorFromTo _lUpLeg;
            private _vectorDir = _ab vectorCrossProduct _bc;
            private _vectorUp = _ab;

            _weaponHolder setVectorDirAndUp [_vectorUp, _vectorDir];

            _renderedUnits = _renderedUnits + 1;
        };
    } else {
        _weaponHolder hideObject true;
    };
} forEach _units;
