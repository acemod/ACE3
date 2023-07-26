/*
Author: Kerc
EH Backup for when the Put EH does not run (Swapping items)
Arguments:
0: unit
1: container (not used)
2: item
Return Value:
none
*/

/////////////////////////////////////////////////////////////////////////////////////////////
// Main
//////////////////////////////////////////////////////////////////////////////////////////
params
[
	["_unit",objNull,[objNull]],
	["_container",objNull],
    ["_item","",[]]
];
private _tripods = [];

if !(_container isKindOf "GroundWeaponHolder") exitWith {}; //So this doesn't run when placing a tripod in a vehicle/box
if (alive _unit) then {
    {
        if ((configFile >> "cfgWeapons" >> _x >> "SPE_isTripod") call BIS_fnc_getCfgDataBool) then
        {
            _tripods pushBack _x;
        };

    } forEach weaponcargo _container;

    if (count _tripods > 0) then
    {
        private _weaponsItemsCargo = weaponsItemsCargo _container;

        clearWeaponCargoGlobal _container;
				{
					_x params ["_weapon","","","","_primaryMuzzleMagazine"];
					_primaryMuzzleMagazine params ["_primaryMagazine","_primaryMagazineCount"];

					if (_weapon != _item) then {
						_container addWeaponWithAttachmentsCargoGlobal [_x,1];
					}
					else
					{
						if !(isNil "_primaryMagazine") then
						{
							if (_unit canAdd _primaryMagazine) then
							{
								_unit addmagazine [_primaryMagazine,_primaryMagazineCount];
							}
							else
							{
								_container addMagazineAmmoCargo [_primaryMagazine, 1, _primaryMagazineCount];
							};
						};
					};
				} forEach _weaponsItemsCargo;




        {
            private _pos = (getPosATL _unit) vectorAdd ((vectorDir _unit) vectorMultiply 1.1);

            // Note M6 is also considered a tripod as far as the next instruction is concerned.
            createVehicle [getText(configFile >> "cfgWeapons" >> _x >> "SPE_Deployed_Tripod_Name"), _pos, [], 0, "CAN_COLLIDE"] setVectorDir (vectorDir _unit);
        } forEach _tripods;
    };


};
