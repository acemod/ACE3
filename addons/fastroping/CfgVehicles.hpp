#define EQUIP_FRIES_ATTRIBUTE class Attributes { \
    class GVAR(equipFRIES) { \
        property = QGVAR(equipFRIES); \
        control = "Checkbox"; \
        displayName = CSTRING(Eden_equipFRIES); \
        tooltip = CSTRING(Eden_equipFRIES_Tooltip); \
        expression = QUOTE(if (_value) then {[_this] call FUNC(equipFRIES)}); \
        typeName = "BOOL"; \
        condition = "objectVehicle"; \
        defaultValue = "(false)"; \
    }; \
}

class CfgVehicles {
    class Logic;
    class Module_F: Logic {
        class ModuleDescription;
    };
    class ACE_Module: Module_F {};
    class ACE_moduleEquipFRIES: ACE_Module {
        scope = 1;
        displayName = CSTRING(Module_FRIES_DisplayName);
        icon = QPATHTOF(UI\Icon_Module_FRIES_ca.paa);
        category = "ACE";
        function = QFUNC(moduleEquipFRIES);
        functionPriority = 10;
        isGlobal = 0;
        isTriggerActivated = 0;
        isDisposable = 0;
        author = "BaerMitUmlaut";

        class ModuleDescription: ModuleDescription {
            description = CSTRING(Module_FRIES_Description);
            sync[] = {"AnyVehicle"};
        };
    };

    class Air;
    class Helicopter: Air {
        class ACE_SelfActions {
            class ACE_prepareFRIES {
                displayName = CSTRING(Interaction_prepareFRIES);
                condition = QUOTE([vehicle _player] call FUNC(canPrepareFRIES));
                statement = QUOTE([vehicle _player] call FUNC(prepareFRIES));
                showDisabled = 0;
            };
            class ACE_stowFRIES {
                displayName = CSTRING(Interaction_stowFRIES);
                condition = QUOTE([vehicle _player] call FUNC(canStowFRIES));
                statement = QUOTE([vehicle _player] call FUNC(stowFRIES));
                showDisabled = 0;
            };
            class ACE_deployRopes {
                displayName = CSTRING(Interaction_deployRopes);
                condition = QUOTE([ARR_2(_player, vehicle _player)] call FUNC(canDeployRopes));
                statement = QUOTE([ARR_2(QUOTE(QGVAR(deployRopes)), [vehicle _player])] call CBA_fnc_serverEvent);
                showDisabled = 0;
            };
            class ACE_cutRopes {
                displayName = CSTRING(Interaction_cutRopes);
                condition = [vehicle _player] call FUNC(canCutRopes);
                statement = [vehicle _player] call FUNC(cutRopes);
                showDisabled = 0;
            };
            class ACE_fastRope {
                displayName = CSTRING(Interaction_fastRope);
                condition = [_player, vehicle _player] call FUNC(canFastRope);
                statement = [_player, vehicle _player] call FUNC(fastRope);
                showDisabled = 0;
            };
        };
    };

    class Helicopter_Base_F;
    class ACE_friesBase: Helicopter_Base_F {
        destrType = "";
        class Turrets {};
        class ACE_Actions {};
        class ACE_SelfActions {};
        EGVAR(cargo,hasCargo) = 0;
        EGVAR(cargo,space) = 0;
        // ACRE 2.6.0 Compatibility
        acre_hasInfantryPhone = 0;
        class AcreRacks {};
        class AcreIntercoms {};
    };
    class ACE_friesAnchorBar: ACE_friesBase {
        author = "jokoho48";
        scope = 1;
        model = QPATHTOF(data\friesAnchorBar.p3d);
        animated = 1;
        class AnimationSources {
            class extendHookRight {
                source = "user";
                initPhase = 0;
                animPeriod = 1.5;
            };
            class extendHookLeft {
                source = "user";
                initPhase = 0;
                animPeriod = 1.5;
            };
        };
    };
    class ACE_friesGantry: ACE_friesBase {
        author = "jokoho48";
        scope = 1;
        model = QPATHTOF(data\friesGantry.p3d);
        animated = 1;
        class AnimationSources {
            class adjustWidth {
                source = "user";
                initPhase = 0.211;
                animPeriod = 0;
            };
            class rotateGantryLeft {
                source = "user";
                initPhase = 0;
                animPeriod = 0;
            };
            class rotateGantryRight {
                source = "user";
                initPhase = 0;
                animPeriod = 0;
            };
            class hideGantryLeft {
                source = "user";
                initPhase = 0;
                animPeriod = 0;
            };
            class hideGantryRight {
                source = "user";
                initPhase = 0;
                animPeriod = 0;
            };
        };
    };
    class ACE_friesGantryReverse: ACE_friesGantry {
        class AnimationSources: AnimationSources {
            class adjustWidth {
                source = "user";
                initPhase = 0.213;
                animPeriod = 0;
            };
            class rotateGantryLeft {
                source = "user";
                initPhase = 0.5;
                animPeriod = 0;
            };
            class rotateGantryRight {
                source = "user";
                initPhase = 0.5;
                animPeriod = 0;
            };
        };
    };

    class GVAR(helper): Helicopter_Base_F {
        author = "KoffeinFlummi";
        scope = 1;
        model = QPATHTOF(data\helper.p3d);
        class ACE_Actions {};
        class Turrets {};
        class TransportItems {};
        EGVAR(cargo,hasCargo) = 0;
        EGVAR(cargo,space) = 0;
        // ACRE 2.6.0 Compatibility
        acre_hasInfantryPhone = 0;
        class AcreRacks {};
        class AcreIntercoms {};
    };

    class Helicopter_Base_H;
    class Heli_Light_02_base_F: Helicopter_Base_H {
        GVAR(enabled) = 1;
        GVAR(ropeOrigins)[] = {{1.41, 1.38, 0}, {-1.41, 1.38, 0}};
        GVAR(onPrepare) = QFUNC(onPrepareCommon);
        GVAR(onCut) = QFUNC(onCutCommon);
    };
    class Heli_Attack_02_base_F: Helicopter_Base_F {
        GVAR(enabled) = 1;
        GVAR(ropeOrigins)[] = {{1.25, 1.5, -0.6}, {-1.1, 1.5, -0.6}};
        GVAR(onPrepare) = QFUNC(onPrepareCommon);
        GVAR(onCut) = QFUNC(onCutCommon);
    };
    class Heli_Transport_01_base_F: Helicopter_Base_H {
        GVAR(enabled) = 2;
        GVAR(ropeOrigins)[] = {"ropeOriginRight", "ropeOriginLeft"};
        GVAR(friesType) = "ACE_friesAnchorBar";
        GVAR(friesAttachmentPoint)[] = {0.065, 2.2, -0.15};
        GVAR(onPrepare) = QFUNC(onPrepareCommon);
        GVAR(onCut) = QFUNC(onCutCommon);
        EQUIP_FRIES_ATTRIBUTE;
    };
    class Heli_Transport_02_base_F: Helicopter_Base_H {
        GVAR(enabled) = 1;
        GVAR(ropeOrigins)[] = {{0.94, -4.82, -1.16}, {-0.94, -4.82, -1.16}};
        GVAR(onPrepare) = QFUNC(onPrepareCommon);
        GVAR(onCut) = QFUNC(onCutCommon);

        class UserActions {
            class Ramp_Open;
            class Ramp_Close: Ramp_Open {
                condition = QUOTE([ARR_5(this,'CargoRamp_Open',[[0],[1],[2]])] call FUNC(canCloseRamp));
            };
        };
    };
    class Heli_Transport_03_base_F: Helicopter_Base_H {
        GVAR(enabled) = 1;
        GVAR(ropeOrigins)[] = {{0.75, -5.29, -0.11}, {-0.87, -5.29, -0.11}};
        GVAR(onPrepare) = QFUNC(onPrepareCommon);
        GVAR(onCut) = QFUNC(onCutCommon);

        class UserActions {
            class Ramp_Open;
            class Ramp_Close: Ramp_Open {
                condition = QUOTE([ARR_5(this,'Door_rear_source',[[0],[3],[4]])] call FUNC(canCloseRamp));
            };
        };
    };
    class Heli_light_03_base_F: Helicopter_Base_F {
        GVAR(enabled) = 2;
        GVAR(ropeOrigins)[] = {"ropeOriginRight", "ropeOriginLeft"};
        GVAR(friesType) = "ACE_friesGantryReverse";
        GVAR(friesAttachmentPoint)[] = {-1.04, 2.5, -0.34};
        EQUIP_FRIES_ATTRIBUTE;
    };
    class Heli_light_03_unarmed_base_F: Heli_light_03_base_F {
        GVAR(enabled) = 2;
        GVAR(ropeOrigins)[] = {"ropeOriginRight", "ropeOriginLeft"};
        GVAR(friesType) = "ACE_friesGantry";
        GVAR(friesAttachmentPoint)[] = {1.07, 2.5, -0.5};
        EQUIP_FRIES_ATTRIBUTE;
    };
    class Heli_Transport_04_base_F: Helicopter_Base_H {
        class UserActions;
    };
    class O_Heli_Transport_04_bench_F: Heli_Transport_04_base_F {
        GVAR(enabled) = 1;
        GVAR(ropeOrigins)[] = {{1.03, 1.6, -0.23}, {1.03, -1.36, -0.23}, {-1.23, 1.6, -0.23}, {-1.23, -1.36, -0.23}};
    };
    class O_Heli_Transport_04_covered_F: Heli_Transport_04_base_F {
        GVAR(enabled) = 1;
        GVAR(ropeOrigins)[] = {{0.83, -4.7, -0.03}, {-1.02, -4.7, -0.03}};
        GVAR(onPrepare) = QFUNC(onPrepareCommon);
        GVAR(onCut) = QFUNC(onCutCommon);

        class UserActions: UserActions {
            class CloseDoor_6;
            class Ramp_Close: CloseDoor_6 {
                condition = QUOTE([ARR_6(this,'Door_6_source',[[0],[1],[2],[3]])] call FUNC(canCloseRamp));
            };
        };
    };
};
