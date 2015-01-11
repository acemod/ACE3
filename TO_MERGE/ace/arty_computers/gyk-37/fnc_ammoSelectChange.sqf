//fnc_ammoSelectChange.sqf
#include "script_component.hpp"

_index = _this select 1;
_data = lbData [IDC_Mission_EngageAmmunitionTypeSelect, _index];
[_data, ""] call FUNC(setFuzeSelection);