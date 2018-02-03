#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {"ACE_ModuleMine_SLAMBottomMine", "ACE_ModuleExplosive_IEDUrbanBig_Range", "ACE_ModuleExplosive_IEDLandBig_Range", "ACE_ModuleExplosive_IEDUrbanSmall_Range", "ACE_ModuleExplosive_IEDLandSmall_Range"};
        weapons[] = {"ACE_Clacker", "ACE_DefusalKit", "ACE_M26_Clacker", "ACE_DeadManSwitch", "ACE_Cellphone"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Garth 'L-H' de Wet"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "ACE_Settings.hpp"

#include "CfgEventHandlers.hpp"

#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"
#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"
#include "CfgCloudlets.hpp"

#include "ACE_Triggers.hpp"
#include "ExplosivesUI.hpp"
#include "GUI_VirtualAmmo.hpp"

class CfgActions {
    class None;
    class Deactivate:None {
        show = 0;
    };
    class DeactivateMine:None {
        show = 0;
    };
};

class CfgMineTriggers {
    class RangeTrigger;
    class ACE_MagneticTrigger: RangeTrigger {
        mineMagnetic = 1;
        mineTriggerRange = 1;
    };
};

class CfgACEArsenalStats {
    class statBase;
    class explosiveRange: statBase {
        scope = 2;
        stats[]= {"ace_explosives_Range"};
        displayName= CSTRING(statExploRange);
        showText= 1;
        textStatement = QUOTE(params [ARR_2('_stat', '_config')]; private _exploRangeStat = getNumber (_config >> _stat select 0); format [ARR_3('%1m (%2ft)', _exploRangeStat, (_exploRangeStat / 0.3048) toFixed 1)]);
        condition = QUOTE(params [ARR_2('', '_config')]; (getNumber (_config >> 'ace_explosives_Detonator'))  > 0);
        tabs[]= {{}, {7}};
    };
};
