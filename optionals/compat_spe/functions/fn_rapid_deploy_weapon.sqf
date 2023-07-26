/*
Author: Kerc, original by www.3commandobrigade.com
Rapidly assemble light mortars and deploy the weapon
Arguments:
0: weaponPlatform
Return Value:
none
*/

/////////////////////////////////////////////////////////////////////////////////////////////
// Main - executed local to the weapon
//////////////////////////////////////////////////////////////////////////////////////////
params ["_unit"];
private _handled = false;
private _weapon = secondaryWeapon _unit;
if (alive _unit && {_weapon == "SPE_2Inch_Mk7_Mortar_Slung" && vehicle _unit == _unit}) then //Change to not be weapon specific when it matters
{
	_handled = true;
	private _playerPos = _unit modelToWorldVisualWorld (_unit selectionPosition "Spine3");
	private _pos = _playerPos vectorAdd ((vectorDir _unit) vectorMultiply 2.2); //Have it be a bit more anal for the check
	private _intersects =  lineIntersectsSurfaces  [_playerPos, _pos, _unit, objNull,true,1,"FIRE","NONE"];

	if (count _intersects > 0 ) exitWith {hint (localize "STR_SPE_System_StaticWeapons_Hint_No_Room_To_Deploy");};
	// Animate the player to get in the weapon platform
	_unit playActionNow "PlayerProne";
	private _secondaryMag = secondaryWeaponMagazine _unit select 0;
	if !(isNil "_secondaryMag") then
	{
		private _secondaryMag_count = _unit ammo (secondaryWeapon _unit);

		if (_unit canAdd _secondaryMag) then
		{
			_unit addMagazine [_secondaryMag,_secondaryMag_count];
		}
		else
		{
			private _weaponHolder = nearestObject [_unit, "WeaponHolder"];
			if (isNull _weaponHolder || {_unit distance _weaponHolder > 2}) then {
					_weaponHolder = createVehicle ["GroundWeaponHolder", [0,0,1000], [], 0, "CAN_COLLIDE"];
					_weaponholder setposASL (getPosASL _unit);
			};
			_weaponHolder addMagazinecargoGlobal [_secondaryMag, 1];
		};
	};

	// remove the weapon from the player's inventory
	_unit removeWeapon _weapon;

	_playerPos = (getPosASL _unit);
	_pos = _playerPos vectorAdd ((vectorDir _unit) vectorMultiply 1.1);
	private _veh = createVehicle [getText(configFile >> "cfgWeapons" >> _weapon >> "SPE_Deployed_Tripod_Name"), (ASLToATL _pos), [], 0, "CAN_COLLIDE"];
	_veh setVectorDirAndUp [vectorDir _unit, [0, 0, 1]];

	[
	{
		params ["_unit","_veh"];_unit action ["getInGunner", _veh];
	}, [_unit,_veh], 1] call SPE_fnc_waitAndExecute;




};
_handled
