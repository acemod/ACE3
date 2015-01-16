/**
 * fn_hasTourniquetAppliedTo_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_unit","_part","_selectionName","_tourniquets"];
_unit = _this select 0;
_selectionName = _this select 1;
_part =	[_selectionName] call FUNC(getBodyPartNumber_CMS);
_tourniquets = [_unit,QGVAR(tourniquets)] call EFUNC(common,getDefinedVariable);
((_tourniquets select _part) > 0)