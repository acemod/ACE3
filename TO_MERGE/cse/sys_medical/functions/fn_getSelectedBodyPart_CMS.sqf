/**
 * fn_getSelectedBodyPart_CMS.sqf
 * @Descr: Get the current selected body part for client
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return: STRING bodyPart selected
 * @PublicAPI: true
 */


	if (isnil "CSE_SELECTED_BODY_PART_CMS") then {
		CSE_SELECTED_BODY_PART_CMS = "head";
	};

CSE_SELECTED_BODY_PART_CMS