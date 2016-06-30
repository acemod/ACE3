#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {"ACE_Box_Misc", "ACE_bananaItem"};
        weapons[] = {"ACE_ItemCore","ACE_FakePrimaryWeapon", "ACE_Banana"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_main","ace_modules"};
        author = CSTRING(ACETeam);
        authors[] = {"KoffeinFlummi"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG_COMMON;
    };
};

// This class will be deprecated in version 3.8.0
class ACE_newEvents {
    // Status effect events
    forceWalk = QGVAR(forceWalk);
    blockSprint = QGVAR(blockSprint);
    setCaptive = QGVAR(setCaptive);
    blockDamage = QGVAR(blockDamage);
    blockEngine = QGVAR(blockEngine);

    // Public listenable events
    PlayerJip = "ace_playerJIP";
    activeCameraChanged = "ace_activeCameraChanged";
    visibleMapChanged = "ace_visibleMapChanged";
    cameraViewChanged = "ace_cameraViewChanged";
    playerVisionModeChanged = "ace_playerVisionModeChanged";
    playerInventoryChanged = "ace_playerInventoryChanged";
    playerWeaponChanged = "ace_playerWeaponChanged";
    playerTurretChanged = "ace_playerTurretChanged";
    playerVehicleChanged = "ace_playerVehicleChanged";
    playerChanged = "ace_playerChanged";
    SettingsInitialized = "ace_settingsInitialized";
    SettingChanged = "ace_settingChanged";
    firedNonPlayerVehicle = "ace_firedNonPlayerVehicle";
    firedPlayerVehicleNonLocal = "ace_firedPlayerVehicleNonLocal";
    firedPlayerVehicle = "ace_firedPlayerVehicle";
    firedNonPlayer = "ace_firedNonPlayer";
    firedPlayerNonLocal = "ace_firedPlayerNonLocal";
    firedPlayer = "ace_firedPlayer";
    unloadPersonEvent = "ace_unloadPersonEvent";
    loadPersonEvent = "ace_loadPersonEvent";
    useItem = "ace_useItem";
    infoDisplayChanged = "ace_infoDisplayChanged";

    // Internal callable events
    setStatusEffect = QGVAR(setStatusEffect);
    HeadbugFixUsed = QGVAR(headbugFixUsed);
    InitSettingsFromModules = QGVAR(initSettingsFromModules);
    enableSimulationGlobal = QGVAR(enableSimulationGlobal);
    hideObjectGlobal = QGVAR(hideObjectGlobal);
    fixPosition = QGVAR(fixPosition);
    fixFloating = QGVAR(fixFloating);
    fixCollision = QGVAR(fixCollision);
    unlockVehicle = QGVAR(unlockVehicle);
    lockVehicle = QGVAR(lockVehicle);
    displayTextPicture = QGVAR(displayTextPicture);
    displayTextStructured = QGVAR(displayTextStructured);
    setVanillaHitPointDamage = QGVAR(setVanillaHitPointDamage);
    setVectorDirAndUp = QGVAR(setVectorDirAndUp);
    switchMove = QGVAR(switchMove);
    playMoveNow = QGVAR(playMoveNow);
    playMove = QGVAR(playMove);
    setVelocity = QGVAR(setVelocity);
    selectLeader = QGVAR(selectLeader);
    setSpeaker = QGVAR(setSpeaker);
    engineOn = QGVAR(engineOn);
    setFuel = QGVAR(setFuel);
    setDir = QGVAR(setDir);

    // Events framework
    SEH_s = "ACEs";
    SEH = "ACEe";
    SEH_all = "ACEa";
};

#include "CfgEventHandlers.hpp"

#include "CfgLocationTypes.hpp"
#include "CfgSounds.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "CfgMagazines.hpp"

#include "CfgActions.hpp"
#include "CfgMoves.hpp"
#include "CfgVoice.hpp"
#include "CfgUnitInsignia.hpp"
#include "CfgEden.hpp"

class ACE_Rsc_Display_Base {
    idd = -1;
    type = 0;
    style = 48;
    name = "";
    duration = 999999;
    fadeIn = 0;
    fadeOut = 0;
    font = "TahomaB";
    size = 1;
    colorBackground[] = {1, 1, 1, 0};
    colorText[] = {1, 1, 1, 1};
};

class ACE_Rsc_Control_Base {
    idc = 1;
    type = 0;
    style = 48;
    access = 0;
    lineSpacing = 0;
    moving = 1;
    text = "";
    size = 1;
    sizeEx = 0;
    font = "TahomaB";
    colorBackground[] = {1, 1, 1, 0};
    colorText[] = {1, 1, 1, 1};
    x = 0;
    y = 0;
    w = 0;
    h = 0;
};

#include "ACE_Settings.hpp"
#include "define.hpp"
#include <ProgressScreen.hpp>
#include <HintConfig.hpp>
#include <RscInfoType.hpp>

class CfgUIGrids {
    class IGUI {
        class Presets {
            class Arma3 {
                class Variables {
                    grid_ACE_displayText[] = {{((safezoneX + safezoneW) - (10 *(((safezoneW / safezoneH) min 1.2) / 40)) - 2.9 *(((safezoneW / safezoneH) min 1.2) / 40)),safeZoneY + 0.175 * safezoneH, (10 *(((safezoneW / safezoneH) min 1.2) / 40)), (2 *((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))}, "(((safezoneW / safezoneH) min 1.2) / 40)","((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)"};
                };
            };
        };

        class Variables {
            class grid_ACE_displayText {
                displayName = "ACE Hint";
                description = "Textual in game feedback to the player.";
                preview = "\a3\Ui_f\data\GUI\Cfg\UIGrids\grid_hint_ca.paa";
                saveToProfile[] = {0,1};
            };
        };
    };
};

class ACE_Extensions {
    extensions[] = {};
};
