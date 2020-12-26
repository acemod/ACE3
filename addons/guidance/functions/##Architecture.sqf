
OnWeaponSwitch-
    Check if magazine has guidable ammo, if so {
        check if seeker already exists, if so { 
            create a seeker
                forEach sensor in seeker, create a sensor
            }    
        }
        
        

    
OnFired
    
    Retrieve appropriate seeker entry
        Copy seeker entry to global list
        reassign relevant values of copied list to sensor
    create projectile entry
    assign seeker entry to projectile by reference
    









[_object, _weapon, _magazine, _type, _enabled, _fixed, _fixedAngle, _vector, _direction];


GVAR(countermeasures)
[]

GVAR(sensors)
["_object", "_weapon", "_magazine", "_sensorType", "_enabled", "_sensorDirection", "_sensorAngle", "_sensorLookVector", "_sensorLookDirection", "_sensorLookAngle", "_range", "_priority", "_lastSensorReturns", "_sensorMisc"];
_lastSensorReturns params ["_lastSensorReturnVector", "_lastSensorReturnPos", "_lastSensorReturnDir", "_lastSensorReturnRelPos"];

GVAR(seekers) 
["_object", "_weapon", "_magazine", "_seekerType", "_enabled", "_seekerDirection", "_seekerLookVector", "_seekerLookDirection", "_caged", "_slaves", "_tracking", "_launched", "_lastSeekerReturns", "_sensorArray", "_seekerEH", "_seekerMisc"];
_lastSeekerReturns params ["_lastSeekerReturnVector", "_lastSeekerReturnPos", "_lastSeekerReturnDir", "_lastSeekerReturnRelPos"];

GVAR(flightProfile)
["_flightProfileObject", "_flightProfileType", "_seekerArrays", "_lastflightProfileReturns", "_flightProfileMisc"];



GVAR(fuzes)
["_object", "_weapon", "_magazine"];

GVAR(projectile)
["_object", "_eh", "_fuze", "_seekers", "_flightProfile", "_flightParams"];










getVariable GVAR(guidedWeapons)
params [_weapon1, _weapon2, _weapon3,... _weaponN];
_weapon params [_weaponName, [_magazine1, _magazine2, _magazine3,... _magazineN]];
_magazine params [_magazineName, [_seeker1, _seeker2, _seeker3,... _seekerN];
_seeker params [_sensorID1, _sensorID2, _sensorID3,... _sensorIDN];


GVAR(seekers)
["_object", "_weapon", "_magazine", "_seekerType", "_aceMode", "_enabled", "_seekerDirection", "_seekerLookVector", "_seekerLookDirection", "_tracking", "_caged", "_slaves", "_launched", "_lastReturns", "_sensorArray"];
_lastReturns params ["_lastReturnVector", "_lastReturnPos", "_lastReturnDir", "_lastReturnRelPos"];

GVAR(sensors)/GVAR(activeSensors)
[_object, _type, _enabled, _function, _range, _sensorDirection, _sensorAngle, _lookVector, _lookAngle, _priority, _lastReturns, _misc];
_lastReturns params ["_lastReturnVector", "_lastReturnPos", "_lastReturnDir", "_lastReturnRelPos"];


GVAR(fuzes)
_x params ["_object", "_type", "_launchTime", "_launchPos", "_armed", "_types"];

//armAlt arms when BELOW, armHeight arms when ABOVE
_armed params ["_armStatus", "_armTime", "_armDist", "_armAlt", "_armHeight"];


_types params ["_clock", "_distance", "_proximity", "_delay", "_altitude", "_seeker"];
_clock params ["_duration", "_startTime"];
_distance params ["_distance", "_startPos"];
_proximity params ["_proxDistance"];
_delay params ["_delayTime"];
_altitude params ["_burstHeight", "_above"];

GVAR(flightProfiles)
params ["_object", "_type", "_seekers", "_lastReturns", "_lastToVector", "_misc"];


GVAR(projectiles)
_x params ["_object", "_seekers", "_flightProfile","_fuze", "_eh", "_flightParams"];
_eh params ["_shooter", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_instigator"];
_flightParams params ["_degreesPerSecond", "_launchTime", "_launchPos", "_launchVector", "_lastFlightVector", "_flightProfile"];




GVAR(countermeasures)
params ["_object", "_type", "_enabled", "_mempoint", "_offset", "_direction", "_angle", "_misc"];

///Slaves
sensor- the simulated sensor element itself-
cursorTarget- player-only, cursorTarget
PilotCamTarget- the pilot camera but ONLY when it is in a tracking mode;
eyeDirection- the eyedirection of the instigator;
weaponDirection- the weaponDirection of the launching weapon;
PilotCamDirection- the pilot camera regardless of its tracking mode;


///DataLink
cursorTarget- player-only, cursorTarget
PilotCamTarget- the pilot camera but ONLY when it is in a tracking mode;
WeaponDirection- the weaponDirection of the launching weapon;



///lazy

if(_timer > 0 && {time - _launchTime > _timer}) exitWith {
    true;
};