#include "script_component.hpp"


["bft_itemCreated", FUNC(handleItemCreated)] call EFUNC(common,addEventHandler);
["bft_addDeviceData", FUNC(handleAddDeviceData)] call EFUNC(common,addEventHandler);
["bft_updateDeviceOwner", FUNC(handleUpdateDeviceOwner)] call EFUNC(common,addEventHandler);

["playerInventoryChanged", FUNC(validateInventory)] call EFUNC(common,addEventHandler);
["playerChanged", FUNC(validateInventory)] call EFUNC(common,addEventHandler);

[{
    _newData = [];
    {
        if !(isNull(_x select 5)) then {
            _displayData = _x call FUNC(deviceDataToMapData);
            if (count _displayData > 0) then {
                _newData pushback _displayData;
            };
        };
    }foreach GVAR(deviceData);
    GVAR(availableDevices) = _newData;

}, 5, []] call cba_fnc_addPerFrameHandler;


// Here for debug purpose until we have an interface implemented
private "_fnc";
_fnc = {
    private ["_args","_idd","_idc"];
    _args = _this select 0;
    _idd = _args select 0;
    _idc = _args select 1;

    if (!isNull (findDisplay _idd)) then {
        (findDisplay _idd displayCtrl _idc) ctrlAddEventhandler (_args select 2);

        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };
};

{
    [_fnc, 0, _x] call CBA_fnc_addPerFrameHandler;
} forEach [[12,51,["Draw",{
    _ctrl = _this select 0;
    {
        _ctrl drawIcon [_x select 2, [1,1,1,1], _x select 4, 30, 30, 0, _x select 1, 0, 0.05, 'PuristaMedium', 'right'];
    }foreach GVAR(availableDevices);

}]]];