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

((_vehicle doorPhase _door > 0) || (_vehicle animationPhase _door > 0)) &&
{alive _vehicle} &&
{!(_vehicle getVariable [QEGVAR(fastroping,doorsLocked),false])} &&
{
    switch (true) do {
        case (_vehicle isKindOf "rhsusf_CH53E_USMC"): {
            ACE_player in [driver _vehicle]
        };

        case (_vehicle isKindOf "RHS_CH_47F"): {
            ACE_player in [driver _vehicle, _vehicle turretUnit [3], _vehicle turretUnit [4]]
        };

        default {
            ACE_player in _vehicle
        };
    }
}
