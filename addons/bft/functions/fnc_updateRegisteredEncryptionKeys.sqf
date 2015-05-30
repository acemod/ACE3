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

PARAMS_2(_add,_keys);

if (_add) then {
    private ["_difference"];
    _difference = _keys - GVAR(registeredEncyptionKeys);
    {
        GVAR(registeredEncyptionKeys) pushback _x;
    } forEach _keys;
    _keys = _difference;
} else {
    GVAR(registeredEncyptionKeys) = GVAR(registeredEncyptionKeys) - _keys;
};

["bft_registeredEncryptionKeysChanged", [_add, _keys]] call EFUNC(common,localEvent);
