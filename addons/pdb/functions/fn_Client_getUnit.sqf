/*
*   From Database to Arma 3 Unit
*/


_Player = _this select 0;
_playerUID = _this select 1;
_playerName = format ["%1",(name _Player)];
_sql_res = _this select 2;
_sql_res2 = _this select 3;

_playerRank = "vDSK_Schuetze";
_playerAdmin = "0";
diag_log format ["SRU PDB - Loading profile for player %1", _playerName];
if ((count _sql_res) > 35) then {

    _sql_res = _sql_res splitString "[,]";
    _playerRank = (_sql_res select 1);
	
    _playerPos = [parseNumber (call compile "(_sql_res select 3)"),parseNumber (call compile "(_sql_res select 4)"), parseNumber(call compile "(_sql_res select 5)")];
    if(parseNumber (call compile "(_sql_res select 3)") != 0) then {
        _Player setPosWorld _playerPos;
    };
    
    _playerAdmin = (_sql_res select 2);
    if(_playerAdmin == "1") then {
        _Player setVariable ["sruAdmin", 1, true];
    };
    
    removeAllWeapons _Player;
    removeGoggles _Player;
    removeHeadgear _Player;
    removeVest _Player;
    removeUniform _Player;
    removeAllAssignedItems _Player;
    removeBackpack _Player;
    _playerInventory = _sql_res2 select 1 select 0 select 0;
	
	if(!isNil {_playerInventory}) then {
		if((count _playerInventory) > 5) then {
			diag_log format ["SRU PDB - Setting inventory for player %1", _playerName];
			_Player setUnitLoadout _playerInventory;
			diag_log format ["SRU PDB - Setting inventory for player %1 complete", _playerName];
		};
	};

};

[[ _Player, format["%1",_playerRank]], "BIS_fnc_setUnitInsignia", true, true, true] call BIS_fnc_MP;
[_Player, format["%1",_playerRank], true, true] remoteExecCall ["BIS_fnc_setUnitInsignia", _Player];


_Player setVariable ["loaded", 1, true];
diag_log format ["SRU PDB - Loading profile for player %1 complete", _playerName];

