/*
 * Author: commy2
 * Check if the unit is in a vehicle and turned out.
 *
 * Arguments:
 * 0: Unit, not the vehicle <OBJECT>
 *
 * Return Value:
 * Is the unit turned out or not? Will return false if there is no option to turn out in the first place. <BOOL>
 *
 * Public: Yes
 *
 * Deprecated
 */
#include "script_component.hpp"

ACE_WARNINGFORMAT_3("%1 is deprecated. Support will be dropped in version %2. Replaced by: %3","ace_common_fnc_isTurnedOut","3.5.0","isTurnedOut");

params ["_unit"];

isTurnedOut _unit // return
