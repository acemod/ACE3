#include "..\script_component.hpp"
/*
 * Author: Glowbal, KoffeinFlummi, mharis001
 * Starts the treatment process.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 * 3: Treatment <STRING>
 *
 * Return Value:
 * Treatment Started <BOOL> or <NIL> if cursor menu is open
 *
 * Example:
 * [player, cursorObject, "Head", "BasicBandage"] call ace_medical_treatment_fnc_treatment
 *
 * Public: No
 */

params ["_medic", "_patient", "_bodyPart", "_classname"];

// Delay by a frame if cursor menu is open to prevent progress bar failing
if (uiNamespace getVariable [QEGVAR(interact_menu,cursorMenuOpened), false]) exitWith {
    [FUNC(treatment), _this] call CBA_fnc_execNextFrame;
    nil
};

if !(call FUNC(canTreat)) exitWith {false};

private _config = configFile >> QGVAR(actions) >> _classname;

// Get treatment time from config, exit if treatment time is zero
private _medicRequiredLevel = GET_NUMBER_ENTRY(_config >> "medicRequired");
private _treatmentTimeConfig = ["treatmentTime", "treatmentTimeTrained"] select (([_medic, (_medicRequiredLevel + 1)] call FUNC(isMedic)) && {!isNull (_config >> "treatmentTimeTrained")});
private _treatmentTime = if (isText (_config >> _treatmentTimeConfig)) then {
    GET_FUNCTION(_treatmentTime,_config >> _treatmentTimeConfig);

    if (_treatmentTime isEqualType {}) then {
        _treatmentTime = call _treatmentTime;
    };

    _treatmentTime
} else {
    getNumber (_config >> _treatmentTimeConfig);
};

if (_treatmentTime == 0) exitWith {false};

// Consume one of the treatment items if needed
// Store item user so that used item can be returned on failure
private _userAndItem = if (GET_NUMBER_ENTRY(_config >> "consumeItem") == 1) then {
    [_medic, _patient, getArray (_config >> "items")] call FUNC(useItem);
} else {
    [objNull, "", false]; // Treatment does not require items to be consumed
};

_userAndItem params ["_itemUser", "_usedItem", "_createLitter"];

private _isInZeus = !isNull findDisplay 312;

if (_medic isNotEqualTo player || {!_isInZeus}) then {
    // Get treatment animation for the medic
    private _medicAnim = if (_medic isEqualTo _patient) then {
        getText (_config >> ["animationMedicSelf", "animationMedicSelfProne"] select (stance _medic == "PRONE"));
    } else {
        getText (_config >> ["animationMedic", "animationMedicProne"] select (stance _medic == "PRONE"));
    };

    _medic setVariable [QGVAR(selectedWeaponOnTreatment), weaponState _medic];

    // Adjust animation based on the current weapon of the medic
    private _wpn = ["non", "rfl", "lnr", "pst"] param [["", primaryWeapon _medic, secondaryWeapon _medic, handgunWeapon _medic] find currentWeapon _medic, "non"];
    _medicAnim = [_medicAnim, "[wpn]", _wpn] call CBA_fnc_replace;

    // This animation is missing, use alternative
    if (_medicAnim == "AinvPknlMstpSlayWlnrDnon_medic") then {
        _medicAnim = "AinvPknlMstpSlayWlnrDnon_medicOther";
    };

    // Determine the animation length
    private _animDuration = GVAR(animDurations) get toLowerANSI _medicAnim;
    if (isNil "_animDuration") then {
        if (_medicAnim != "") then { WARNING_2("animation [%1] for [%2] has no duration defined",_medicAnim,_classname); };
        _animDuration = 10;
    };

    // These animations have transitions that take a bit longer...
    if (weaponLowered _medic) then {
        _animDuration = _animDuration + 0.5;

        // Fix problems with lowered weapon transitions by raising the weapon first
        if (currentWeapon _medic != "" && {_medicAnim != ""}) then {
            _medic action ["WeaponInHand", _medic];
        };
    };

    if (binocular _medic != "" && {binocular _medic == currentWeapon _medic}) then {
        _animDuration = _animDuration + 1;
    };

    // Play treatment animation for medic and determine the ending animation
    if (isNull objectParent _medic && {_medicAnim != ""}) then {
        // Speed up animation based on treatment time (but cap max to prevent odd animiations/cam shake)
        private _animRatio = _animDuration / _treatmentTime;
        TRACE_3("setAnimSpeedCoef",_animRatio,_animDuration,_treatmentTime);

        // Don't slow down animation too much to prevent it looking funny.
        if (_animRatio < ANIMATION_SPEED_MIN_COEFFICIENT) then {
            _animRatio = ANIMATION_SPEED_MIN_COEFFICIENT;
        };

        // Skip animation enitrely if progress bar too quick.
        if (_animRatio > ANIMATION_SPEED_MAX_COEFFICIENT) exitWith {};

        [QEGVAR(common,setAnimSpeedCoef), [_medic, _animRatio]] call CBA_fnc_globalEvent;

        // Play animation
        private _endInAnim = "AmovP[pos]MstpS[stn]W[wpn]Dnon";

        private _pos = ["knl", "pne"] select (stance _medic == "PRONE");
        private _stn = "non";

        if (_wpn != "non") then {
            _stn = ["ras", "low"] select (weaponLowered _medic);
        };

        _endInAnim = [_endInAnim, "[pos]", _pos] call CBA_fnc_replace;
        _endInAnim = [_endInAnim, "[stn]", _stn] call CBA_fnc_replace;
        _endInAnim = [_endInAnim, "[wpn]", _wpn] call CBA_fnc_replace;

        [_medic, _medicAnim] call EFUNC(common,doAnimation);
        [_medic, _endInAnim] call EFUNC(common,doAnimation);
        _medic setVariable [QGVAR(endInAnim), _endInAnim];

        if (!isNil QEGVAR(advanced_fatigue,setAnimExclusions)) then {
            EGVAR(advanced_fatigue,setAnimExclusions) pushBack QUOTE(ADDON);
        };
    };

    // Play a random treatment sound globally if defined
    private _soundsConfig = _config >> "sounds";

    if (isArray _soundsConfig) then {
        (selectRandom (getArray _soundsConfig)) params ["_file", ["_volume", 1], ["_pitch", 1], ["_distance", 10]];
        playSound3D [_file, objNull, false, getPosASL _medic, _volume, _pitch, _distance];
    };
};

if (_isInZeus) then {
    _treatmentTime = _treatmentTime * GVAR(treatmentTimeCoeffZeus);
};

GET_FUNCTION(_callbackStart,_config >> "callbackStart");
GET_FUNCTION(_callbackProgress,_config >> "callbackProgress");

if (_callbackProgress isEqualTo {}) then {
    _callbackProgress = {true};
};

[_medic, _patient, _bodyPart, _classname, _itemUser, _usedItem, _createLitter] call _callbackStart;

["ace_treatmentStarted", [_medic, _patient, _bodyPart, _classname, _itemUser, _usedItem, _createLitter]] call CBA_fnc_localEvent;

[
    _treatmentTime,
    [_medic, _patient, _bodyPart, _classname, _itemUser, _usedItem, _createLitter],
    FUNC(treatmentSuccess),
    FUNC(treatmentFailure),
    getText (_config >> "displayNameProgress"),
    _callbackProgress,
    ["isNotInside", "isNotSwimming", "isNotInZeus"]
] call EFUNC(common,progressBar);

true
