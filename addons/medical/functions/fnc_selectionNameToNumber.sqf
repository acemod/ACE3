/**
 * fn_getBodyPartNumber.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

(["head","body","hand_l","hand_r","leg_l","leg_r"] find (_this select 0));