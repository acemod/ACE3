/*
 * Author: Glowbal
 *
 * Description: Return the side specific encryption keys for the provided object or side string
 *
 * Arguments:
 * 0: Side-String or Object <STRING> or <OBJECT>
 *
 * Return Value:
 * Encryption Key <STRING>
 *
 * Public: No
 */

#include "script_component.hpp"

PARAMS_1(_side);

if (typeName _side == "OBJECT") then {
	_side = str side _side;
};

(missionNamespace getvariable [format[QGVAR(%1_encryptionKey), _side], [""]])