// by commy2

private ["_unit", "_target", "_item", "_fuel"];

_unit = _this select 0;
_target = _this select 1;

_item = _unit getVariable ["AGM_carriedItem", objNull];
_fuel = _item getVariable ["AGM_amountFuel", 20];

_item isKindOf "AGM_JerryCan"
&& {alive _target}
&& {speed _target == 0}
&& {fuel _target < 1}
&& {_fuel > 0}
