#include "script_component.hpp"
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


params ["_side"];

if (typeName _side == "OBJECT") then {
    _side = str side _side;
};

missionNamespace getvariable [format[QGVAR(%1_encryptionKey), _side], [""]]
