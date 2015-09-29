/*
 * Author: Glowbal
 * Get the cardiac output from the Heart, based on current Heart Rate and Blood Volume.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * ReturnValue:
 * Current cardiac output <NUMBER>
 *
 * Public: No
 */

#include "script_component.hpp"

/*
    Cardiac output (Q or or CO ) is the volume of blood being pumped by the heart, in particular by a left or right ventricle in the ACE_time interval of one minute. CO may be measured in many ways, for example dm3/min (1 dm3 equals 1 litre).

    Source: http://en.wikipedia.org/wiki/Cardiac_output
*/

// to limit the amount of complex calculations necessary, we take a set modifier to calculate Stroke Volume.
#define MODIFIER_CARDIAC_OUTPUT     19.04761

params ["_unit"];

((_unit getvariable [QGVAR(bloodVolume), 100])/MODIFIER_CARDIAC_OUTPUT) + ((_unit getvariable [QGVAR(heartRate), 80])/80-1);
