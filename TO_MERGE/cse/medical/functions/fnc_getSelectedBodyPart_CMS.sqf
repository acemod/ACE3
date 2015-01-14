/**
 * fn_getSelectedBodyPart_CMS.sqf
 * @Descr: Get the current selected body part for client
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return: STRING bodyPart selected
 * @PublicAPI: true
 */


	if (isnil QGVAR(selectedBodyPart)) then {
		GVAR(selectedBodyPart) = "head";
	};

GVAR(selectedBodyPart)