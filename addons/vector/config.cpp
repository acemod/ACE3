#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {"AGM_Item_Vector"};
        weapons[] = {"AGM_Vector"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[] = {"Ghost","Hamburger SV","commy2","bux578"};
        authorUrl = "https://github.com/commy2/";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"

/*class AGM_Default_Keys {
    class vectorAzimuth {
        displayName = "$STR_AGM_Vector_AzimuthKey";
        condition = "currentWeapon player == 'AGM_Vector' && {_vehicle == player} && {cameraView == 'Gunner'}";
        statement = "AGM_vectorKey set [0, true]; if (AGM_isVectorReady) then {AGM_isVectorReady = false; AGM_Vector_scriptHandle = 0 spawn AGM_Vector_fnc_tabAzimuthKey; 0 spawn AGM_Vector_fnc_abort;};";
        conditionUp = "true";
        statementUp = "AGM_vectorKey set [0, false];";
        key = 15;
        shift = 0;
        control = 0;
        alt = 0;
    };
    class vectorDistance {
        displayName = "$STR_AGM_Vector_DistanceKey";
        condition = "currentWeapon player == 'AGM_Vector' && {_vehicle == player} && {cameraView == 'Gunner'}";
        statement = "AGM_vectorKey set [1, true]; if (AGM_isVectorReady) then {AGM_isVectorReady = false; AGM_Vector_scriptHandle = 0 spawn AGM_Vector_fnc_tabDistanceKey; 0 spawn AGM_Vector_fnc_abort;};";
        conditionUp = "true";
        statementUp = "AGM_vectorKey set [1, false];";
        key = 19;
        shift = 0;
        control = 0;
        alt = 0;
    };
};*/

#include "RscInGameUI.hpp"
