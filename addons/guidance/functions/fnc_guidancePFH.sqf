#include "script_component.hpp"

//If no sensors (which all guided weapons need, or if countermeasures with nothing to shoot at them), save the CPU power


//Time setup
GVAR(timeVars) params ["_lastRunTime", "_deltaTime", "_lastDiagTime", "_diagDeltaTime"];

//check for time advancing. Always advance and set the ticktime. 
// unless time doesn't advance in which our DeltaT is 0 (because code runs even when paused);
if(time == _lastRunTime) exitWith {
    GVAR(timeVars) set [1, 0]; // deltaTime;
    GVAR(timeVars) set [2, diag_tickTime];
};

_deltaTime = time - _lastRunTime;
GVAR(timeVars) set [0, time];
GVAR(timeVars) set [1, _deltaTime];
GVAR(timeVars) set [2, diag_tickTime];
GVAR(timeVars) set [3, diag_tickTime - _lastDiagTime];

//Countermeasure loop; PLACEHOLDER
{
    _x params ["_object", "_type", "_enabled", "_mempoint", "_offset", "_direction", "_angle", "_misc"];
    
    //If no object/projectile, stop everything
    if(isNull _object || !alive _object) exitWith {
        GVAR(sensors) deleteAt _forEachIndex;
    };

    if (count _x < 8) then {
        if((isNull _object) || (!alive _object)) exitWith {GVAR(countermeasures) deleteAt _forEachIndex};
        if(isNil "_enabled") then {_x set [2, true]};
        if(isNil "_mempoint") then {_x set [3, ""]};
        if(isNil "_offset") then {_x set [4, [0, 0, 0]]};
        if(isNil "_direction") then {_x set [5, [0, 1, 0]]};
        if(isNil "_angle") then {_x set [6, 360]};
        if(isNil "_misc") then {_x set [7, []]};
    };
} forEach GVAR(countermeasures);




// SENSOR LOOP; APPROVED
{
    _x params ["_object", "_weapon", "_magazine", "_sensorType", "_enabled", "_sensorDirection", "_sensorAngle", "_sensorLookVector", "_sensorLookDirection", "_sensorLookAngle", "_range", "_priority", "_lastSensorReturns", "_sensorMisc"];
    _lastSensorReturns params ["_lastSensorReturnVector", "_lastSensorReturnPos", "_lastSensorReturnDir", "_lastSensorReturnRelPos", "_lastSensorCrossVector", "_lastSensorAngleDif"];

    //If no object/projectile, stop everything
    if(isNull _object || !alive _object) exitWith {
        GVAR(sensors) deleteAt _forEachIndex;
    };

    //if isn't in enabled array; add it
    if(_enabled && (GVAR(activeSensors) find _x == -1)) then {
        GVAR(activeSensors) pushback _x;
    };
    
    //Clear any returns;
    {
        private _value = [0, 0, 0];
        if(_forEachIndex % 2 == 0) then { _value = 0};
        _lastReturns set [_forEachIndex, _value]
    } forEach _lastReturns;

    //DEBUG Draw stuff
    /////
    private _pos = _object modelToWorldVisualWorld [0, 0, 0];
    private _str = format ["%1: sensor", _sensorType];
    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [0,0,1,1], ASLToAGL _pos, 0.75, 0.75, 0, _str, 1, 0.025, "TahomaB"];
    
    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [0,0,1,1], ASLToAGL (_pos vectorAdd (_sensorLookVector vectorMultiply 10)), 0.75, 0.75, 0, _str, 1, 0.025, "TahomaB"];
    drawLine3D [ASLtoAGL _pos, ASLToAGL (_pos vectorAdd (_sensorLookVector vectorMultiply 10)), [1,1,0,1]];
    /////
} forEach GVAR(sensors);




// ACTIVE SENSOR LOOP; APPROVED
{
    _x params ["_object", "_weapon", "_magazine", "_sensorType", "_enabled", "_sensorDirection", "_sensorAngle", "_sensorLookVector", "_sensorLookDirection", "_sensorLookAngle", "_range", "_priority", "_lastSensorReturns", "_sensorMisc"];
    _lastSensorReturns params ["_lastSensorReturnVector", "_lastSensorReturnPos", "_lastSensorReturnDir", "_lastSensorReturnRelPos", "_lastSensorCrossVector", "_lastSensorAngleDif"];

    //If no object/projectile, stop everything
    if(isNull _object || !alive _object) exitWith {
        GVAR(activeSensors) deleteAt _forEachIndex;
    };

    //if is in enabled array and not enabled; zero it out and remove it
    if(!_enabled) exitWith {
        _x set [13, []]; // _sensorMisc;
        GVAR(activeSensors) deleteAt _forEachIndex;
        //_x set [13, []]; // _sensorMisc;
    };

    //Get Config and sensor function;
    private _cfg = configFile >> QGVAR(SensorTypes) >> _sensorType;
    private _function = getText (_cfg >> "function");
    private _miscFunction = getText (_cfg >> "miscFunction");
    
    //Convert 'sensor direction' to world vector from model vector;
    private _sensorVector = _object vectorModelToWorldVisual _sensorDirection;

    //Run and return our sensor function
    private _functionReturns = [_object, _sensorType, _sensorVector, _sensorAngle, _sensorLookVector, _sensorLookAngle, _range, _sensorMisc, _function, _miscFunction] call FUNC(runSensor);
    _functionReturns params ["_sensorReturns", "_originalSensorLookVector", "_sensorCrossvector", "_sensorAngleDif"];

    //Parse our two returns into four;
    _sensorReturns params ["_sensorReturnVector", "_sensorReturnPos"];
    _lastSensorReturns set [0, _sensorReturnVector];
    _lastSensorReturns set [1, _sensorReturnPos];
    _lastSensorReturns set [2, _object vectorWorldToModelVisual _sensorReturnVector];
    _lastSensorReturns set [3, _object worldToModelVisual (ASLToAGL _sensorReturnPos)];
    _lastSensorReturns set [4, _sensorCrossVector];
    _lastSensorReturns set [5, _sensorAngleDif];
    //DEBUG drawing stuff;
    /////
    private _pos = _object modelToWorldVisualWorld [0, 0, 0];
    private _str = format ["%1: sensor returns", _sensorType];
    if !(_sensorReturnVector isEqualTo [0, 0, 0]) then {

        drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,1,1], ASLToAGL (_pos vectorAdd (_sensorReturnVector vectorMultiply 10)), 0.75, 0.75, 0, "vector", 1, 0.025, "TahomaB"];
        drawLine3D [ASLToAGL _pos, ASLToAGL (_pos vectorAdd (_sensorReturnVector vectorMultiply 10)), [1,0,1,1]];
    };
    
    if !(_sensorReturnPos isEqualTo [0, 0, 0]) then {
        drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,1,0,1], ASLToAGL _sensorReturnPos, 0.75, 0.75, 0, "pos", 1, 0.025, "TahomaB"];
        drawLine3D [ASLToAGL _pos, ASLToAGL _sensorReturnPos, [1,1,0,1]];
    };
    
    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,0,1], ASLToAGL (_pos vectorAdd (_sensorLookVector vectorMultiply 20)), 0.75, 0.75, 0, _str, 1, 0.025, "TahomaB"];
    drawLine3D [ASLtoAGL _pos, ASLToAGL (_pos vectorAdd (_sensorLookVector vectorMultiply 10)), [1,0,0,1]];
    /////
    
} forEach GVAR(activeSensors);






// SEEKER LOOP; APPROVED
{
    _x params ["_seekerObject", "_weapon", "_magazine", "_seekerType", "_enabled", "_seekerDirection", "_seekerLookVector", "_seekerLookDirection", "_caged", "_slaves", "_tracking", "_launched", "_lastSeekerReturns", "_sensorArray", "_seekerEH", "_seekerMisc"];
    _lastSeekerReturns params ["_lastSeekerReturnVector", "_lastSeekerReturnPos", "_lastSeekerReturnDir", "_lastSeekerReturnRelPos", "_lastSeekerCrossVector", "_lastSeekerAngleDif"];

    //If no object/projectile, stop everything
    if(isNull _seekerObject || !alive _seekerObject) exitWith {
        _sensorArray = [];
        GVAR(seekers) deleteAt _forEachIndex;
    };

    //Set Sensor Enabled State to that of Seeker;
    {
        _x set [4, _enabled]; // enabled
    } forEach _sensorArray;

    //maddog launch;
    if (_launched) then {
        // DEBUG
        /////
        _enabled = true;
        _x set [4, _enabled]; // _enabled;
        _x set [8, false]; // _caged;
        _x set [10, true]; // _tracking;
        /////
    };

    //get pos to make below easier
    private _pos = _seekerObject modelToWorldVisualWorld [0, 0, 0];

    
    //if the missile is caged and still on the rail
    if (_caged && (! _launched)) then {
        
        // DEBUG
        /////
        _slaves = ["pilotCamTarget","cursorTarget"];
        /////
        private _pos = _seekerObject modelToWorldVisualWorld [0, 0, 0];
        private _slaveVector = [0, 0, 0];
        private _slaveIndex = 0;
        private _slaveFound = false;
        //if we have slave entries and we haven't found a valid one, yet;
        while {!_slaveFound && (_slaveIndex < count _slaves)} do {
            private _slave = _slaves select _slaveIndex;
            switch (_slave) do {
                //SENSOR, meaning it'll follow whatever return it's already following;
                case "sensor" : {
                    if !(_lastSeekerReturnVector isEqualTo [0, 0, 0]) then {
                        _slaveFound = true;
                        _slaveVector = +_lastSeekerReturnVector;
                    };
                };
                //CURSORTARGET, (for players only) where it follows the locked object (or where they're looking);
                case "cursorTarget" : {
                    if((_seekerObject == vehicle ACE_Player) && !isNull cursorTarget) then {
                        _slaveFound = true;
                        _slaveVector = _pos vectorFromTo (cursorTarget modelToWorldVisualWorld [0, 0, 0]);
                    };
                };
                //PILOTCAMTARGET, where it follows the pilot cam ONLY if it's locked;
                case "pilotCamTarget": {
                    private _getPilotCam = getPilotCameraTarget _seekerObject;
                    if (_getPilotCam select 0) then {
                        _slaveFound = true;
                        //_slaveVector = (_seekerObject vectorModelToWorldVisual (getPilotCameraDirection _seekerObject));
                        _slaveVector = _pos vectorFromTo (_getPilotCam select 1);
                    };
                };
            };
            if (_slaveVector isEqualTo [0, 0, 0]) then {
                _slaveFound = false;
            };
            _slaveIndex = _slaveIndex + 1;
        };
        if (!_slaveFound) then {
            _slaveVector = _seekerObject weaponDirection _weapon;

            // if we *STILL* don't have a valid vector use the object's direction;
            if (_slaveVector isEqualTo [0, 0, 0]) then {
                _slaveVector = vectorDir _seekerObject;
            };
        };
        _seekerLookVector = +_slaveVector;
    } else {
        //if we're tracking (and uncaged) set our seekerLookVector to our last return vector (if it's valid)
        if (_tracking) then {
            if !(_lastSeekerReturnVector isEqualTo [0, 0, 0]) then {
                if (_lastSeekerAngleDif > 0) then {
                    _seekerLookVector = [_lastSeekerReturnVector, _lastSeekerCrossVector, 1 * _lastSeekerAngleDif] call CBA_fnc_vectRotate3D;
                } else {
                    _seekerLookVector = +_lastSeekerReturnVector;                
                };
            };
        };
    };

    //set our seeker look vector so we can use it again;
    _x set [6, _seekerLookVector]; // _seekerLookVector

    // Calculate vector/Pos to target from all sensors;
    private _sensorVector = [0, 0, 0];
    private _sensorVectorDivisor = 0;
    private _sensorPos = [0, 0, 0];
    private _sensorPosDivisor = 0;
    private _sensorCrossVector = [0, 0, 0];
    private _sensorAngleDif = 0;
    private _sensorAngleDivisor = 0;

    //Get returns from ALL our seeker's sensors;
    {
        _x params ["_sensorObject", "_weapon", "_magazine", "_sensorType", "_enabled", "_sensorDirection", "_sensorAngle", "_sensorLookVector", "_sensorLookDirection", "_sensorLookAngle", "_range", "_sensorPriority", "_lastSensorReturns", "_sensorMisc"];
        _lastSensorReturns params ["_lastSensorReturnVector", "_lastSensorReturnPos", "_lastSensorReturnDir", "_lastSensorReturnRelPos", "_lastSensorCrossVector", "_lastSensorAngleDif"];

        //make sure the sensors follow the seeker's look vector

        _x set [7, _seekerLookVector]; // _sensorLookVector
        
        if !(_lastSensorReturnVector isEqualTo [0, 0, 0]) then {
            _sensorVector = _sensorVector vectorAdd (_lastSensorReturnVector vectorMultiply _sensorPriority);
            _sensorVectorDivisor = _sensorVectorDivisor + _sensorPriority;
        };
        if !(_lastSensorReturnPos isEqualTo [0, 0, 0]) then {
            _sensorPos = _sensorPos vectorAdd (_lastSensorReturnPos vectorMultiply _sensorPriority);
            _sensorPosDivisor = _sensorPosDivisor + _sensorPriority;
        };
        
        if (!(_lastSensorCrossVector isEqualTo [0, 0, 0]) && {_lastSensorAngleDif > 0}) then {
            _sensorCrossVector = _sensorCrossVector vectorAdd _lastSensorCrossVector;
            _sensorAngleDif = _sensorAngleDif + _lastSensorAngleDif;
            _sensorAngleDivisor = _sensorAngleDivisor + 1;
        } else {
            _sensorCrossVector = [0, 0, 0];
            _sensorAngleDif = 0;
            _sensorAngleDivisor = 1;
        };
    } forEach _sensorArray;

    _sensorCrossVector = vectorNormalized _sensorCrossVector;
    _sensorAngleDif = _sensorAngleDif / (_sensorAngleDivisor max 1);

    // If we have sensorVectors then average them out
    if (_sensorVectorDivisor != 0) then {
        _sensorVector = _sensorVector vectorMultiply (1/_sensorVectorDivisor);
        // If we have multiple sensorPos, then average them out;
        if (_sensorPosDivisor != 0) then {
            _sensorPos = _sensorPos vectorMultiply (1/_sensorPosDivisor);
        };
    };

    // set and parse our seeker returns;
    _lastSeekerReturns set [0, _sensorVector];
    _lastSeekerReturns set [1, _sensorPos];
    _lastSeekerReturns set [2, _seekerObject vectorWorldToModelVisual _sensorVector];
    if !(_sensorPos isEqualTo [0, 0, 0]) then {
        _lastSeekerReturns set [3, _seekerObject worldToModel (ASLtoAGL _sensorPos)];
    } else {
        _lastSeekerReturns set [3, [0, 0, 0]];
    };
    _lastSeekerReturns set [4, _sensorCrossVector];
    _lastSeekerReturns set [5, _sensorAngleDif];
    

    //DEBUG draw stuffs
    /////
    private _pos = _seekerObject modelToWorldVisualWorld [0, 0, 0];
    private _str = format ["%1: seeker", _seekerType];
    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [0,1,0,1], ASLToAGL _pos, 0.75, 0.75, 0, _str, 1, 0.025, "TahomaB"];
    if !(_lastSeekerReturnVector isEqualTo [0, 0, 0]) then {
        drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [0,1,1,1], ASLToAGL (_pos vectorAdd (_lastSeekerReturnVector vectorMultiply 10)), 0.75, 0.75, 0, _str, 1, 0.025, "TahomaB"];
        drawLine3D [ASLToAGL _pos, ASLToAGL (_pos vectorAdd (_lastSeekerReturnVector vectorMultiply 10)), [0,1,1,1]];
    };

    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [0,1,0,1], ASLToAGL (_pos vectorAdd (_seekerLookVector vectorMultiply 10)), 0.75, 0.75, 0, _str, 1, 0.025, "TahomaB"];
    drawLine3D [ASLToAGL _pos, ASLToAGL (_pos vectorAdd (_seekerLookVector vectorMultiply 10)), [0,1,0,1]];
    /////
} forEach GVAR(seekers);






// Flight Profile Loop; APPROVED
{
    _x params ["_flightProfileObject", "_flightProfileType", "_seekerArrays", "_lastflightProfileReturns", "_flightProfileMisc"];
    _lastFlightProfileReturns params ["_lastProfileReturnVector", "_lastProfileReturnPos", "_lastPRofileReturnDir", "_lastProfileReturnRelPos"];
    
    //If no object/projectile, stop everything
    if(isNull _flightProfileObject || !alive _flightProfileObject) exitWith {
        GVAR(flightProfiles) deleteAt _forEachIndex;
    };
    
    private _seekerReturnVector = [0, 0, 0];
    private _seekerVectorDivisor = 0;
    private _seekerReturnPos = [0, 0, 0];
    private _seekerPosDivisor = 0;
    
    {
        _x params ["_seekerObject", "_weapon", "_magazine", "_seekerType", "_enabled", "_seekerDirection", "_seekerLookVector", "_seekerLookDirection", "_caged", "_slaves", "_tracking", "_launched", "_lastSeekerReturns", "_sensorArray", "_seekerMisc", "_seekerEH"];
        _lastSeekerReturns params ["_lastSeekerReturnVector", "_lastSeekerReturnPos", "_lastSeekerReturnDir", "_lastSeekerReturnRelPos"];
        

        if !(_lastSeekerReturnVector isEqualTo [0, 0, 0]) then {
            _seekerReturnVector = _seekerReturnVector vectorAdd _lastSeekerReturnVector;
            _seekerVectorDivisor = _seekerVectorDivisor + 1;
        };
        if !(_lastSeekerReturnPos isEqualTo [0, 0, 0]) then {
            _seekerReturnPos = _seekerReturnPos vectorAdd _lastSeekerReturnPos;
            _seekerPosDivisor = _seekerPosDivisor + 1;
        };
    } forEach _seekerArrays;
    
    if (_seekerVectorDivisor != 0) then {
        _seekerVector = _seekerVector vectorMultiply (1/_seekerVectorDivisor);
    };
    if (_seekerPosDivisor != 0) then {
        _seekerPos = _seekerPos vectorMultiply (1/_seekerPosDivisor);
    };
    
    
    private _flightProfileFunction = getText (configFile >> QGVAR(flightProfileTypes) >> _flightProfileType >> "function");
    private _profileReturns = [_flightProfileObject, _flightProfileType, _flightProfileMisc, [_seekerReturnVector, _seekerReturnPos], _flightProfileFunction] call FUNC(runFlightProfile);
    _profileReturns params ["_profileReturnVector", "_profileReturnPos"];
    
    //hint format ["%1\n%2", _seekerReturnVector, _profileReturnVector];
    
    _lastFlightProfileReturns set [0, _profileReturnVector];
    _lastFlightProfileReturns set [1, _profileReturnPos];
    _lastFlightProfileReturns set [2, _flightProfileObject vectorWorldToModelVisual _profileReturnVector];
    if !(_seekerReturnPos isEqualTo [0, 0, 0]) then {
        _lastFlightProfileReturns set [3, _flightProfileObject worldToModel (ASLtoAGL _profileReturnPos)];
    } else {
        _lastFlightProfileReturns set [3, [0, 0, 0]];
    };
    
    _pos = _flightProfileObject modelToWorldVisualWorld [0, 0, 0];
    
    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,1,1,1], ASLToAGL _pos, 0.75, 0.75, 0, _flightProfileType, 1, 0.025, "TahomaB"];
    if !(_lastProfileReturnVector isEqualTo [0, 0, 0]) then {
        drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,1,1,1], ASLToAGL (_pos vectorAdd (_lastProfileReturnVector vectorMultiply 10)), 0.75, 0.75, 0, _flightProfileType, 1, 0.025, "TahomaB"];
        drawLine3D [ASLToAGL _pos, ASLToAGL (_pos vectorAdd (_lastProfileReturnVector vectorMultiply 10)), [0,1,1,1]];
    };
    if !(_lastProfileReturnPos isEqualTo [0, 0, 0]) then {
        drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [0,1,1,1], ASLToAGL (_lastProfileReturnPos), 0.75, 0.75, 0, _flightProfileType, 1, 0.025, "TahomaB"];
        drawLine3D [ASLToAGL _pos, ASLToAGL _lastProfileReturnPos, [0,1,1,1]];
    };
    
    
} forEach GVAR(flightProfiles);







// Projectile loop; APPROVED
{
    _x params ["_object", "_eh", "_fuze", "_seekers", "_flightProfile", "_flightParams"];
    _eh params ["_shooter", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_instigator"];

    //seeker params ["_seekerObject", "_weapon", "_magazine", "_seekerType", "_enabled", "_seekerDirection", "_seekerLookVector", "_seekerLookDirection", "_caged", "_slaves", "_tracking", "_launched", "_lastSeekerReturns", "_sensorArray", "_seekerMisc"];
    //_lastSeekerReturns params ["_lastSeekerReturnVector", "_lastSeekerReturnPos", "_lastSeekerReturnDir", "_lastSeekerReturnRelPos"];

    _flightProfile params ["_flightProfileObject", "_flightProfileType", "_flightProfileSeekers", "_lastFlightProfileReturns", "_flightProfileMisc"];
    _lastFlightProfileReturns params ["_lastProfileReturnVector", "_lastProfileReturnPos", "_lastProfileReturnDir", "_lastProfileReturnRelPos"];

    _flightParams params ["_degreesPerSecond", "_launchTime", "_launchPos", "_launchVector"];


    //If no object/projectile, stop everything
    if ((!alive _object) || (isNull _object)) exitWith {
        GVAR(projectiles) deleteAt _forEachIndex;
    };

    private _toVector = vectorNormalized _lastProfileReturnVector;
    
    if !(_toVector isEqualTo [0, 0, 0]) then {
        private _velocity = velocity _projectile;
        private _vectorDir =  vectorDir _projectile;
        
        toFixed 20;
        diag_log format ["%1\n%2\n%3", _vectorDir, _toVector, (_vectorDir vectorDotProduct _toVector)];
        private _angleDif = acos(_vectorDir vectorDotProduct _toVector);
        private _crossVector =  _velocity vectorCrossProduct _toVector;


        private _vectorUp = vectorUp _projectile; 
        private _newVectorDir = [_vectorDir, _crossVector, _angleDif min (_deltaTime * _degreesPerSecond)] call CBA_fnc_vectRotate3D;
        private _newVectorUp = [_vectorUp, _crossVector, _angleDif min (_deltaTime * _degreesPerSecond)] call CBA_fnc_vectRotate3D;
        
        hint format ["%1\n%2\n%3", _newVectorDir, vectorNormalized _velocity, _newVectorDir vectorDotProduct vectorNormalized _velocity];    
        _projectile setVectorDir _newVectorDir;
        _projectile setVectorUp _newVectorUp;
        _projectile setVelocity ( ((_newVectorDir) vectorMultiply (vectorMagnitude _velocity)) vectorAdd [0, 0, -9.80665 * _deltaTime] );
        
    };

} forEach GVAR(projectiles);









/*
// Fuze loop
{
    _x params ["_object", "_fuzeType", "_startTime", "_startPos", "_armed", "_types"]
    
    if(isNil "_startTime") then {
        _startTime = time;
        _x set [3, _startTime];
    };
    if(isNil "_startPos") then {
        _startPos = _object modelToWorldVisualWorld [0, 0, 0];
        _x set [4, _startPos];
    };
    
    _armed params ["_armStatus", "_armTime", "_armDist", "_armAlt", "_armHeight"];
    
    _types params ["_clock", "_distance", "_proximity", "_delay", "_altitude", "_seeker"];
    _clock params ["_duration"];
    _distance params ["_distance"];
    _proximity params ["_proxDistance"];
    _delay params ["_delayTime"];
    _altitude params ["_burstHeight", "_above"];
    if(isNil "_seeker") then {_seeker = []};
    _seeker params ["_seekerObject", "_weapon", "_magazine", "_mode", "_aceMode", "_enabled", "_tracking", "_caged", "_slaves", "_launched", "_direction", "_lastReturnDir", "_lastReturnPos", "_sensorArray"];
    
    if(isNil "_armStatus" || {!_armStatus}) exitWith {
        _armStatus = false;
        if((_armTime > 0) then {
            if(time > _startTime + _armTime) then {
                _armed set [0, true];
            };
        } else {
            GVAR(fuzes) deleteAt _forEachIndex;
        };
    };

    private _pos = _object modelToWorldVisualWorld [0, 0, 0];
    private _detonate = false;

    switch (true) then {
        case ({_duration > 0} && {_time > (_startTime + _duration}): {
            _detonate = true;
        };
        case ({_distance > 0} && {_startPos distance _pos > _distance}): {
            _detonate = true;
        };
        case ({_proxDistance > 0} && {(_pos select 2) < _burstHeight}): {
            _detonate = true;
        };
        case ({_altitude > 0} && {_above} && {_pos select 2 > _altitude}): {
            _detonate = true;
        };
        case ({_altitude > 0} && {!_above} && {_pos select 2 < _altitude}): {
            _detonate = true;
        };
        case ({count _seeker > 0} && {!(_lastReturnDir isEqualTo [0, 0, 0])}): {
            _detonate = true;
        };
    
        case ({_delayTime > 0}): {
            private _velocity = velocity _object; 
            private _endPos = _pos vectorAdd (_velocity vectorMultiply (1.2*_deltaTime));
            private _ifIntersect = lineIntersects [_pos, _endPos, _object, objNull];
            if(_ifIntersect) then {
                private _intersectPos = ((lineIntersectsSurfaces [_pos, _endPos, _object, objNull]) select 0) select 0;;
                _object setPosASL (_intersectPos vectorAdd (_velocity vectorMultiply _delayTime));
                _detonate = true;
            };
        };
    };

    if(_detonate) then {
        triggerAmmo _object;
        GVAR(fuzes) deleteAt _forEachIndex;
    };
} forEach GVAR(fuzes);
*/





