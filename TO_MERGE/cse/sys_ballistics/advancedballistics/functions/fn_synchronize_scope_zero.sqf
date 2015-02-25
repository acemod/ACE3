#include "defines.h"

private ["_opticsName", "_zeroPlayer", "_zeroProfileNamespace"];

if (count primaryWeaponItems player > 2) then
{
	_opticsName = (primaryWeaponItems player) select 2;
	_zeroPlayer = player getVariable [format["cse_AB_Zero:%1", _opticsName], 0];
	_zeroProfileNamespace = profileNamespace getVariable [format["cse_AB_Zero:%1", _opticsName], 0];
	
	if (_zeroProfileNamespace != 0 && _zeroPlayer != _zeroProfileNamespace) then {
		player setVariable [format["cse_AB_Zero:%1", _opticsName], _zeroProfileNamespace, true];
	};
};
