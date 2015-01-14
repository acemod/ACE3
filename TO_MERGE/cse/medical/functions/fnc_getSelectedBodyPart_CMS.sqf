/**
 * fn_getSelectedBodyPart_CMS.sqf
 * @Descr: Get the current selected body part for client
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return: STRING bodyPart selected
 * @PublicAPI: true
 */

#include "script_component.hpp"

if (isnil QGVAR(selectedBodyPart)) then {
	GVAR(selectedBodyPart) = "head";
};
GVAR(selectedBodyPart)