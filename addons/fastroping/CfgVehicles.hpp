class CfgVehicles {
    class UAV_01_base_F;
    class GVAR(helper): UAV_01_base_F {
        author = "KoffeinFlummi";
        scope = 1;
        model = PATHTOF(data\helper.p3d);
        isUAV = 0;
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
    class Heli_Transport_01_base_F: Helicopter_Base_H {
        GVAR(enabled) = 1;
        GVAR(ropeOrigins[]) = {{1.1, 2.5, 0.25}, {-1.1, 2.5, 0.25}};
    };
};
