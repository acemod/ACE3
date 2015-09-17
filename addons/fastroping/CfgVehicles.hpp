class CfgVehicles {
    class UAV_01_base_F;
    class GVAR(helper): UAV_01_base_F {
        author = "KoffeinFlummi";
        scope = 1;
        model = PATHTOF(data\helper.p3d);
        isUAV = 0;
        displayName = "";
    };

    class Air;
    class Helicopter: Air {
        class ACE_SelfActions {
            class ACE_deployRopes {
                displayName = "Deploy ropes";
                condition = [_player, vehicle _player] call FUNC(canDeployRopes);
                statement = [_player, vehicle _player] call FUNC(deployRopes);
                showDisabled = 0;
                priority = 1;
            };
            class ACE_cutRopes {
                displayName = "Cut ropes";
                condition = [_player, vehicle _player] call FUNC(canCutRopes);
                statement = [vehicle _player] call FUNC(cutRopes);
                showDisabled = 0;
                priority = 1;
            };
            class ACE_fastRope {
                displayName = "Fast rope";
                condition = [_player, vehicle _player] call FUNC(canFastRope);
                statement = [_player, vehicle _player] call FUNC(fastRope);
                showDisabled = 0;
                priority = 1;
            };
        };
    };

    class Helicopter_Base_H;
    class Heli_Light_02_base_F: Helicopter_Base_H {
        GVAR(enabled) = 1;
        GVAR(ropeOrigins[]) = {{1.41, 1.38, 0}, {-1.41, 1.38, 0}};
    };
    class Heli_Attack_02_base_F: Helicopter_Base_H {
        GVAR(enabled) = 1;
        GVAR(ropeOrigins[]) = {{1.25, 1.5, -0.6}, {-1.1, 1.5, -0.6}};
    };
    class Heli_Transport_01_base_F: Helicopter_Base_H {
        GVAR(enabled) = 1;
        GVAR(ropeOrigins[]) = {{1.08, 2.43, 0.2}, {-0.95, 2.43, 0.2}};
    };
    class Heli_Transport_02_base_F: Helicopter_Base_H {
        GVAR(enabled) = 1;
        GVAR(ropeOrigins[]) = {{0.94, -4.82, -1.16}, {-0.94, -4.82, -1.16}};
    };
    class Heli_Transport_03_base_F: Helicopter_Base_H {
        GVAR(enabled) = 1;
        GVAR(ropeOrigins[]) = {{0.75, -5.29, -0.11}, {-0.87, -5.29, -0.11}};
    };
    class Helicopter_Base_F;
    class Heli_light_03_base_F: Helicopter_Base_F{
        GVAR(enabled) = 1;
        GVAR(ropeOrigins[]) = {{0.84, 2.8, 0.52}, {-0.9, 2.8, 0.52}};
    };
    class Heli_light_03_unarmed_base_F: Heli_light_03_base_F {
        GVAR(enabled) = 1;
        GVAR(ropeOrigins[]) = {{0.84, 2.8, 0.36}, {-0.9, 2.8, 0.36}};
    };
    class Heli_Transport_04_base_F;
    class O_Heli_Transport_04_bench_F: Heli_Transport_04_base_F {
        GVAR(enabled) = 1;
        GVAR(ropeOrigins[]) = {{1.03, 1.6, -0.23}, {1.03, -1.36, -0.23}, {-1.23, 1.6, -0.23}, {-1.23, -1.36, -0.23}};
    };
    class O_Heli_Transport_04_covered_F: Heli_Transport_04_base_F {
        GVAR(enabled) = 1;
        GVAR(ropeOrigins[]) = {{0.83, -4.7, -0.03}, {-1.02, -4.7, -0.03}};
    };
};
