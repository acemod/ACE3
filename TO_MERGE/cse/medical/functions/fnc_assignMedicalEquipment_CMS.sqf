/**
 * fn_assignMedicalEquipment_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */
#define ALL_PLAYERS 0
#define ONLY_MEDICS	1


// TODO add amount of to defines
#define BASIC_BANDAGES 		"cse_bandage_basic"
#define PACKING_BANDAGES 	"cse_packing_bandage"


private ["_logic","_setting","_objects", "_medicsLoadout", "_nonMedics", "_code"];
_logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if (!isNull _logic) then {
	_setting = _logic getvariable ["equipment",0];
	waituntil {!isnil "cse_gui"}; // ensure the player unit is available.
	waituntil {time>0};

	_start = diag_tickTime;
	waituntil {(["cse_sys_medical"] call EFUNC(common,isModuleEnabled_F)) || (diag_tickTime - _start > 10000)};

	if (!(["cse_sys_medical"] call EFUNC(common,isModuleEnabled_F))) exitwith {};
	// TODO Create functions for adding multiple magazines to a unit
	// TODO Check if unit can store more magazines (ie backpack/vest/uniform are not full)

	_medicsLoadout = {
		for "_i" from 1 to 8 do	{
			player addItem BASIC_BANDAGES;
			player addItem PACKING_BANDAGES;
		};
		for "_i" from 1 to 3 do	{
			player addItem  "cse_tourniquet";
		};
		for "_i" from 1 to 3 do	{
			player addItem  "cse_morphine";
		};
		for "_i" from 1 to 2 do	{
			player addItem  "cse_epinephrine";
		};
	};

	_nonMedics = {
		for "_i" from 1 to 3 do	{
			player addItem BASIC_BANDAGES;
		};
		player addItem  "cse_tourniquet";
		player addItem  "cse_morphine";
	};


	// TODO make this neat code.
   	switch (_setting) do {
   		case ALL_PLAYERS: {
   			_code = if ([player] call FUNC(medicClass_CMS)) then {
   				_medicsLoadout;
   			} else {
   				_nonMedics;
   			};

   			call _code;
   			player addEventhandler["Respawn", _code];
   		};
   		case ONLY_MEDICS: {
   			_code = if ([player] call FUNC(medicClass_CMS)) then {
   				_medicsLoadout;
   			} else {
   				{};
   			};
   			call _code;
   			player addEventhandler["Respawn", _code];
   		};
   		default {};
   };
 };

true