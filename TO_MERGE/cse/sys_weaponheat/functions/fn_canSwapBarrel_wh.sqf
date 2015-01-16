private ["_unit", "_weapon"];
_unit   = _this select 0;
_weapon = _this select 1;

if (getNumber(configFile >> "CfgWeapons" >> _weapon >> "cse_exchangeableBarrel") != 1) exitWith { false };

if ([_unit, getText(configFile >> "CfgWeapons" >> _weapon >> "cse_spareBarrel")] call cse_fnc_hasItem) exitWith { true };
if (cse_genericSpareBarrel_wh && [_unit, "cse_sparebarrelbag"] call cse_fnc_hasItem) exitWith { true };

false
