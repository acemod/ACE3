/**
 * CSE fnc HandleFired DEFLECT.
 * Handles wind deflection for projectiles.
 * Is expected to be triggered by the fired eventhandler from BI.
 *
 * Params:
 *   1. unit: Object - Object the event handler is assigned to
 *   2. weapon: String - Fired weapon
 *   3. muzzle: String - Muzzle that was used
 *   4. mode: String - Current mode of the fired weapon
 *   5. ammo: String - Ammo used
 *   6. magazine: String - magazine name which was used
 *   7. projectile: Object - Object of the projectile that was shot (Arma 2: OA and onwards)
 *
 * Author: Glowbal, Ruthberg
 *
 */

if (isNil "CSE_DISABLE_HANDLE_DEFLECTION") then { CSE_DISABLE_HANDLE_DEFLECTION = false; };
if (CSE_DISABLE_HANDLE_DEFLECTION) exitWith { true };

private ["_unit", "_weapon", "_ammo", "_bullet", "_airFriction", "_index"];
_unit = _this select 0;

if (!CSE_WIND_DEFLECTION_EFFECT_AI_BB && !(isPlayer _unit)) exitWith {};
if (cse_AB_WindEnabled && (gunner _unit) getVariable ["cse_enabled_AdvancedBallistics", false]) exitWith {};

_bullet = _this select 5;
if (!isClass (configFile >> 'CfgPatches' >> 'CBA_main')) then {
	_bullet = _this select 6; // with CBA magazine and projectile are reverted
};

if ((CSE_WIND_DEFLECTION_ALLOW_NON_LOCAL_BB || local _unit) && (_bullet isKindOf "BulletBase")) then {
	_weapon = _this select 1;
	_ammo   = _this select 4;

	_airFriction = getNumber(configFile >> "cfgAmmo" >> _ammo >> "airFriction");

	_index = count cse_basicBallistics_bulletDatabase;
	if (count cse_basicBallistics_bulletDatabaseFreeIndices > 0) then {
		_index = cse_basicBallistics_bulletDatabaseFreeIndices select 0;
		cse_basicBallistics_bulletDatabaseFreeIndices = cse_basicBallistics_bulletDatabaseFreeIndices - [_index];
	};

	cse_basicBallistics_bulletDatabase          set[_index, [_bullet, _airFriction, _index]];
	cse_basicBallistics_bulletDatabaseLastFrame set[_index, time];

	cse_basicBallistics_bulletDatabaseOccupiedIndices pushBack _index;

	if (count cse_basicBallistics_bulletDatabaseOccupiedIndices == 1) then {
		["basicBallistics", "onEachFrame", {
			private ["_bullet", "_airFriction", "_index", "_deltaT", "_bulletVelocity", "_bulletSpeed", "_trueVelocity", "_trueVelocity", "_dragRef", "_drag", "_accelRef", "_accel"];

			{
				_bullet = (cse_basicBallistics_bulletDatabase select _x) select 0;
				_index  = (cse_basicBallistics_bulletDatabase select _x) select 2;
				if (!alive _bullet) then {
					cse_basicBallistics_bulletDatabaseOccupiedIndices = cse_basicBallistics_bulletDatabaseOccupiedIndices - [_index];
					cse_basicBallistics_bulletDatabaseFreeIndices pushBack _index;
				};
			} forEach cse_basicBallistics_bulletDatabaseOccupiedIndices;

			if (count cse_basicBallistics_bulletDatabaseOccupiedIndices == 0) exitWith {
				/// Resetting all the variables.
				cse_basicBallistics_bulletDatabase = [];
				cse_basicBallistics_bulletDatabaseLastFrame = [];
				cse_basicBallistics_bulletDatabaseOccupiedIndices = [];
				cse_basicBallistics_bulletDatabaseFreeIndices = [];
				["basicBallistics", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
			};

			{
				_bullet      = (cse_basicBallistics_bulletDatabase select _x) select 0;
				_airFriction = (cse_basicBallistics_bulletDatabase select _x) select 1;
				_index       = (cse_basicBallistics_bulletDatabase select _x) select 2;

				_deltaT = time - (cse_basicBallistics_bulletDatabaseLastFrame select _index);
				cse_basicBallistics_bulletDatabaseLastFrame set[_index, time];

				_bulletVelocity = velocity _bullet;
				_bulletSpeed = vectorMagnitude _bulletVelocity;

				if (vectorMagnitude wind > 0) then {
					_trueVelocity = _bulletVelocity vectorDiff wind;
					_trueSpeed = vectorMagnitude _trueVelocity;

					_dragRef = _deltaT * _airFriction * _bulletSpeed * _bulletSpeed;
					_accelRef = (vectorNormalized _bulletVelocity) vectorMultiply (_dragRef);
					_bulletVelocity = _bulletVelocity vectorDiff _accelRef;

					_drag = _deltaT * _airFriction * _trueSpeed * _trueSpeed;
					_accel = (vectorNormalized _trueVelocity) vectorMultiply (_drag);
					_bulletVelocity = _bulletVelocity vectorAdd _accel;
				};

				_bullet setVelocity _bulletVelocity;
			} forEach cse_basicBallistics_bulletDatabaseOccupiedIndices;

		}] call BIS_fnc_addStackedEventHandler;
	};
};
true;