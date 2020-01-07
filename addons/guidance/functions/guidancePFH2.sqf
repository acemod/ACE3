//Returns absolute direction from seeker
private _seekerTargetDir = [_projectile, _seekerType, _targetInfo] call FUNC(runSeekerSearch);

//Provides absolute coordinate direct line vector to next point in flight path
private _guidanceVector = [_projectile, _seekerTargetDir, _profileVars] call FUNC(runGuidanceInput);

//changes projectileVars to follow best flight path
private _projectileAdjustments = [_projectile, _guidanceVector, _projectileVars] call FUNC (runProjectileAdjust);

_projectileAdjustments params ["_adjustX", "_adjustY"];




private _frontDragCoeff = 0.4;
private _sideDragCoeff = 0.7;

//expressed in -1 to 1 of max deflection;




_projectileVars set [3, (_projectileFinsMax min (_projectileFinsX + ( (abs(_adjustX)/_adjustX) * ( (_projectileFinsInc * _runtimeDelta) min abs(_adjustX)) ) )) max _projectileFinsMin];  
_projectileVars set [4, (_projectileFinsMax min (_projectileFinsY + ( (abs(_adjustY)/_adjustY) * ( (_projectileFinsInc * _runtimeDelta) min abs(_adjustY)) ) )) max _projectileFinsMin]];  




// F_drag = C_d * Area * (1.285 * |V|^2)/2

// accel = F_drag/mass

// airFriction = accel / speed^2 

//need countertorque for side slippage;
_projectileVec = vectorDir _projectile;
_projectileVel = velocity _projectile;



_projectileDir = (atan2(_projectileVec select 0, _projectileVec select 1) + 360) % 360;
_projectilePitch = atan2(sqrt((_projectileVec select 0)^2 + (_projectileVec select 1)^2),_projectileVec select 2);

_velocityDir = (atan2(_projectileVel select 0, _projectileVel select 1) + 360) % 360;
_velocityPitch = atan2(sqrt((_projectileVel select 0)^2 + (_projectileVel select 1)^2),_projectileVel select 2);

_dirDiff = _velocityDir - _projectileDir;
_pitchDiff = _velocityPitch - _projectilePitch;

//need side/top values
private _area = (_frontArea * cos(_dirDiff) * cos(_pitchDiff)) + (_sideArea * cos(_pitchDiff) * sin(_dirDiff)) + (_topArea * sin(_pitchDiff));
private _dragCoeff = ((cos(_dirDiff) * cos(_pitchDiff)) * _frontDragCoeff) + ((1-(cos(_dirDiff) * cos(_pitchDiff))) * _sideDragCoeff);


_airFriction = getNumber (configFile >> "CfgAmmo" >> _ammo >> "airFriction");
private _projectileSpeed = vectorMagnitude _projectileVel;

private _mass = _dragCoeff * _area * 1.285 / (2 * _airFriction)
private _dragForce = _dragCoeff * _area * (_projectileSpeed^2) * 1.285/2;

//length linearly (0 being front, 1 being back) where the center of mass is;
private _projectileCOM = 0.5

//lists linearly (0 being front 1 being back) where a set of fins are;
private _finSets = [0.8];
//respective list of size of fin surface (as scalar value of _sideArea)
private _finCoeffs = [0.2];

_projectileBodyTorqueX = ((1-(_projectileCOM)) - (_projectileCOM)) * sin(_dirDiff) * cos(_pitchDiff) * _dragForce; 
_projectileBodyTorqueY = ((1-(_projectileCOM)) - (_projectileCOM)) * sin(_pitchDiff) * _dragForce;


_projectileFinTorqueX = 0;
_projectileFinTorqueY = 0;
_projectileFinTorqueZ = 0;

{
    private _index = _finSets find _x;
    _projectileFinTorqueX = _projectileFinTorqueX + (((_finSets select _index) - (_projectileCOM)) * sin(_projectileFinsX - _dirDiff) * cos(_projectileFinsY - _pitchDiff) * (_finCoeffs select _index));
    _projectileFinTorqueY = _projectileFinTorqueY + (((_finSets select _index) - (_projectileCOM)) * sin(_projectileFinsY - _pitchDiff) * (_finCoeffs select _index));
}
forEach _finSets;

_momentOfInertiaX = _mass * (_projectileCOM) * (1-(_projectileCOM)) * (0.25));
_momentOfInertiaY = _momentOfInertiaX;
//rough approx of missile face from bounding box
_momentOfInertiaZ = _mass * (_frontArea / 2)/2;

_projectileRotAccX = (_projectileFinTorqueX + _projectileBodyTorqueX)/_momentOfInertiaX;
_projectileRotAccY = (_projectileFinTorqueY + _projectileBodyTorqueY)/_momentOfInertiaY;
















private _minDeflection = ((_flightParams select 0) - ((_flightParams select 0) * _adjustTime)) max 0;
private _maxDeflection = (_flightParams select 1) * _adjustTime;
// private _incDeflection = _flightParams select 2; // todo


// Run seeker function:
private _seekerTargetPos = [[0,0,0], _args, _seekerStateParams, _lastKnownPosState] call FUNC(doSeekerSearch);

// Run attack profile function:
private _profileAdjustedTargetPos = [_seekerTargetPos, _args, _attackProfileStateParams] call FUNC(doAttackProfile);

// If we have no seeker target, then do not change anything
if (!(_profileAdjustedTargetPos isEqualTo [0,0,0])) then {

    private _targetVector = _projectilePos vectorFromTo _profileAdjustedTargetPos;
    private _adjustVector = _targetVector vectorDiff (vectorDir _projectile);
    _adjustVector params ["_adjustVectorX", "_adjustVectorY", "_adjustVectorZ"];

    private _yaw = 0;
    private _pitch = 0;
    private _roll = 0;

    if (_adjustVectorX < 0) then {
        _yaw = - ( (_minDeflection max ((abs _adjustVectorX) min _maxDeflection) ) );
    } else {
        if (_adjustVectorX > 0) then {
            _yaw = ( (_minDeflection max (_adjustVectorX min _maxDeflection) ) );
        };
    };
    if (_adjustVectorY < 0) then {
        _roll = - ( (_minDeflection max ((abs _adjustVectorY) min _maxDeflection) ) );
    } else {
        if (_adjustVectorY > 0) then {
            _roll = ( (_minDeflection max (_adjustVectorY min _maxDeflection) ) );
        };
    };
    if (_adjustVectorZ < 0) then {
        _pitch = - ( (_minDeflection max ((abs _adjustVectorZ) min _maxDeflection) ) );
    } else {
        if (_adjustVectorZ > 0) then {
            _pitch = ( (_minDeflection max (_adjustVectorZ min _maxDeflection) ) );
        };
    };
    private _finalAdjustVector = [_yaw, _roll, _pitch];

    TRACE_3("", _pitch, _yaw, _roll);
    TRACE_3("", _targetVector, _adjustVector, _finalAdjustVector);

    if (accTime > 0) then {
        private _changeVector = (vectorDir _projectile) vectorAdd _finalAdjustVector;
        TRACE_2("",_projectile,_changeVector);
        [_projectile, _changeVector] call FUNC(changeMissileDirection);
    };
};

#ifdef DRAW_GUIDANCE_INFO
TRACE_3("",_projectilePos,_seekerTargetPos,_profileAdjustedTargetPos);
drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,0,1], ASLtoAGL _projectilePos, 0.75, 0.75, 0, _ammo, 1, 0.025, "TahomaB"];

private _ps = "#particlesource" createVehicleLocal (ASLtoAGL _projectilePos);
_PS setParticleParams [["\A3\Data_f\cl_basic", 8, 3, 1], "", "Billboard", 1, 3.0141, [0, 0, 2], [0, 0, 0], 1, 1.275, 1, 0, [1, 1], [[1, 0, 0, 1], [1, 0, 0, 1], [1, 0, 0, 1]], [1], 1, 0, "", "", nil];
_PS setDropInterval 3.0;
#endif

_stateParams set [0, diag_tickTime];

END_COUNTER(guidancePFH);

