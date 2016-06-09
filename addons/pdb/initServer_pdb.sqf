if(isNil {uiNamespace getVariable "SRU_PDB_INIT"}) then
{
	call compile ("extDB2" callExtension "9:ADD_DATABASE:SRU_DB");
	call compile ("extDB2" callExtension "9:ADD_DATABASE_PROTOCOL:SRU_DB:SQL_RAW_v2:SQL");
	uiNamespace setVariable ["extDB_dbID", true];
};

sru_pdb_map = format["%1",worldName];
sru_pdb_mission = format["%1",missionName];
sru_allowed_Obj = [
	"Structures_Fences",
	"Jonzie_Objects",
	"Structures_Military",
	"ARP_Objects",
	"ARP_objects",
	"ACE_Logistics_Items",
	"Tents",
	"Ammo",
	"Misc",
	"Garbage",
	"Fortifications",
	"Container",
	"Flag",
	"Furniture",
	"Objects_Airport",
	"Cargo",
	"Dead_bodies",
	"Small_items",
	"Lamps",
	"Military",
	"Signs",
	"signs",
	"Objects_Sports",
	"Training"
];

sru_blacklist_Obj = [
	"Land_Shoot_House_Wall_F",
	"Land_Shoot_House_Wall_Prone_F",
	"Land_Shoot_House_Wall_Crouch_F",
	"Land_Shoot_House_Wall_Long_F",
	"Land_Shoot_House_Wall_Long_Stand_F",
	"Land_Shoot_House_Wall_Long_Prone_F"
];
					
sru_allowed_veh = [
	"Car",
	"Jonzie_Vehicles",
	"Autonomous",
	"Armored",
	"Air",
	"Ship",
	"Support",
	"BWE_RF",
	"BWE_KF",
	"EWK_Cars",
	"BWA3_VehClass_Wheeled_Fleck",
	"air",
	"BWE_HS"
];

{
	_vehicleType = typeOf _x;
	_vehicleClass = getText (configFile >> "CfgVehicles" >> _vehicleType >> "vehicleClass");
		
	if(_vehicleClass in sru_allowed_veh) then {
		clearItemCargoGlobal _x;
		clearBackpackCargoGlobal _x;
		clearMagazineCargoGlobal _x;
		clearWeaponCargoGlobal _x;
	};
} forEach (vehicles);


_sql_res = "extDB2" callExtension format["0:SQL:SELECT * FROM mission WHERE missionMap = '%1' AND missionName = '%2'",sru_pdb_map,sru_pdb_mission];
_sql_res = _sql_res splitString "[,]";

if(count _sql_res < 2) then {
	"extDB2" callExtension format["0:SQL:INSERT INTO mission SET missionMap = '%1', missionName = '%2', missionLoaded = NOW()",sru_pdb_map,sru_pdb_mission];
	_sql_res = "extDB2" callExtension format["0:SQL:SELECT * FROM mission WHERE missionMap = '%1' AND missionName = '%2'",sru_pdb_map,sru_pdb_mission];
	_sql_res = _sql_res splitString "[,]";
	sru_pdb_mission_fk = (_sql_res select 1);
	publicVariable "sru_pdb_mission_fk";
	
	_setVeh = [] execVM "\sru_pdb\functions\fn_Server_setVehicle.sqf";
	waitUntil{scriptDone _setVeh};
	
	_setObj = [] execVM "\sru_pdb\functions\fn_Server_setObjects.sqf";
	waitUntil{scriptDone _setObj};
	
} else {
	sru_pdb_mission_fk = (_sql_res select 1);
	publicVariable "sru_pdb_mission_fk";
	"extDB2" callExtension format["0:SQL:UPDATE mission SET missionLoaded = NOW() WHERE id = '%1'",sru_pdb_mission_fk];
	
	_getVeh = [] execVM "\sru_pdb\functions\fn_Server_getVehicle.sqf";
	waitUntil{scriptDone _getVeh};
	
	_getObj = [] execVM "\sru_pdb\functions\fn_Server_getObjects.sqf";
	waitUntil{scriptDone _getObj};
};

_markers = [] execVM "\sru_pdb\functions\fn_Server_getMarkers.sqf";
waitUntil{scriptDone _markers};

sru_cnt = 59;
publicVariable "sru_cnt";

while {true} do {
	sru_cnt = sru_cnt + 1;

	sleep 1;
	_null = [] execVM "\sru_pdb\functions\fn_Server_resupply.sqf";
	_setVehicle = [] execVM "\sru_pdb\functions\fn_Server_setVehicle.sqf";
	
	{
		_setUnit = [_x] execVM "\sru_pdb\functions\fn_Server_setUnit.sqf";
		waitUntil{scriptDone _setUnit};

	} forEach allPlayers;
	
	sleep 59;

	if(sru_cnt >= 60) then {
		
		_setObj = [] execVM "\sru_pdb\functions\fn_Server_setObjects.sqf";
		waitUntil{scriptDone _setObj};
		[] execVM "\sru_pdb\functions\fn_Server_cleanupDB.sqf";
		sru_cnt = 0;
	};
};



