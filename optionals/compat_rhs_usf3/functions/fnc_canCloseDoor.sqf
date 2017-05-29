/*
 * Author: BaerMitUmlaut
 * Checks if the door can be closed.
 *
 * Arguments:
 * 0: Helicopter <OBJECT>
 * 1: Door <STRING>
 *
 * Return Value:
 * Door can be closed <BOOL>
 *
 * Example:
 * [_vehicle, "DoorLB"] call ace_compat_rhs_usf3_fnc_canCloseDoor
 *
 * Public: No
 */

#include "script_component.hpp"
params ["_vehicle", "_door"];

(alive _vehicle) &&
{!(_vehicle getVariable [QEGVAR(fastroping,doorsLocked),false])} &&
{
    switch (true) do {
        case (_vehicle isKindOf "rhsusf_CH53E_USMC"): {
            ((_vehicle animationPhase _door) > 0) &&
            {ACE_player == (driver _vehicle)}
        };
        case (_vehicle isKindOf "RHS_CH_47F"): {
            ((_vehicle animationSourcePhase _door) > 0) &&
            {ACE_player in [driver _vehicle, _vehicle turretUnit [3], _vehicle turretUnit [4]]}
        };
        default {
            ((_vehicle doorPhase _door) > 0) &&
            {ACE_player in _vehicle}
        };
    }
}
