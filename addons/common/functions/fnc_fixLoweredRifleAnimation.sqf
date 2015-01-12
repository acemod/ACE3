// by commy2
#include "\z\ace\addons\common\script_component.hpp"

private "_unit";

_unit = _this select 0;

if (currentWeapon _unit != "" && {currentWeapon _unit == primaryWeapon _unit} && {weaponLowered _unit} && {stance _unit == "STAND"}) then {
  [_unit, "amovpercmstpsraswrfldnon", 0] call FUNC(doAnimation);
};
