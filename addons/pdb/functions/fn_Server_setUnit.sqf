/*
*	From Arma 3 Unit to Database
*/

_Player = _this select 0;
waitUntil {isPlayer _Player};
waitUntil {(_Player getVariable "loaded") == 1};
_playerInv = str formatText ["%1", (getUnitLoadout _Player)];
_playerPos = format ["%1",(getPosWorld _Player)];
_playerDir = format ["%1",(round(getDir _Player))];
_playerUID = getPlayerUID _Player;
_playerName = format ["%1",(name _Player)];

_sql_res = "extDB2" callExtension format["0:SQL:SELECT id FROM player WHERE playerUID = '%1'",_playerUID];
_sql_res = _sql_res splitString "[,]";

if(count _sql_res < 2) then {
	_sql_res = "extDB2" callExtension format["0:SQL:INSERT INTO player SET playerUID = '%1', playerName = '%2', playerLastOnline = NOW()",_playerUID,_playerName];
}else{
	_sql_res = "extDB2" callExtension format["0:SQL:UPDATE player SET playerLastOnline = NOW() WHERE playerUID = '%1'",_playerUID];
};

if(!isNull(getConnectedUAV _Player)) then { 
	[getConnectedUAV _Player,_Player,"Driver"]execVM "\sru_pdb\functions\fn_Server_setSingleVehicle.sqf"; 
};

"extDB2" callExtension format["0:SQL:INSERT IGNORE INTO player_mission_connection SET playerUID = '%1',mission_FK = '%2'",_playerUID,sru_pdb_mission_fk];

if(count(_playerInv) > 70) then {
	"extDB2" callExtension format["0:SQL:UPDATE player_mission_connection SET playerInv = '%1', playerPos = '%2', playerDir = '%3',playerLastOnline = NOW() WHERE playerUID = '%5' AND mission_FK = '%4'",_playerInv,_playerPos,_playerDir,sru_pdb_mission_fk,_playerUID];
}else{
	"extDB2" callExtension format["0:SQL:UPDATE player_mission_connection SET playerPos = '%1', playerDir = '%2',playerLastOnline = NOW() WHERE playerUID = '%4' AND mission_FK = '%3'",_playerPos,_playerDir,sru_pdb_mission_fk,_playerUID];
};