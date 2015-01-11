DEMO_fnc_firingSolution = (compile preprocessFileLineNumbers "fnc_firingSolution.sqf");
DEMO_fnc_getBTable = (compile preprocessFileLineNumbers "fnc_getBTable.sqf");
DEMO_fnc_calcBallistics = (compile preprocessFileLineNumbers "fnc_calcBallistics.sqf");
DEMO_fnc_calcFiringSolution = (compile preprocessFileLineNumbers "fnc_calcFiringSolution.sqf");

execVM "bScripts\arty\setupArty.sqf";


player addAction ["Range Table", "rangeTable.sqf"];
//player addAction ["Generate Table", "generateTable.sqf"];
