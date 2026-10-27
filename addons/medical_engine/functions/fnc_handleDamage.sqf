#include "..\script_component.hpp"
/*
 * Author: commy2, kymckay, LinkIsGrim
 * HandleDamage EH where wound events are raised based on incoming damage.
 * Be aware that for each source of damage, the EH can fire multiple times (once for each hitpoint).
 * We store these incoming damages and compare them on last iteration of the event (_context == 2).
 *
 * Arguments:
 * Handle damage EH
 *
 * Return Value:
 * Damage to be inflicted (nil if not local) <NUMBER or NIL>
 *
 * Public: No
 */

#define INSTAKILL_ALLOWED(unit) (unit isNotEqualTo (unit getVariable [QGVAR(blockInstaKill), objNull]))

params ["_unit", "_selection", "_damage", "_shooter", "_ammo", "_hitPointIndex", "_instigator", "_hitpoint", "_directHit", "_context"];

// HD sometimes triggers for remote units - ignore.
if !(local _unit) exitWith {nil};

// Get missing meta info
private _oldDamage = 0;
private _structuralDamage = _context == 0;

if (_structuralDamage) then {
    _hitPoint = "#structural";
    _oldDamage = damage _unit;
} else {
    _oldDamage = _unit getHitIndex _hitPointIndex;
};

// Damage can be disabled with old variable or via sqf command allowDamage
if !(isDamageAllowed _unit && {_unit getVariable [QEGVAR(medical,allowDamage), true]}) exitWith {_oldDamage};

// HD keeps firing for dead units, e.g. for every hitpoint of every body near an explosion
private _alive = alive _unit;

// Killing units via End key is an edge case (#10375)
// This didn't matter pre-Arma 3 2.18 but now this goes through the event handler
// TODO: Structural fire damage >= 1 in a single damage event could still be caught here and we don't want that, but we haven't found a better way to catch this, fire damage should be small most of the time anyway
// Also triggers for catastrophic vehicle explosions which would kill crew outright, check for blocking
// Dead units can't be killed again, so they never take this exit and never need to block it below
private _newDamage = _damage - _oldDamage;
if (_alive && _structuralDamage && {(abs (_newDamage - 1)) < 0.001 && _ammo == "" && isNull _shooter && isNull _instigator} && {INSTAKILL_ALLOWED(_unit)}) exitWith {
    TRACE_1("unit killed by curator or engine",_unit);

    _damage
};

// _newDamage == 0 happens occasionally for vehiclehit events, just exit early to save some frametime
// context 4 is engine "bleeding". For us, it's just a duplicate event for #structural which we can ignore without any issues
// Leverage this to block insta-kills on the same frame (see above)
if (_context != 2 && (_context == 4 || _newDamage == 0)) exitWith {
    TRACE_4("Skipping engine bleeding or zero damage, blocking insta kills until next frame",_ammo,_newDamage,_directHit,_context);

    if (_alive && {INSTAKILL_ALLOWED(_unit)}) then {
        _unit setVariable [QGVAR(blockInstaKill), _unit];
        [{_this setVariable [QGVAR(blockInstaKill), nil]}, _unit] call CBA_fnc_execNextFrame;
    };

    _oldDamage
};

// These sources only need the structural callback. Avoid vehicle/config lookups for every hitpoint.
if (_structuralDamage && {
    // Drowning doesn't trigger _context=2 (LastHitPoint). Damage occurs in consistent increments.
    if (getOxygenRemaining _unit <= 0.5 && {_damage isEqualTo (_oldDamage + 0.005)}) exitWith {
        TRACE_5("Drowning",_unit,_shooter,_instigator,_damage,_newDamage);
        [QEGVAR(medical,woundReceived), [_unit, [[_newDamage, "Body", _newDamage]], _unit, "drowning"]] call CBA_fnc_localEvent;

        true
    };

    // Faster than (vehicle _unit), also handles dead units.
    private _vehicle = objectParent _unit;
    if (isNull _vehicle) exitWith {false};
    private _environmentDamage = _ammo == "";

    // Crashes don't trigger _context=2. The number of callbacks scales with crash intensity.
    // TODO: No way to detect if stationary and another vehicle hits you.
    if (EGVAR(medical,enableVehicleCrashes) && {_environmentDamage} && {vectorMagnitude (velocity _vehicle) > 5}) exitWith {
        TRACE_5("Crash",_unit,_shooter,_instigator,_damage,_newDamage);
        [QEGVAR(medical,woundReceived), [_unit, [[_newDamage, _hitPoint, _newDamage]], _unit, "vehiclecrash"]] call CBA_fnc_localEvent;

        true
    };

    // Explosive damage inside vehicles also doesn't trigger for each hitpoint.
    if (!_environmentDamage && {
        private _ammoCfg = configFile >> "CfgAmmo" >> _ammo;
        GET_NUMBER(_ammoCfg >> "explosive",0) > 0 ||
        {GET_NUMBER(_ammoCfg >> "indirectHit",0) > 0}
    }) exitWith {
        TRACE_5("Vehicle hit",_unit,_shooter,_instigator,_damage,_newDamage);

        _unit setVariable [QEGVAR(medical,lastDamageSource), _shooter];
        _unit setVariable [QEGVAR(medical,lastInstigator), _instigator];

        [QEGVAR(medical,woundReceived), [_unit, [[_newDamage, _hitPoint, _newDamage]], _shooter, "vehiclehit"]] call CBA_fnc_localEvent;

        true
    };

    false
}) exitWith {0};

// Only these hitpoints contribute to wound selection. An unused final hitpoint must still flush the event.
private _damageIndex = GVAR(hitPointIndexes) getOrDefault [toLowerANSI _hitPoint, -1];
if (_damageIndex == -1 && {_context != 2}) exitWith {
    [0, _oldDamage] select (_hitPoint in ["hithead", "hitbody", "hithands", "hitlegs"])
};

// Damages are stored for last iteration of the HandleDamage event (_context == 2)
// Store all hitpoints in one array instead of formatting and updating a separate object variable for each.
private _hitPointDamages = _unit getVariable [QGVAR(hitPointDamages), []];
if (_damageIndex != -1) then {
    if (_hitPointDamages isEqualTo []) then {
        _unit setVariable [QGVAR(hitPointDamages), _hitPointDamages];
    };
    TRACE_5("Received hit",_hitpoint,_ammo,_newDamage,_directHit,_context);

    _hitPointDamages set [_damageIndex, _newDamage];
};

// Ref https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#HandleDamage
// Context 2 means this is the last iteration of HandleDamage, so figure out which hitpoint took the most real damage and send wound event
// Don't exit, as the last iteration can be one of the hitpoints that we need to keep _oldDamage for
if (_context == 2) then {
    // Detach before dispatching woundReceived: a listener may synchronously cause another damage event.
    _unit setVariable [QGVAR(hitPointDamages), nil];

    _unit setVariable [QEGVAR(medical,lastDamageSource), _shooter];
    _unit setVariable [QEGVAR(medical,lastInstigator), _instigator];

    // Get armor value of every hitpoint at once and calculate damage before armor
    // We scale using passThrough to handle explosive-resistant armor properly (#9063)
    // We need realDamage to determine which limb was hit correctly
    private _armor = _unit call FUNC(getAllHitpointArmor);
    private _damages = [];
    {
        private _hitPointDamage = _hitPointDamages param [_forEachIndex, 0];
        _damages pushBack [_hitPointDamage * _x, _hitPointDamage];
    } forEach _armor;

    private _damageStructural = _damages select 11;

    // --- Head
    private _damageHead = [
        _damages select 0,
        _damages select 1,
        _damages select 2
    ];
    _damageHead sort false;
    _damageHead = _damageHead select 0;

    // --- Body
    private _damageBody = [
        _damages select 3,
        _damages select 4,
        _damages select 5,
        _damages select 6
        // HitBody removed as it's a placeholder hitpoint and the high armor value (1000) throws the calculations off
    ];
    _damageBody sort false;
    _damageBody = _damageBody select 0;

    // --- Arms and Legs
    private _damageLeftArm = _damages select 7;
    private _damageRightArm = _damages select 8;
    private _damageLeftLeg = _damages select 9;
    private _damageRightLeg = _damages select 10;

    // Find hit point that received the maximum damage
    // Priority used for sorting if incoming damage is equal
    // _realDamage, priority, _newDamage, body part name
    private _allDamages = [
        [_damageHead select 0,       PRIORITY_HEAD,       _damageHead select 1,       "Head"],
        [_damageBody select 0,       PRIORITY_BODY,       _damageBody select 1,       "Body"],
        [_damageLeftArm select 0,    PRIORITY_LEFT_ARM,   _damageLeftArm select 1,    "LeftArm"],
        [_damageRightArm select 0,   PRIORITY_RIGHT_ARM,  _damageRightArm select 1,   "RightArm"],
        [_damageLeftLeg select 0,    PRIORITY_LEFT_LEG,   _damageLeftLeg select 1,    "LeftLeg"],
        [_damageRightLeg select 0,   PRIORITY_RIGHT_LEG,  _damageRightLeg select 1,   "RightLeg"],
        [_damageStructural select 0, PRIORITY_STRUCTURAL, _damageStructural select 1, "#structural"]
    ];
    TRACE_2("incoming",_allDamages,_damageStructural);

    _allDamages sort false;
    _allDamages = _allDamages apply {[_x select 2, _x select 3, _x select 0]};

    // Environmental damage sources all have empty ammo string
    // No explicit source given, we infer from differences between them
    if (_ammo == "") then {
        // Any collision with terrain/vehicle/object has a shooter
        // Check this first because burning can happen at any velocity
        if (isNull _shooter) then {
            // Anything else is almost guaranteed to be fire damage
            _ammo = "fire";
            TRACE_5("Fire Damage",_unit,_shooter,_instigator,_damage,_allDamages);
        } else {
            /*
              If shooter != unit then they hit unit, otherwise it could be:
               - Unit hitting anything at speed
               - An empty vehicle hitting unit
               - A physX object hitting unit
               Assume fall damage for downward velocity because it's most common
            */
            if (_shooter == _unit && {(velocity _unit select 2) < -2}) then {
                _ammo = "falling";
                TRACE_5("Fall",_unit,_shooter,_instigator,_damage,_allDamages);
            } else {
                _ammo = "collision";
                TRACE_5("Collision",_unit,_shooter,_instigator,_damage,_allDamages);
            };
        };
    };

    // No wounds for minor damage
    // TODO check if this needs to be changed for burning damage (occurs as lots of small events that we add together)
    if ((_allDamages select 0 select 0) > 1E-3) then {
        TRACE_1("received",_allDamages);
        if (_alive) then {
            [QEGVAR(medical,woundReceived), [_unit, _allDamages, _shooter, _ammo]] call CBA_fnc_localEvent;
        } else {
            // Dead units don't need their wounds handled in the same frame, see FUNC(queueDeadUnitDamage)
            [_unit, _allDamages, _shooter, _ammo] call FUNC(queueDeadUnitDamage);
        };
    };
};

// Engine damage to these hitpoints controls blood visuals, limping, weapon sway
// Handled in fnc_damageBodyPart, persist here
// For all other hitpoints, we store our own damage values, so engine damage is unnecessary
[0, _oldDamage] select (_hitPoint in ["hithead", "hitbody", "hithands", "hitlegs"])
