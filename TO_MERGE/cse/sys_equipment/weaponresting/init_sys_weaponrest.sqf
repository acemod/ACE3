if (!hasInterface) exitwith {};
waituntil{!isnil "cse_gui" && !isnil "cse_main"};

waitUntil {!isNull player};

["cse_isWeaponRested_WR"  , false, false, "wr"] call cse_fnc_defineVariable;
["cse_isWeaponDeployed_WR", false, false, "wr"] call cse_fnc_defineVariable;

cse_sys_weaponRest = true;
