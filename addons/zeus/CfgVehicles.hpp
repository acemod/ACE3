class CfgVehicles {
    class Module_F;
    class ModuleEmpty_F;
    class ACE_Module;

    class ModuleCurator_F: Module_F {
        function = QFUNC(bi_moduleCurator);
    };
    class ModuleMine_F: ModuleEmpty_F {
        function = QFUNC(bi_moduleMine);
    };
    class ModuleOrdnance_F: Module_F {
        function = QFUNC(bi_moduleProjectile);
    };
    class ModuleRemoteControl_F: Module_F {
        function = QFUNC(bi_moduleRemoteControl);
    };
    class GVAR(moduleSettings): ACE_Module {
        scope = 1;
        displayName = CSTRING(Settings_DisplayName);
        icon = QPATHTOF(UI\Icon_Module_Zeus_Settings_ca.paa);
        category = "ACE";
        function = QFUNC(moduleZeusSettings);
        functionPriority = 1;
        isGlobal = 1;
        isSingular = 1;
        isTriggerActivated = 0;
        author = ECSTRING(common,ACETeam);
        class Arguments {
            class zeusAscension {
                displayName = CSTRING(ascension_DisplayName);
                description = CSTRING(ascension_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class zeusBird {
                displayName = CSTRING(bird_DisplayName);
                description = CSTRING(bird_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class remoteWind {
                displayName = CSTRING(remoteWind_DisplayName);
                description = CSTRING(remoteWind_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class radioOrdnance {
                displayName = CSTRING(radioOrdnance_DisplayName);
                description = CSTRING(radioOrdnance_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class revealMines {
                displayName = CSTRING(revealMines_DisplayName);
                description = CSTRING(revealMines_Description);
                typeName = "NUMBER";
                class values {
                    class disable {
                        name = "$STR_A3_OPTIONS_DISABLED";
                        value = 0;
                        default = 1;
                    };
                    class partial {
                        name = CSTRING(revealMines_partial);
                        value = 1;
                    };
                    class full  {
                        name = CSTRING(revealMines_full);
                        value = 2;
                    };
                };
            };
            class autoAddObjects {
                displayName = CSTRING(AddObjectsToCurator);
                description = CSTRING(AddObjectsToCurator_desc);
                typeName = "BOOL";
                defaultValue = 0;
            };
        };
        class ModuleDescription {
            description = CSTRING(Settings_Description);
            sync[] = {};
        };
    };
    class GVAR(moduleBase): Module_F {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        function = QEFUNC(common,dummy);
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        scope = 1;
        scopeCurator = 2;
    };
    class GVAR(moduleAddSpareTrack): GVAR(moduleBase) {
        curatorCanAttach = 1;
        category = QGVAR(Repair);
        displayName = CSTRING(ModuleAddSpareTrack_DisplayName);
        function = QFUNC(moduleAddSpareTrack);
        icon = "a3\ui_f\data\IGUI\Cfg\Actions\repair_ca.paa";
    };
    class GVAR(moduleAddSpareWheel): GVAR(moduleBase) {
        curatorCanAttach = 1;
        category = QGVAR(Repair);
        displayName = CSTRING(ModuleAddSpareWheel_DisplayName);
        function = QFUNC(moduleAddSpareWheel);
        icon = "a3\ui_f\data\IGUI\Cfg\Actions\repair_ca.paa";
    };
    class GVAR(moduleSetEngineer): GVAR(moduleBase) {
        curatorCanAttach = 1;
        category = QGVAR(Repair);
        displayName = CSTRING(ModuleSetEngineer_DisplayName);
        curatorInfoType = QGVAR(RscSetEngineer);
        icon = "a3\ui_f\data\IGUI\Cfg\Actions\repair_ca.paa";
    };
    class GVAR(moduleSetRepairFacility): GVAR(moduleBase) {
        curatorCanAttach = 1;
        category = QGVAR(Repair);
        displayName = CSTRING(ModuleSetRepairFacility_DisplayName);
        function = QFUNC(moduleSetRepairFacility);
        icon = "a3\ui_f\data\IGUI\Cfg\Actions\repair_ca.paa";
    };
    class GVAR(moduleSetRepairVehicle): GVAR(moduleBase) {
        curatorCanAttach = 1;
        category = QGVAR(Repair);
        displayName = CSTRING(ModuleSetRepairVehicle_DisplayName);
        function = QFUNC(moduleSetRepairVehicle);
        icon = "a3\ui_f\data\IGUI\Cfg\Actions\repair_ca.paa";
    };
    class GVAR(moduleAddOrRemoveFRIES): GVAR(moduleBase) {
        curatorCanAttach = 1;
        category = QGVAR(Utility);
        displayName = CSTRING(ModuleAddOrRemoveFRIES_DisplayName);
        function = QFUNC(moduleAddOrRemoveFRIES);
    };
    class GVAR(moduleCaptive): GVAR(moduleBase) {
        curatorCanAttach = 1;
        category = QGVAR(Captive);
        displayName = CSTRING(ModuleCaptive_DisplayName);
        function = QFUNC(moduleCaptive);
        icon = QPATHTOF(UI\Icon_Module_Zeus_Captive_ca.paa);
    };
    class GVAR(moduleConfigurePylons): GVAR(moduleBase) {
        curatorCanAttach = 1;
        category = QGVAR(Utility);
        displayName = ECSTRING(pylons,ConfigurePylons);
        function = QFUNC(moduleConfigurePylons);
        icon = "a3\data_f_jets\logos\jets_logo_small_ca.paa";
    };
    class GVAR(moduleDefendArea): GVAR(moduleBase) {
        curatorCanAttach = 1;
        category = QGVAR(AI);
        displayName = CSTRING(ModuleDefendArea_DisplayName);
        curatorInfoType = QGVAR(RscDefendArea);
    };
    class GVAR(moduleEditableObjects): GVAR(moduleBase) {
        curatorCanAttach = 1;
        category = QGVAR(Utility);
        displayName = CSTRING(ModuleEditableObjects_DisplayName);
        curatorInfoType = QGVAR(RscEditableObjects);
        icon = QPATHTOF(ui\Icon_Module_Zeus_Editable_Objects_ca.paa);
    };
    class GVAR(moduleGlobalSetSkill): GVAR(moduleBase) {
        category = QGVAR(AI);
        displayName = CSTRING(ModuleGlobalSetSkill_DisplayName);
        curatorInfoType = QGVAR(RscGlobalSetSkill);
    };
    class GVAR(moduleGroupSide): GVAR(moduleBase) {
        curatorCanAttach = 1;
        category = QGVAR(Utility);
        displayName = CSTRING(ModuleGroupSide_DisplayName);
        curatorInfoType = QGVAR(RscGroupSide);
    };
    class GVAR(moduleHeal): GVAR(moduleBase) {
        curatorCanAttach = 1;
        category = QGVAR(Medical);
        displayName = CSTRING(ModuleHeal_DisplayName);
        function = QFUNC(moduleHeal);
        icon = QPATHTOF(ui\Icon_Module_Zeus_Heal_ca.paa);
    };
    class GVAR(moduleLayTrench): GVAR(moduleBase) {
        category = QGVAR(Utility);
        displayName = CSTRING(ModuleLayTrenchline_DisplayName);
        function = QFUNC(moduleLayTrench);
    };
    class GVAR(moduleLoadIntoCargo): GVAR(moduleBase) {
        curatorCanAttach = 1;
        category = QGVAR(Utility);
        displayName = CSTRING(ModuleLoadIntoCargo_DisplayName);
        function = QFUNC(moduleLoadIntoCargo);
        icon = "a3\ui_f\data\IGUI\Cfg\Actions\loadVehicle_ca.paa";
    };
    class GVAR(moduleUnloadFromCargo): GVAR(moduleBase) {
        curatorCanAttach = 1;
        category = QGVAR(Utility);
        displayName = CSTRING(ModuleUnloadFromCargo_DisplayName);
        function = QFUNC(moduleUnloadFromCargo);
        icon = "a3\ui_f\data\IGUI\Cfg\Actions\loadVehicle_ca.paa";
    };
    class GVAR(moduleCargoParadrop): GVAR(moduleBase) {
        curatorCanAttach = 1;
        category = QGVAR(AI);
        displayName = CSTRING(moduleCargoParadrop_DisplayName);
        function = QFUNC(moduleCargoParadrop);
        icon = QPATHTOF(UI\Icon_Module_Zeus_ParadropCargo_ca.paa);
    };
    class GVAR(modulePatrolArea): GVAR(moduleBase) {
        curatorCanAttach = 1;
        category = QGVAR(AI);
        displayName = CSTRING(ModulePatrolArea_DisplayName);
        curatorInfoType = QGVAR(RscPatrolArea);
    };
    class GVAR(moduleSearchArea): GVAR(moduleBase) {
        curatorCanAttach = 1;
        category = QGVAR(AI);
        displayName = CSTRING(ModuleSearchArea_DisplayName);
        curatorInfoType = QGVAR(RscSearchArea);
    };
    class GVAR(moduleSearchNearby): GVAR(moduleBase) {
        curatorCanAttach = 1;
        category = QGVAR(AI);
        displayName = CSTRING(ModuleSearchNearby_DisplayName);
        function = QFUNC(moduleSearchNearby);
    };
    class GVAR(moduleSuppressiveFire): GVAR(moduleBase) {
        curatorCanAttach = 1;
        category = QGVAR(AI);
        displayName = CSTRING(ModuleSuppressiveFire_DisplayName);
        function = QFUNC(moduleSuppressiveFire);
    };
    class GVAR(moduleSetMedic): GVAR(moduleBase) {
        curatorCanAttach = 1;
        category = QGVAR(Medical);
        displayName = CSTRING(ModuleSetMedic_DisplayName);
        function = QFUNC(moduleSetMedic);
        icon = QPATHTOF(UI\Icon_Module_Zeus_Medic_ca.paa);
    };
    class GVAR(moduleSetMedicalFacility): GVAR(moduleBase) {
        curatorCanAttach = 1;
        category = QGVAR(Medical);
        displayName = CSTRING(ModuleSetMedicalFacility_DisplayName);
        function = QFUNC(moduleSetMedicalFacility);
        icon = QPATHTOF(UI\Icon_Module_Zeus_Medic_ca.paa);
    };
    class GVAR(moduleSetMedicalVehicle): GVAR(moduleBase) {
        curatorCanAttach = 1;
        category = QGVAR(Medical);
        displayName = CSTRING(ModuleSetMedicalVehicle_DisplayName);
        function = QFUNC(moduleSetMedicalVehicle);
        icon = QPATHTOF(UI\Icon_Module_Zeus_Medic_ca.paa);
    };
    class GVAR(moduleSimulation): GVAR(moduleBase) {
        curatorCanAttach = 1;
        category = QGVAR(Utility);
        displayName = CSTRING(ModuleSimulation_DisplayName);
        function = QFUNC(moduleSimulation);
    };
    class GVAR(moduleSpectator): GVAR(moduleBase) {
        curatorCanAttach = 1;
        category = QGVAR(Utility);
        displayName = ECSTRING(spectator,Module_DisplayName);
        curatorInfoType = QGVAR(RscSpectator);
    };
    class GVAR(moduleSuicideBomber): GVAR(moduleBase) {
        curatorCanAttach = 1;
        category = QGVAR(AI);
        displayName = CSTRING(ModuleSuicideBomber_DisplayName);
        curatorInfoType = QGVAR(RscSuicideBomber);
    };
    class GVAR(moduleSurrender): GVAR(moduleBase) {
        curatorCanAttach = 1;
        category = QGVAR(Captive);
        displayName = CSTRING(ModuleSurrender_DisplayName);
        function = QFUNC(moduleSurrender);
        icon = QPATHTOF(UI\Icon_Module_Zeus_Surrender_ca.paa);
    };
    class GVAR(moduleTeleportPlayers): GVAR(moduleBase) {
        curatorCanAttach = 1;
        category = QGVAR(Utility);
        displayName = CSTRING(ModuleTeleportPlayers_DisplayName);
        curatorInfoType = QGVAR(RscTeleportPlayers);
    };
    class GVAR(moduleUnconscious): GVAR(moduleBase) {
        curatorCanAttach = 1;
        category = QGVAR(Medical);
        displayName = CSTRING(ModuleUnconscious_DisplayName);
        function = QFUNC(moduleUnconscious);
        icon = QPATHTOF(UI\Icon_Module_Zeus_Unconscious_ca.paa);
    };
    class GVAR(moduleGarrison): GVAR(moduleBase) {
        curatorCanAttach = 1;
        category = QGVAR(AI);
        displayName = CSTRING(ModuleGarrison_DisplayName);
        curatorInfoType = QGVAR(RscGarrison);
        icon = QPATHTOF(UI\Icon_Module_Zeus_Garrison_ca.paa);
    };
    class GVAR(moduleUnGarrison): GVAR(moduleBase) {
        curatorCanAttach = 1;
        category = QGVAR(AI);
        displayName = CSTRING(ModuleUnGarrison_DisplayName);
        function = QFUNC(moduleUnGarrison);
        icon = QPATHTOF(UI\Icon_Module_Zeus_UnGarrison_ca.paa);
    };
    class GVAR(moduleToggleNvg): GVAR(moduleBase) {
        curatorCanAttach = 1;
        category = QGVAR(AI);
        displayName = CSTRING(ModuleToggleNVG_DisplayName);
        curatorInfoType = QGVAR(RscToggleNvg);
    };
    class GVAR(moduleToggleFlashlight): GVAR(moduleBase) {
        curatorCanAttach = 1;
        category = QGVAR(AI);
        displayName = CSTRING(ModuleToggleFlashlight_DisplayName);
        curatorInfoType = QGVAR(RscToggleFlashlight);
        icon = QPATHTOF(ui\Icon_Module_Zeus_Flashlight_ca.paa);
    };
    class GVAR(AddFullArsenal): GVAR(moduleBase) {
        curatorCanAttach = 1;
        category = QGVAR(Utility);
        displayName = CSTRING(ModuleAddFullArsenal_DisplayName);
        function = QFUNC(moduleAddArsenal);
    };
    class GVAR(RemoveFullArsenal): GVAR(moduleBase) {
        curatorCanAttach = 1;
        category = QGVAR(Utility);
        displayName = CSTRING(ModuleRemoveArsenal_DisplayName);
        function = QFUNC(moduleRemoveArsenal);
    };
    class GVAR(AddFullAceArsenal): GVAR(moduleBase) {
        curatorCanAttach = 1;
        category = QGVAR(Arsenal);
        displayName = CSTRING(ModuleAddFullACEArsenal_DisplayName);
        function = QFUNC(moduleAddAceArsenal);
    };
    class GVAR(RemoveFullAceArsenal): GVAR(moduleBase) {
        curatorCanAttach = 1;
        category = QGVAR(Arsenal);
        displayName = CSTRING(ModuleRemoveACEArsenal_DisplayName);
        function = QFUNC(moduleRemoveAceArsenal);
    };
    class ModuleArsenal_F: Module_F {
        function=QFUNC(bi_moduleArsenal);
    };
    class GVAR(moduleBurn): GVAR(moduleBase) {
        curatorCanAttach = 1;
        category = QGVAR(Medical);
        displayName = CSTRING(ModuleBurn_DisplayName);
        function = QFUNC(moduleBurn);
        icon = QPATHTOF(ui\Icon_Module_Zeus_Burn_ca.paa);
    };
    class GVAR(moduleMedicalMenu): GVAR(moduleBase) {
        curatorCanAttach = 1;
        category = QGVAR(Medical);
        displayName = CSTRING(ModuleMedicalMenu_DisplayName);
        function = QFUNC(moduleMedicalMenu);
        icon = QPATHTOF(UI\Icon_Module_Zeus_Medic_ca.paa);
    };

    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class GVAR(create) {
                displayName = CSTRING(CreateZeus);
                condition = QUOTE(call FUNC(canCreateModule));
                exceptions[] = {"isNotSwimming", "isNotInside", "isNotSitting", "isNotOnLadder", "isNotRefueling"};
                //Set GVAR(zeus) to null first to disable the action through the isNil check
                statement = QUOTE(GVAR(zeus) = objNull; [ARR_2(QQGVAR(createZeus),ACE_player)] call CBA_fnc_serverEvent);
                showDisabled = 1;
                icon = "\A3\Ui_F_Curator\Data\Logos\arma3_curator_eye_32_ca.paa";
            };
            class GVAR(delete) {
                displayName = CSTRING(DeleteZeus);
                condition = QUOTE(!(isNil QQGVAR(zeus) || {isNull GVAR(zeus)}));
                exceptions[] = {"isNotSwimming", "isNotInside", "isNotSitting", "isNotOnLadder", "isNotRefueling"};
                statement = QUOTE(deleteVehicle GVAR(zeus); GVAR(zeus) = nil);
                showDisabled = 1;
                icon = "\A3\Ui_F_Curator\Data\Logos\arma3_curator_eye_32_ca.paa";
            };
        };
    };
};
