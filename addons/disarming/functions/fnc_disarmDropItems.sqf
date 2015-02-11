#include "script_component.hpp"

#define TIME_MAX_WAIT 5
#define DUMMY_ITEM "ACE_DebugPotato"
#define UNIQUE_MAGAZINES ["ACE_key_customKeyMagazine"]

PARAMS_3(_caller,_target,_listOfItemsToRemove);
DEFAULT_PARAM(3,_doNotDropAmmo,false); //By default units drop all weapon mags when dropping a weapon

_fncSumArray = {
    _return = 0;
    {_return = _return + _x;} forEach (_this select 0);
    _return
};

//Sanity Check
if (_doNotDropAmmo && {({_x in _listOfItemsToRemove} count (magazines _target)) > 0}) exitWith {
    [_caller, _target, "magazines and _doNotDropAmmo error"] call FUNC(finishDisarmTarget);
};

_holder = objNull;
{
    if ((_x getVariable [QGVAR(disarmUnit), objNull]) == _target) exitWith {
        _holder = _x;
    };
} forEach ((getpos _target) nearObjects ["WeaponHolderSimulated", 3]);

if (isNull _holder) then {
    _dropPos = _target modelToWorld [-0.75, 0.75, 0];
    _dropPos set [2, 0];
    _holder = createVehicle ["WeaponHolderSimulated", _dropPos, [], 0, "CAN_COLLIDE"];
    _holder setVariable [QGVAR(disarmUnit), _target];
};

//Verify holder created
if (isNull _holder) exitWith {
    [_caller, _target, "Create Holder"] call FUNC(finishDisarmTarget);
};


//Remove Magazines
_targetMagazinesStart = magazinesAmmo _target;
_holderMagazinesStart = magazinesAmmoCargo _holder;

{
    EXPLODE_2_PVT(_x,_xClassname,_xAmmo);
    if ((_xClassname in _listOfItemsToRemove) && {!(_xClassname in UNIQUE_MAGAZINES)}) then {
        _holder addMagazineAmmoCargo [_xClassname, 1, _xAmmo];
        _target removeMagazine _xClassname;
    };
} forEach _targetMagazinesStart;

_targetMagazinesEnd = magazinesAmmo _target;
_holderMagazinesEnd = magazinesAmmoCargo _holder;

//Verify Mags dropped from unit:
if ( ({(_x select 0) in _listOfItemsToRemove} count _targetMagazinesEnd) != 0) exitWith {
    [_caller, _target, "Didn't Remove Magazines"] call FUNC(finishDisarmTarget);
};
//Verify holder has mags unit had (lazy count for now)
if (((count _targetMagazinesEnd) - (count _targetMagazinesStart)) != ((count _holderMagazinesEnd) - (count _holderMagazinesStart))) exitWith {
    [_caller, _target, "Crate Magazines"] call FUNC(finishDisarmTarget);
};


//Remove Items, Assigned Items and NVG
_holderItemsStart = getitemCargo _holder;
_targetItemsStart = ((assignedItems _target) + (items _target) + [hmd _target] + [headgear _target]);

_addToCrateClassnames = [];
_addToCrateCount = [];
{
    if (_x in _listOfItemsToRemove) then {
        if (_x in (items _target)) then {
            _target removeItem _x;
        } else {
            _target unlinkItem _x;
        };
        _index = _addToCrateClassnames find _x;
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

_holderItemsEnd = getitemCargo _holder;
_targetItemsEnd = ((assignedItems _target) + (items _target) + [hmd _target] + [headgear _target]);

//Verify Items Added (lazy count)
if (((count _targetItemsEnd) - (count _targetItemsStart)) != ([_addToCrateCount] call _fncSumArray)) exitWith {
    [_caller, _target, "Items Not Removed From Player"] call FUNC(finishDisarmTarget);
};
if ((([_holderItemsEnd select 1] call _fncSumArray) - ([_holderItemsStart select 1] call _fncSumArray)) != ([_addToCrateCount] call _fncSumArray)) exitWith {
    [_caller, _target, "Items Not Added to Holder"] call FUNC(finishDisarmTarget);
};


//If holder is still empty, it will be 'garbage collected' while we wait for the drop 'action' to take place
//So add a dummy item and just remove at the end
_holderIsEmpty = (([_holderItemsEnd select 1] call _fncSumArray) + (count _holderMagazinesEnd)) == 0;
if (_holderIsEmpty) then {
    systemChat "Empty: making dummy";
    _holder addItemCargoGlobal [DUMMY_ITEM, 1];
};

systemChat format ["PFEh start %1", time];
//Start the PFEH to do the actions (which could take >1 frame)
[{
    PARAMS_2(_args,_pfID);
    EXPLODE_8_PVT(_args,_caller,_target,_listOfItemsToRemove,_holder,_holderIsEmpty,_maxWaitTime,_doNotDropAmmo,_startingMagazines);

    _needToRemoveWeapon = ({_x in _listOfItemsToRemove} count (weapons _target)) > 0;
    _needToRemoveMagazines = ({_x in _listOfItemsToRemove} count (magazines _target)) > 0;
    _needToRemoveBackpack = ((backPack _target) != "") && {(backPack _target) in _listOfItemsToRemove};
    _needToRemoveVest = ((vest _target) != "") && {(vest _target) in _listOfItemsToRemove};
    _needToRemoveUniform = ((uniform _target) != "") && {(uniform _target) in _listOfItemsToRemove};

    // systemChat format ["%1 - (%2 %3 %4 %5)", time, _maxWaitTime, _needToRemoveWeapon, _needToRemoveMagazines, _needToRemoveBackpack];

    if ((time < _maxWaitTime) && {_needToRemoveWeapon || _needToRemoveMagazines || _needToRemoveBackpack}) then {
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
        systemChat format ["PFEh done %1", time];
        //Exit PFEH
        [_pfID] call CBA_fnc_removePerFrameHandler;


        if (_doNotDropAmmo) then {
            _error = false;

            _magsToPickup = +_startingMagazines;
            {
                _index = _magsToPickup find _x;
                if (_index == -1) exitWith {_error = true; ERROR("More mags than when we started?")};
                _magsToPickup deleteAt _index;
            } forEach (magazinesAmmo _target);

            _magazinesInHolder = magazinesAmmoCargo _holder;
            {
                _index = _magazinesInHolder find _x;
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
            [_caller, _target, "Holder should only have dummy item"] call FUNC(finishDisarmTarget);
        };
        if (_holderIsEmpty) then {
            systemChat "Debug: Deleting Dummy";
            clearItemCargoGlobal _holder;
        };

        //Verify we didn't timeout waiting on drop action
        if (time >= _maxWaitTime)  exitWith {
            [_caller, _target, "Drop Actions Timeout"] call FUNC(finishDisarmTarget);
        };

        if (_needToRemoveVest && {!((vestItems _target) isEqualTo [])}) exitWith {
            [_caller, _target, "Vest Not Empty"] call FUNC(finishDisarmTarget);
        };
        if (_needToRemoveVest) then {
            removeVest _target;
            _holder addItemCargoGlobal [(vest _target), 1];
        };
        if (_needToRemoveUniform && {!((uniformItems _target) isEqualTo [])}) exitWith {
            [_caller, _target, "Uniform Not Empty"] call FUNC(finishDisarmTarget);
        };
        if (_needToRemoveUniform) then {
            removeUniform _target;
            _holder addItemCargoGlobal [(uniform _target), 1];
        };

        [_caller, _target, "Victory"] call FUNC(finishDisarmTarget);
    };

}, 0.0, [_caller,_target, _listOfItemsToRemove, _holder, _holderIsEmpty, (time + TIME_MAX_WAIT), _doNotDropAmmo, _targetMagazinesEnd]] call CBA_fnc_addPerFrameHandler;
