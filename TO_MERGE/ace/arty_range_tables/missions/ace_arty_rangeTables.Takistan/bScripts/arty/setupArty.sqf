//Written by beta
//Init file


sleep 5;  //wait for start

ballCompCtrl = compile preprocessFileLineNumbers "bScripts\arty\ballCompCtrl.sqf";
bArty_fnc_getSolution = compile preprocessFileLineNumbers "bScripts\arty\fnc_getSolution.sqf";
bArty_fnc_lowSolution = compile preprocessFileLineNumbers "bScripts\arty\fnc_lowSolution.sqf";
bArty_fnc_interp = compile preprocessFileLineNumbers "bScripts\arty\fnc_interp.sqf";
bArty_fnc_sim = compile preprocessFileLineNumbers "bScripts\arty\fnc_sim.sqf";
bArty_fnc_weaponMode = compile preprocessFileLineNumbers "bScripts\arty\fnc_weaponMode.sqf";

bArty_elevation = "Elevation (mils): ";
bArty_azimuth = "Azimuth (mils): ";
bArty_tof = "Time of Flight: ";
bArty_charge = "Charge: ";
bArty_tgtEasting = "";
bArty_tgtNorthing = "";
bArty_tgtElev = "";
bArty_posEasting = "";
bArty_posNorthing = "";
bArty_posElev = "";

["ace_sys_crewserved_noam", {
	_weapon = _this;
	if (_weapon isKindOf "StaticMortar") then
	{
		[_weapon] execVM "bScripts\arty\register.sqf";
	};
}] call CBA_fnc_addEventHandler;

[] execVM "bScripts\arty\setupArtyActions.sqf";
