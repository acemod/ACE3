#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {"ACE_ModuleMine_SLAMBottomMine", "ACE_ModuleExplosive_IEDUrbanBig_Range", "ACE_ModuleExplosive_IEDLandBig_Range", "ACE_ModuleExplosive_IEDUrbanSmall_Range", "ACE_ModuleExplosive_IEDLandSmall_Range", "ACE_APERSMine_ToePopper", "ACE_ModuleMine_APERSMine_ToePopper", "ACE_ModuleMine_FlareTripMine", "ACE_ModuleMine_FlareTripMineRed", "ACE_ModuleMine_FlareTripMineGreen"};
        weapons[] = {"ACE_Clacker", "ACE_DefusalKit", "ACE_M26_Clacker", "ACE_DeadManSwitch", "ACE_Cellphone"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Garth 'L-H' de Wet", "mharis001"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "ACE_Settings.hpp"
#include "CfgEventHandlers.hpp"
#include "Cfg3DEN.hpp"
#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"
#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"

#include "ACE_Triggers.hpp"
#include "ACE_Arsenal_Stats.hpp"
#include "ACE_Medical_Injuries.hpp"

// UI stuff
class RscText;
class RscEdit;
class RscPicture;
class RscButton;
class ctrlXSliderH;

#include "ExplosivesUI.hpp"
#include "TimerDialog.hpp"
#include "GUI_VirtualAmmo.hpp"

class CfgActions {
    class None;
    class ActivateMine: None {
        show = 0;
    };
    class Deactivate: None {
        show = 0;
    };
    class DeactivateMine: None {
        show = 0;
    };
    class UseContainerMagazine: None {
        show = 0;
    };
};

class CfgMineTriggers {
    class IRTrigger;
    class ACE_MagneticTrigger: IRTrigger {
        mineWireEnd[] = {0, 0.1, 0.5};
    };

    class TankTriggerMagnetic;
    class ACE_TankTriggerLight: TankTriggerMagnetic {
        // Reduce mass needed to trigger vanilla AT Mine to realistic levels (https://en.wikipedia.org/wiki/M15_mine#Specifications).
        // Will now trigger for any vehicle heavier than the Vanilla ATV (280kg)
        mineTriggerMass = 300; // Default: 7000
    };
};
