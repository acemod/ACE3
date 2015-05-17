/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_add", "_keys"];
_add = _this select 0;
_keys = _this select 1;

if (_add) then {
    { GVAR(registeredEncyptionKeys) pushback _x; }foreach _keys;
} else {
    GVAR(registeredEncyptionKeys) = GVAR(registeredEncyptionKeys) - _keys;
};

["bft_registeredEncryptionKeysChanged", [_add, _keys]] call EFUNC(common,localEvent);
