/**
 * init.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_args"];
_args = _this;

CSE_STAMINA_ADJUSTMENT_STM = 1;

{
	_value = _x select 1;
	if (!isnil "_value") then {
		if (_x select 0 == "adjustment") then {
			CSE_STAMINA_ADJUSTMENT_STM = _x select 1;
		};
	};
}foreach _args;

if (!hasInterface) exitwith {};
waituntil{!isnil "cse_gui" && !isnil "cse_main"};

if (CSE_STAMINA_ADJUSTMENT_STM > 0) then {
	["cse_adjust_stamina", [], {
		_currentStamina = getFatigue player;
		_difference = _currentStamina - _previousStamina;
		if (_difference > 0) then {
			_difference = _difference * CSE_STAMINA_ADJUSTMENT_STM;
			player setFatigue (_previousStamina + _difference);
			_previousStamina = (_previousStamina + _difference);
		} else {
			_previousStamina = _currentStamina;
		};
	}] call cse_fnc_addTaskToPool_f;

} else {
	player enableFatigue false;
};