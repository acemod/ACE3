/*
*	From Database to Arma 3 Unit
*/

_Player = _this select 0;
waitUntil {isPlayer _Player};
sleep 1;

_playerUID = format ["%1",(getPlayerUID _Player)];
_sql_res = "extDB2" callExtension format["0:SQL:SELECT playerRank,playerAdmin,playerPos,playerDir FROM player p LEFT JOIN player_mission_connection pmc ON (pmc.playerUID = p.playerUID AND pmc.mission_FK = '%2') WHERE p.playerUID = '%1'",_playerUID,sru_pdb_mission_fk];
_sql_res2 = call compile ("extDB2" callExtension format["0:SQL:SELECT playerInv FROM player p LEFT JOIN player_mission_connection pmc ON (pmc.playerUID = p.playerUID AND pmc.mission_FK = '%2') WHERE p.playerUID = '%1'",_playerUID,sru_pdb_mission_fk]);

sleep 5;
[ [[_Player,_playerUID,_sql_res,_sql_res2],"\sru_pdb\functions\fn_Client_getUnit.sqf"],"BIS_fnc_execVM",false,false ] call BIS_fnc_MP;