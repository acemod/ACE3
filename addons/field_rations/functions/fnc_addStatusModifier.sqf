#include "script_component.hpp"
/*
 * Author: mharis001
 * Adds a status modifier. Should be called on all machines.
 * Code must return a NUMBER which will be applied additively with other status changes.
 *
 * Arguments:
 * 0: Status to modify (0 - Thirst, 1 - Hunger, 2 - Both) <NUMBER>
 * 1: Code (is passed the unit <OBJECT>) <CODE>
 *
 * Return Value:
 * None
 *
 * Example:
 * [0, {}] call ace_field_rations_fnc_addStatusModifier
 *
 * Public: Yes
 */

params [["_type", -1, [0]], ["_code", {}, [{}]]];

if (_type isEqualTo -1 || {_code isEqualTo {}}) exitWith {};

if (_type isEqualTo 2) then {
    GVAR(thirstModifiers) pushBack _code;
    GVAR(hungerModifiers) pushBack _code;
} else {
    private _modifierArray = [GVAR(thirstModifiers), GVAR(hungerModifiers)] select _type;
    _modifierArray pushBack _code;
};
