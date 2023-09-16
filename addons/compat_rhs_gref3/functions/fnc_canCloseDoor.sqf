#include "..\script_component.hpp"
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
 * [_vehicle, "DoorLB"] call ace_compat_rhs_gref3_fnc_canCloseDoor
 *
 * Public: No
 */

params ["_vehicle", "_door"];

(alive _vehicle) &&
{!(_vehicle getVariable [QEGVAR(fastroping,doorsLocked),false])} &&
{
    switch (true) do {
        case (_vehicle isKindOf "rhs_uh1h_base"): {
            ((_vehicle doorPhase _door) == 0) &&
            {ACE_player in _vehicle}
        };
        default {
            ((_vehicle doorPhase _door) > 0) &&
            {ACE_player in _vehicle}
        };
    }
}
