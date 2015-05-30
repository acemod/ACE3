/*
 * Author: Glowbal
 *
 * Arguments:
 * 0: Side <string>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

PARAMS_1(_side);

(missionNamespace getvariable [format[QGVAR(%1_encryptionKey), _side], [""]])
