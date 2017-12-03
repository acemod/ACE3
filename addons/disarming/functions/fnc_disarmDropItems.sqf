/*
 * Author: PabstMirror
 *
 * Makes a unit drop items
 *
 * Arguments:
 * 0: Caller (player) <OBJECT>
 * 1: Target <OBJECT>
 * 2: Classnames <ARRAY>
 * 3: Do Not Drop Ammo <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorTarget, ["ace_bandage"]] call ace_disarming_fnc_disarmDropItems
 *
 * Public: No
 */
#include "script_component.hpp"

#define TIME_MAX_WAIT 5

params ["_caller", "_target", "_listOfItemsToRemove", ["_doNotDropAmmo", false, [false]]]; //By default units drop all weapon mags when dropping a weapon

private _fncSumArray = {
    private _return = 0;
    {_return = _return + _x;} count (_this select 0);
    _return
};

//Sanity Checks
if (!([_target] call FUNC(canBeDisarmed))) exitWith {
    [_caller, _target, "Debug: Cannot disarm target"] call FUNC(eventTargetFinish);
};
if (_doNotDropAmmo && {({_x in _listOfItemsToRemove} count (magazines _target)) > 0}) exitWith {
    [_caller, _target, "Debug: Trying to drop magazine with _doNotDropAmmo flag"] call FUNC(eventTargetFinish);
};

private _holder = objNull;

//If not dropping ammo, don't use an existing container
if (!_doNotDropAmmo) then {
    {
        if ((_x getVariable [QGVAR(disarmUnit), objNull]) == _target) exitWith {
            _holder = _x;
        };
    } count ((getpos _target) nearObjects [DISARM_CONTAINER, 3]);
};

//Create a new weapon holder
if (isNull _holder) then {
    private _dropPos = _target modelToWorld [0.4, 0.75, 0]; //offset someone unconscious isn't lying over it
    _dropPos set [2, ((getPosASL _target) select 2)];
    _holder = createVehicle [DISARM_CONTAINER, _dropPos, [], 0, "CAN_COLLIDE"];
    _holder setPosASL _dropPos;
    _holder setVariable [QGVAR(disarmUnit), _target, true];
};

//Verify holder created
if (isNull _holder) exitWith {
    [_caller, _target, "Debug: Null Holder"] call FUNC(eventTargetFinish);
};
//Make sure only one drop operation at a time (using PFEH system as a queue)
if (_holder getVariable [QGVAR(holderInUse), false]) exitWith {
    [{
        _this call FUNC(disarmDropItems);
    }, _this] call CBA_fnc_execNextFrame;
};
_holder setVariable [QGVAR(holderInUse), true];


//Remove Magazines
private _targetMagazinesStart = magazinesAmmo _target;
private _holderMagazinesStart = magazinesAmmoCargo _holder;

{
    _x params ["_xClassname", "_xAmmo"];
    if ((_xClassname in _listOfItemsToRemove) && {(getNumber (configFile >> "CfgMagazines" >> _xClassname >> "ACE_isUnique")) == 0}) then {
        _holder addMagazineAmmoCargo [_xClassname, 1, _xAmmo];
        _target removeMagazine _xClassname;
    };
} forEach _targetMagazinesStart;

private _targetMagazinesEnd = magazinesAmmo _target;
private _holderMagazinesEnd = magazinesAmmoCargo _holder;

//Verify Mags dropped from unit:
if (({((_x select 0) in _listOfItemsToRemove) && {(getNumber (configFile >> "CfgMagazines" >> (_x select 0) >> "ACE_isUnique")) == 0}} count _targetMagazinesEnd) != 0) exitWith {
    _holder setVariable [QGVAR(holderInUse), false];
    [_caller, _target, "Debug: Didn't Remove Magazines"] call FUNC(eventTargetFinish);
};
//Verify holder has mags unit had
if (!([_targetMagazinesStart, _targetMagazinesEnd, _holderMagazinesStart, _holderMagazinesEnd] call FUNC(verifyMagazinesMoved))) then {
    ERR = [_targetMagazinesStart, _targetMagazinesEnd, _holderMagazinesStart, _holderMagazinesEnd];
    _holder setVariable [QGVAR(holderInUse), false];
    [_caller, _target, "Debug: Crate Magazines not in holder"] call FUNC(eventTargetFinish);
};

//Remove Items, Assigned Items and NVG
private _holderItemsStart = getitemCargo _holder;
private _targetItemsStart = (assignedItems _target) + (items _target) - (weapons _target);
if ((headgear _target) != "") then {_targetItemsStart pushBack (headgear _target);};
if ((goggles _target) != "") then {_targetItemsStart pushBack (goggles _target);};


private _addToCrateClassnames = [];
private _addToCrateCount = [];
{
    if (_x in _listOfItemsToRemove) then {
        if (_x in (items _target)) then {
            _target removeItem _x;
        } else {
            _target unlinkItem _x;
        };
        private _index = _addToCrateClassnames find _x;
        if (_index != -1) then {
            _addToCrateCount set [_index, ((_addToCrateCount select _index) + 1)];
        } else {
            _addToCrateClassnames pushBack _x;
            _addToCrateCount pushBack 1;
        };
    };
} forEach _targetItemsStart;

//Add the items to the holder (combined to reduce addItemCargoGlobal calls)
{
    _holder addItemCargoGlobal [(_addToCrateClassnames select _forEachIndex), (_addToCrateCount select _forEachIndex)];
} forEach _addToCrateClassnames;

private _holderItemsEnd = getitemCargo _holder;
private _targetItemsEnd = (assignedItems _target) + (items _target) - (weapons _target);
if ((headgear _target) != "") then {_targetItemsEnd pushBack (headgear _target);};
if ((goggles _target) != "") then {_targetItemsEnd pushBack (goggles _target);};

//Verify Items Added
if (((count _targetItemsStart) - (count _targetItemsEnd)) != ([_addToCrateCount] call _fncSumArray)) exitWith {
    _holder setVariable [QGVAR(holderInUse), false];
    [_caller, _target, "Debug: Items Not Removed From Player"] call FUNC(eventTargetFinish);
};
if ((([_holderItemsEnd select 1] call _fncSumArray) - ([_holderItemsStart select 1] call _fncSumArray)) != ([_addToCrateCount] call _fncSumArray)) exitWith {
    _holder setVariable [QGVAR(holderInUse), false];
    [_caller, _target, "Debug: Items Not Added to Holder"] call FUNC(eventTargetFinish);
};

//Script drop uniforms/vest if empty
if (((uniform _target) != "") && {(uniform _target) in _listOfItemsToRemove} && {(uniformItems _target) isEqualTo []}) then {
    _holder addItemCargoGlobal [(uniform _target), 1];
    removeUniform _target;
};
if (((vest _target) != "") && {(vest _target) in _listOfItemsToRemove} && {(vestItems _target) isEqualTo []}) then {
    _holder addItemCargoGlobal [(vest _target), 1];
    removeVest _target;
};


//If holder is still empty, it will be 'garbage collected' while we wait for the drop 'action' to take place
//So add a dummy item and just remove at the end
private _holderIsEmpty = ([_holder] call FUNC(getAllGearContainer)) isEqualTo [[],[]];
if (_holderIsEmpty) then {
    TRACE_1("Debug: adding dummy item to holder",_holder);
    _holder addItemCargoGlobal [DUMMY_ITEM, 1];
};

//Start the PFEH to do the actions (which could take >1 frame)
[{
    params ["_args", "_pfID"];
    _args params ["_caller", "_target", "_listOfItemsToRemove", "_holder", "_holderIsEmpty", "_maxWaitTime", "_doNotDropAmmo", "_startingMagazines"];

    private _needToRemoveWeapon = ({_x in _listOfItemsToRemove} count (weapons _target)) > 0;
    private _needToRemoveMagazines = ({_x in _listOfItemsToRemove} count (magazines _target)) > 0;
    private _needToRemoveBackpack = ((backPack _target) != "") && {(backPack _target) in _listOfItemsToRemove};
    private _needToRemoveVest = ((vest _target) != "") && {(vest _target) in _listOfItemsToRemove};
    private _needToRemoveUniform = ((uniform _target) != "") && {(uniform _target) in _listOfItemsToRemove};

    if ((CBA_missionTime < _maxWaitTime) && {[_target] call FUNC(canBeDisarmed)} && {_needToRemoveWeapon || _needToRemoveMagazines || _needToRemoveBackpack}) then {
        //action drop weapons (keeps loaded magazine and attachements)
        {
            if (_x in _listOfItemsToRemove) then {
                _target action ["DropWeapon", _holder, _x];
            };
        } forEach (weapons _target);

        //Drop magazine (keeps unique ID)
        {
            if (_x in _listOfItemsToRemove) then {
                _target action ["DropMagazine", _holder, _x];
            };
        } forEach (magazines _target);

        //Drop backpack (Keeps variables for ACRE/TFR)
        if (_needToRemoveBackpack) then {_target action ["DropBag", _holder, (backPack _target)];};
    } else {
        [_pfID] call CBA_fnc_removePerFrameHandler;

        if (_doNotDropAmmo) then {
            private _error = false;

            private _magsToPickup = +_startingMagazines;
            {
                private _index = _magsToPickup find _x;
                if (_index == -1) exitWith {_error = true; ERROR("More mags than when we started?")};
                _magsToPickup deleteAt _index;
            } forEach (magazinesAmmo _target);

            private _magazinesInHolder = magazinesAmmoCargo _holder;
            {
                private _index = _magazinesInHolder find _x;
                if (_index == -1) exitWith {_error = true; ERROR("Missing mag not in holder")};
                _magazinesInHolder deleteAt _index;
            } forEach _magsToPickup;

            //No Error (all the ammo in the container is ammo we should have);
            if ((!_error) && {_magazinesInHolder isEqualTo []}) then {
                {
                    _target addMagazine _x;
                } forEach (magazinesAmmoCargo _holder);
                clearMagazineCargoGlobal _holder;
            };
        };

        //If we added a dummy item, remove it now
        if (_holderIsEmpty && {!((getItemCargo _holder) isEqualTo [[DUMMY_ITEM],[1]])}) exitWith {
            _holder setVariable [QGVAR(holderInUse), false];
            [_caller, _target, "Debug: Holder should only have dummy item"] call FUNC(eventTargetFinish);
        };
        if (_holderIsEmpty) then {
            TRACE_1("Debug: removing dummy item from holder",_holder);
            clearItemCargoGlobal _holder;
        };
        //Verify we didn't timeout waiting on drop action
        if (CBA_missionTime >= _maxWaitTime)  exitWith {
            _holder setVariable [QGVAR(holderInUse), false];
            [_caller, _target, "Debug: Drop Actions Timeout"] call FUNC(eventTargetFinish);
        };
        //If target lost disarm status:
        if (!([_target] call FUNC(canBeDisarmed))) exitWith {
            _holder setVariable [QGVAR(holderInUse), false];
            [_caller, _target, "Debug: Target cannot be disarmed"] call FUNC(eventTargetFinish);
        };
        if (_needToRemoveVest && {!((vestItems _target) isEqualTo [])}) exitWith {
            _holder setVariable [QGVAR(holderInUse), false];
            [_caller, _target, "Debug: Vest Not Empty"] call FUNC(eventTargetFinish);
        };
        if (_needToRemoveVest) then {
            _holder addItemCargoGlobal [(vest _target), 1];
            removeVest _target;
        };
        if (_needToRemoveUniform && {!((uniformItems _target) isEqualTo [])}) exitWith {
            _holder setVariable [QGVAR(holderInUse), false];
            [_caller, _target, "Debug: Uniform Not Empty"] call FUNC(eventTargetFinish);
        };
        if (_needToRemoveUniform) then {
            _holder addItemCargoGlobal [(uniform _target), 1];
            removeUniform _target;
        };

        _holder setVariable [QGVAR(holderInUse), false];
        [_caller, _target, ""] call FUNC(eventTargetFinish);
    };

}, 0.0, [_caller,_target, _listOfItemsToRemove, _holder, _holderIsEmpty, (CBA_missionTime + TIME_MAX_WAIT), _doNotDropAmmo, _targetMagazinesEnd]] call CBA_fnc_addPerFrameHandler;
