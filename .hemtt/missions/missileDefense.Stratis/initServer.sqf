/// Create a system that engages independent side projectiles.
private _defense = [[independent]] call ace_missile_defense_fnc_createSystem;

[_defense, w_tracker_1] call ace_missile_defense_fnc_registerTracker;
[_defense, w_tracker_2] call ace_missile_defense_fnc_registerTracker;

[_defense, w_launcher_1] call ace_missile_defense_fnc_registerLauncher;
[_defense, w_launcher_2] call ace_missile_defense_fnc_registerLauncher;
[_defense, w_launcher_3] call ace_missile_defense_fnc_registerLauncher;
