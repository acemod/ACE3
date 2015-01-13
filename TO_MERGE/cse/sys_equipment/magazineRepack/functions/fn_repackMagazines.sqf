/**
 * fn_repackMagazines.sqf
 * @Descr: Repacks all magazines of given type for a unit
 * @Author: Ruthberg
 *
 * @Arguments: [unit OBJECT, classname STRING]
 * @Return:
 * @PublicAPI: true
 */

#define MAGAZINE_ACCESS_DELAY 3.0
#define AMMO_REPACK_DELAY 2.0

private ["_unit", "_className", "_magazineCapacity", "_magazines", "_repackableAmmoCount", "_repackableMagazinesCount", "_repackableMagazinesAmmoCounts", "_magazineClassName", "_magazineAmmoCount", "_amountOfFillableMagazines", "_workLoad", "_totalRepackTime", "_firstIndex", "_lastIndex", "_startTime", "_greatestAmmoCount", "_smallestAmmoCount"];
_unit      = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_className = [_this, 1, "", [""]] call bis_fnc_param;

if (isNull _unit || _className == "") exitwith {};
if (vehicle _unit != _unit && {driver (vehicle _unit) == _unit || commander (vehicle _unit) == _unit || gunner (vehicle _unit) == _unit}) exitWith {};

if (vehicle _unit == _unit && currentWeapon _unit != "" && !(weaponLowered _unit) && (stance player != "PRONE")) then {
	_unit action ["WeaponOnBack", _unit];
	waitUntil { weaponLowered _unit }; // probably evil
};

_magazineCapacity = getNumber(configFile >> "CfgMagazines" >> _className >> "count");

_magazines = magazinesAmmo _unit;
_repackableAmmoCount = 0;
_repackableMagazinesCount = 0;
_repackableMagazinesAmmoCounts = [];
{
	_magazineClassName = (_x select 0);
	_magazineAmmoCount = (_x select 1);
	if (_magazineClassName == _className && _magazineAmmoCount < _magazineCapacity) then {
		// sums the amount of remaining ammo in all used magazines
		_repackableAmmoCount = _repackableAmmoCount + _magazineAmmoCount;
		_repackableMagazinesCount = _repackableMagazinesCount + 1;
		_repackableMagazinesAmmoCounts pushBack _magazineAmmoCount;
	};
} forEach _magazines;

if (_repackableMagazinesCount < 2) exitWith {};

[getText(configFile >> "CfgMagazines" >> _className >> "displayName"), ["Starting magazine repack"], 0] call cse_fnc_gui_displayInformation;

_amountOfFillableMagazines = floor(_repackableAmmoCount / _magazineCapacity);

_repackableMagazinesAmmoCounts = [_repackableMagazinesAmmoCounts, false] call cse_fnc_insertionSort;

_workLoad = 0; // amount of ammo that needs to be repacked
for "_i" from 0 to _amountOfFillableMagazines - 1 do {
	_workLoad = _workLoad + (_magazineCapacity - (_repackableMagazinesAmmoCounts select _i));
};

CSE_ORIGINAL_POSITION_MAG_REPACK_EQ = getPos _unit;
CSE_CONDITION_MAG_REPACK_EQ = {((vehicle player != player && driver (vehicle player) != player && commander (vehicle player) != player && gunner (vehicle player) != player) || (((getPos player) distance CSE_ORIGINAL_POSITION_MAG_REPACK_EQ) < 1 && (weaponLowered player) || (stance player == "PRONE")))};
CSE_RUNNING_MAG_REPACK_EQ = true;
_totalRepackTime = MAGAZINE_ACCESS_DELAY * (count _repackableMagazinesAmmoCounts) + AMMO_REPACK_DELAY * _workLoad;
_totalRepackTime spawn {
	CSE_RUNNING_MAG_REPACK_EQ = [_this, CSE_CONDITION_MAG_REPACK_EQ] call cse_fnc_gui_loadingBar;
};

_startTime = diag_tickTime; waitUntil {diag_tickTime - _startTime > MAGAZINE_ACCESS_DELAY};
_firstIndex = 0;
_lastIndex = _repackableMagazinesCount - 1;
while {CSE_RUNNING_MAG_REPACK_EQ && _lastIndex > _firstIndex} do {
	_greatestAmmoCount = _repackableMagazinesAmmoCounts select _firstIndex;
	_smallestAmmoCount = _repackableMagazinesAmmoCounts select _lastIndex;

	_startTime = diag_tickTime; waitUntil {diag_tickTime - _startTime > AMMO_REPACK_DELAY / 2.0};
	if (!CSE_RUNNING_MAG_REPACK_EQ) exitWith {};
	playSound "cse_magrepack_single";
	_repackableMagazinesAmmoCounts set [_lastIndex, _smallestAmmoCount - 1];
	_startTime = diag_tickTime; waitUntil {diag_tickTime - _startTime > AMMO_REPACK_DELAY / 2.0};
	if (!CSE_RUNNING_MAG_REPACK_EQ) exitWith {};
	playSound "cse_magrepack_finished";
	_repackableMagazinesAmmoCounts set [_firstIndex, _greatestAmmoCount + 1];

	// Skip full magazines
	if (_repackableMagazinesAmmoCounts select _firstIndex == _magazineCapacity) then {
		_startTime = diag_tickTime; waitUntil {diag_tickTime - _startTime > MAGAZINE_ACCESS_DELAY};
		_firstIndex = _firstIndex + 1;
		[getText(configFile >> "CfgMagazines" >> _className >> "displayName"), [format["Finished repacking (%1/%2) magazines", _firstIndex, _amountOfFillableMagazines]], 0] call cse_fnc_gui_displayInformation;
	};
	// Skip empty magazines
	if (_repackableMagazinesAmmoCounts select _lastIndex == 0) then {
		_startTime = diag_tickTime; waitUntil {diag_tickTime - _startTime > MAGAZINE_ACCESS_DELAY};
		_lastIndex = _lastIndex - 1;
	};
};

// Apply changes
for "_i" from 1 to _repackableMagazinesCount do {
	_unit removeMagazine _className;
};
for "_i" from 0 to _lastIndex do {
	_unit addMagazine [_className, _repackableMagazinesAmmoCounts select _i];
};

if (_firstIndex >= _lastIndex) then {
	[getText(configFile >> "CfgMagazines" >> _className >> "displayName"), ["Completed magazine repack"], 0] call cse_fnc_gui_displayInformation;
} else {
	[getText(configFile >> "CfgMagazines" >> _className >> "displayName"), ["Aborted magazine repack"], 0] call cse_fnc_gui_displayInformation;
};
