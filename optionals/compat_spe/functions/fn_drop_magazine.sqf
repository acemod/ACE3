/*
Author: Kerc, original by www.3commandobrigade.com
Drop magazine, either in the backpack or on the ground
Arguments:
0: Magazine
1: Ammo count in the magazine --- note -1 == full
2:
Return Value:
None
*/

/////////////////////////////////////////////////////////////////////////////////////////////
// Main
//////////////////////////////////////////////////////////////////////////////////////////

params
[
	["_magName",""],
	["_ammoCount",0],
    ["_holder",objNull,[objNull]]

];

private _ammoMax = (configFile >> "cfgMagazines" >> _magName >> "count") call BIS_fnc_getCfgData;
private _player_class = ((configFile >> "cfgMagazines" >> _magName >> "SPE_PLAYER_CLASS") call BIS_fnc_getCfgData);
if (isnil "_player_class") then {_player_class = ""};
if (_ammoCount == -1) then { _ammoCount = _ammoMax; };
if (_ammoCount == 0) exitwith {};
private _unit = (call SPE_fnc_findPlayer);

if (isNull _holder) then
{
	private _nearHolders = (nearestObjects [getPosATL _unit, ["WeaponHolder"],3,true]);
	if (count _nearHolders == 0) then
	{
		_holder = createVehicle ["GroundWeaponHolder", getPos _unit, [], 0, "NONE"];
		private _pos = _unit modelToWorldVisualWorld [2,1,0];
		_holder setDir (random 360);
		_holder setPosASL _pos;
	}
	else
	{
		_holder = _nearHolders select 0;
	};
};

// Add to backpack
if ((_player_class == "") && (_unit canAddItemToBackpack _magName)) then {
	private _container = backpackContainer _unit;
	_container addMagazineAmmoCargo [_magName, 1, _ammoCount];
} else {
	// No room, so place on the floor
	//_pos = (getPosATL _unit) vectorAdd [(random 1.0)-0.5, (random 1.0)-0.5, 0.0];
    if ( _player_class == "") then
    {

		_holder addMagazineAmmoCargo [_magName, 1, _ammoCount];
    }
    else
    {
        //AI magazine in use, convert it to be player magazines
        _holder addMagazineAmmoCargo [_player_class, _ammoCount, _ammoMax];
    };
};
