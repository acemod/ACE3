["ACE3 Equipment", QGVAR(LaserCodeUp), localize STRING(laserCodeUp),
{
    if( EGVAR(laser_selfdesignate,active) 
        || 
        { (currentWeapon ACE_player) == "Laserdesignator" && (call CBA_fnc_getFoV) select 1 > 5 }  // If laserdesignator & FOV, we are in scope.
        || 
        { [ACE_player] call FUNC(unitTurretCanLockLaser) }
    ) then {
        [] call FUNC(keyLaserCodeUp);
    };
},
{false},
[16, [false, true, true]], false, 0] call CBA_fnc_addKeybind; // (ALT+CTRL+Q)

["ACE3 Equipment", QGVAR(LaserCodeDown), localize STRING(laserCodeDown),
{
    if( EGVAR(laser_selfdesignate,active) 
        || 
        { (currentWeapon ACE_player) == "Laserdesignator" && (call CBA_fnc_getFoV) select 1 > 5 } // If laserdesignator & FOV, we are in scope.
        || 
        { [ACE_player] call FUNC(unitTurretCanLockLaser) }
    ) then {
        [] call FUNC(keyLaserCodeDown);
    };
},
{false},
[18, [true, true, true]], false, 0] call CBA_fnc_addKeybind; // (ALT+CTRL+E)
