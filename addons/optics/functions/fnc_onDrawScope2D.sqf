// by commy2
#include "script_component.hpp"

disableSerialization;

private "_display";

_display = _this select 0;

if (!ctrlShown (_display displayCtrl 154)) exitWith {
    (_display displayCtrl 1713001) ctrlShow false;
    (_display displayCtrl 1713002) ctrlShow false;
    (_display displayCtrl 1713005) ctrlShow false;
    (_display displayCtrl 1713006) ctrlShow false;
    (_display displayCtrl 1713010) ctrlShow false;
    (_display displayCtrl 1713011) ctrlShow false;
};

GVAR(camera) setposATL positioncameratoworld [0,0,0.4];
GVAR(camera) camPrepareTarget positioncameratoworld [0,0,50];
GVAR(camera) camCommitPrepared 0;

// @todo, check if that needs to be done at all
if (cameraView == "GUNNER") then {
    GVAR(camera) camsetFOV 0.7;
    GVAR(camera) camcommit 0;
} else {
    GVAR(camera) camsetFOV 0.01;
    GVAR(camera) camcommit 0;
};

// @todo, all weapon types
private "_optic";
_optic = (primaryWeaponItems ACE_player) select 2;

// calculate lighting
private ["_dayOpacity", "_nightOpacity"];

_dayOpacity = call EFUNC(common,ambientBrightness);
_nightOpacity = [1,0] select (_dayOpacity == 1);

// Apply lighting and make layers visible
(_display displayCtrl 1713001) ctrlSetTextColor [1,1,1,1];
(_display displayCtrl 1713002) ctrlSetTextColor [1,1,1,[0,1] select (_dayOpacity < 0.5)];
(_display displayCtrl 1713005) ctrlSetTextColor [1,1,1,_dayOpacity];
(_display displayCtrl 1713006) ctrlSetTextColor [1,1,1,_nightOpacity];

/*
(_display displayCtrl 1713001) ctrlCommit 0;
(_display displayCtrl 1713002) ctrlCommit 0;
(_display displayCtrl 1713005) ctrlCommit 0;
(_display displayCtrl 1713006) ctrlCommit 0;
*/

(_display displayCtrl 1713001) ctrlShow true;
(_display displayCtrl 1713002) ctrlShow true;
(_display displayCtrl 1713005) ctrlShow true;
(_display displayCtrl 1713006) ctrlShow true;
(_display displayCtrl 1713010) ctrlShow true;
(_display displayCtrl 1713011) ctrlShow true;
