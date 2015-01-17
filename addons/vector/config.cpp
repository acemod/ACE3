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

class ACE_Default_Keys {
    class vectorAzimuth {
        displayName = "$STR_ACE_Vector_AzimuthKey";
        condition = QUOTE(currentWeapon player == 'ACE_Vector' && {_vehicle == player} && {cameraView == 'GUNNER'});
        statement = QUOTE(['azimuth'] call FUNC(onKeyDown));
        conditionUp = QUOTE(true);
        statementUp = QUOTE(['azimuth'] call FUNC(onKeyUp));
        key = 15;
        shift = 0;
        control = 0;
        alt = 0;
    };

    class vectorDistance {
        displayName = "$STR_ACE_Vector_DistanceKey";
        condition = QUOTE(currentWeapon player == 'ACE_Vector' && {_vehicle == player} && {cameraView == 'GUNNER'});
        statement = QUOTE(['distance'] call FUNC(onKeyDown));
        conditionUp = QUOTE(true);
        statementUp = QUOTE(['distance'] call FUNC(onKeyUp));
        key = 19;
        shift = 0;
        control = 0;
        alt = 0;
    };
};

#include "RscInGameUI.hpp"
