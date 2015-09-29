
class CfgVehicles {
    class All {
        class Turrets;
    };

    class AllVehicles: All {
        class NewTurret {
            GVAR(Enabled) = 0;
            GVAR(MinDistance) = 200;
            GVAR(MaxDistance) = 9990;
            GVAR(DistanceInterval) = 5;
            class Turrets;
        };
        class CargoTurret;
    };

    // LAND VEHICLES
    class Land: AllVehicles {};

    class LandVehicle: Land {
        class CommanderOptics;
    };

    class Car: LandVehicle {
        class ACE_SelfActions {
            class ResetFCS {
                displayName = CSTRING(ResetFCS);
                condition = QUOTE(call FUNC(canResetFCS));
                statement = QUOTE([ARR_2(vehicle _player,[_player] call DEFUNC(common,getTurretIndex))] call DFUNC(reset););
                showDisabled = 0;
                priority = 1;
                icon = "";
            };
        };
    };

    class Tank: LandVehicle {
        class ACE_SelfActions {
            class ResetFCS {
                displayName = CSTRING(ResetFCS);
                condition = QUOTE(call FUNC(canResetFCS));
                statement = QUOTE([ARR_2(vehicle _player,[_player] call DEFUNC(common,getTurretIndex))] call DFUNC(reset););
                showDisabled = 0;
                priority = 1;
                icon = "";
            };
        };
        class Turrets {
            class MainTurret: NewTurret {
                GVAR(Enabled) = 1; // all tracked vehicles get one by default
                class Turrets {
                    class CommanderOptics;
                };
            };
        };
    };

    class Tank_F: Tank {
        class Turrets {
            class MainTurret: NewTurret {
                GVAR(Enabled) = 1; // all tracked vehicles get one by default
                class Turrets {
                    class CommanderOptics;//: CommanderOptics {};
                };
            };
        };
    };

    class Car_F: Car {
        class Turrets {
            class MainTurret;
        };
    };

    class Wheeled_APC_F: Car_F {
        class Turrets {
            class MainTurret: NewTurret {
                class Turrets {
                    class CommanderOptics;//: CommanderOptics {};
                };
            };
        };
    };

    class MRAP_01_base_F: Car_F {};

    class MRAP_01_gmg_base_F: MRAP_01_base_F {
        /*class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };*/
    };

    class MRAP_01_hmg_base_F: MRAP_01_gmg_base_F {
        /*class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };*/
    };

    class B_MRAP_01_F: MRAP_01_base_F {
        class Turrets;
    };

    class MRAP_02_base_F: Car_F {};

    class MRAP_02_hmg_base_F: MRAP_02_base_F {
        /*class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };*/
    };

    class MRAP_02_gmg_base_F: MRAP_02_hmg_base_F {
        /*class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };*/
    };

    class O_MRAP_02_F: MRAP_02_base_F {
        class Turrets;
    };

    class MRAP_03_base_F: Car_F {
        /*class Turrets: Turrets {
            class CommanderTurret: MainTurret {};
        };*/
    };

    class MRAP_03_hmg_base_F: MRAP_03_base_F {
        /*class Turrets: Turrets {
            class MainTurret: MainTurret {};
            class CommanderTurret: CommanderTurret {};
        };*/
    };

    class MRAP_03_gmg_base_F: MRAP_03_hmg_base_F {
        /*class Turrets: Turrets {
            class MainTurret: MainTurret {};
            class CommanderTurret: CommanderTurret {};
        };*/
    };

    class APC_Wheeled_01_base_F: Wheeled_APC_F {
        /*class Turrets: Turrets {
            class MainTurret: MainTurret {
                class Turrets: Turrets {
                    class CommanderOptics: CommanderOptics {};
                };
            };
        };*/
    };

    class B_APC_Wheeled_01_base_F: APC_Wheeled_01_base_F {};

    class B_APC_Wheeled_01_cannon_F: B_APC_Wheeled_01_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                GVAR(Enabled) = 1;
                discreteDistance[] = {};
                discreteDistanceInitIndex = 0;
            };
        };
    };

    class APC_Wheeled_02_base_F: Wheeled_APC_F {
        /*class Turrets: Turrets {
            class MainTurret: MainTurret {
                class Turrets;
            };

            class CommanderOptics: CommanderOptics {};
        };*/
    };

    class APC_Wheeled_03_base_F: Wheeled_APC_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                GVAR(Enabled) = 1;
                discreteDistance[] = {};
                discreteDistanceInitIndex = 0;

                /*class Turrets: Turrets {
                    class CommanderOptics: CommanderOptics {};
                };*/
            };
        };
    };

    class I_APC_Wheeled_03_base_F: APC_Wheeled_03_base_F {};

    class I_APC_Wheeled_03_cannon_F: I_APC_Wheeled_03_base_F {
        /*class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };*/
    };

    class APC_Tracked_01_base_F: Tank_F {
        /*class Turrets: Turrets {
            class MainTurret: MainTurret {
                class Turrets;
            };
        };*/
    };

    class B_APC_Tracked_01_base_F: APC_Tracked_01_base_F {
        /*class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };*/
    };

    class B_APC_Tracked_01_rcws_F: B_APC_Tracked_01_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                GVAR(Enabled) = 0;
            };
            class CommanderOptics: CommanderOptics {};
        };
    };

    class B_APC_Tracked_01_CRV_F: B_APC_Tracked_01_base_F {
        //GVAR(Enabled) = 0; @todo
    };

    class B_APC_Tracked_01_AA_F: B_APC_Tracked_01_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                discreteDistance[] = {};
                discreteDistanceInitIndex = 0;
                magazines[] += {"ACE_120Rnd_35mm_ABM_shells_Tracer_Red"};

                /*class Turrets: Turrets {
                    class CommanderOptics: CommanderOptics {};
                };*/
            };
        };
    };

    class APC_Tracked_02_base_F: Tank_F {
        /*class Turrets: Turrets {
            class MainTurret: MainTurret {
                class Turrets: Turrets {
                    class CommanderOptics: CommanderOptics {};
                };
            };
        };*/
    };

    class O_APC_Tracked_02_base_F: APC_Tracked_02_base_F {};

    class O_APC_Tracked_02_cannon_F: O_APC_Tracked_02_base_F {
        /*class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };*/
    };

    class O_APC_Tracked_02_AA_F: O_APC_Tracked_02_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                magazines[] += {"ACE_120Rnd_35mm_ABM_shells_Tracer_Green"};

                /*class Turrets: Turrets {
                    class CommanderOptics: CommanderOptics {};
                };*/
            };
        };
    };

    class APC_Tracked_03_base_F: Tank_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                discreteDistance[] = {};
                discreteDistanceInitIndex = 0;

                /*class Turrets: Turrets {
                    class CommanderOptics: CommanderOptics {};
                };*/
            };
        };
    };

    class MBT_01_base_F: Tank_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                discreteDistance[] = {};
                discreteDistanceInitIndex = 0;

                /*class Turrets: Turrets {
                    class CommanderOptics: CommanderOptics {};
                };*/
            };
        };
    };

    class B_MBT_01_base_F: MBT_01_base_F {};

    class B_MBT_01_cannon_F: B_MBT_01_base_F {};

    class MBT_01_arty_base_F: MBT_01_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                GVAR(Enabled) = 0;

                /*class Turrets: Turrets {
                    class CommanderOptics: CommanderOptics {};
                };*/
            };
        };
    };

    class MBT_01_mlrs_base_F: MBT_01_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                GVAR(Enabled) = 0;
                //class Turrets;
            };
        };
    };

    class MBT_02_base_F: Tank_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                discreteDistance[] = {};
                discreteDistanceInitIndex = 0;

                /*class Turrets: Turrets {
                    class CommanderOptics: CommanderOptics {};
                };*/
            };
        };
    };

    class MBT_02_arty_base_F: MBT_02_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                GVAR(Enabled) = 0;

                /*class Turrets: Turrets {
                    class CommanderOptics: CommanderOptics {};
                };*/
            };
        };
    };

    class MBT_03_base_F: Tank_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                discreteDistance[] = {};
                discreteDistanceInitIndex = 0;

                /*class Turrets: Turrets {
                    class CommanderOptics: CommanderOptics {};
                };*/
            };
        };
    };

    class B_MBT_01_TUSK_F: B_MBT_01_cannon_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                discreteDistance[] = {};
                discreteDistanceInitIndex = 0;

                class Turrets: Turrets {
                    class CommanderOptics: CommanderOptics {
                        GVAR(Enabled) = 1;
                    };
                };
            };
        };
    };

    // SHIPS
    /*class Ship: AllVehicles {
        class Turrets {
            class MainTurret;
        };
    };

    class Ship_F: Ship {};

    class Boat_F: Ship_F {};

    class Boat_Armed_01_base_F: Boat_F {
        class Turrets: Turrets {
            class FrontTurret;
            class RearTurret: FrontTurret {};
        };
    };*/

    /*class Boat_Armed_01_minigun_base_F: Boat_Armed_01_base_F {
        class Turrets: Turrets {
            class FrontTurret: FrontTurret {};
            class RearTurret: RearTurret {};
        };
    };*/

    // AIR VEHICLES
    class Air: AllVehicles {};

    class Helicopter: Air {
        class Turrets {
            class MainTurret;
        };
    };

    class Plane: Air {};

    class Helicopter_Base_F: Helicopter {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };

    class Helicopter_Base_H: Helicopter_Base_F {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };

    class Heli_Light_01_base_F: Helicopter_Base_H {
        /*class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {};
        };*/
    };

    class Heli_Light_01_unarmed_base_F: Heli_Light_01_base_F {};

    class B_Heli_Light_01_F: Heli_Light_01_unarmed_base_F {
        /*class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {};
        };*/
    };

    class Heli_Light_01_armed_base_F: Heli_Light_01_base_F {
        /*class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {};
        };*/
    };

    class Heli_Light_02_base_F: Helicopter_Base_H {
        /*class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {};
        };*/
    };

    class Plane_Base_F: Plane {
        class Turrets {
            class CopilotTurret;
        };
    };

    class Heli_Attack_01_base_F: Helicopter_Base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                GVAR(Enabled) = 1;
                discreteDistance[] = {};
                discreteDistanceInitIndex = 0;
            };
        };
    };

    class Heli_Attack_02_base_F: Helicopter_Base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                GVAR(Enabled) = 1;
                discreteDistance[] = {};
                discreteDistanceInitIndex = 0;
            };
        };
    };

    class Heli_Transport_01_base_F: Helicopter_Base_H {
        /*class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {};
            class MainTurret: MainTurret {};
            class RightDoorGun: MainTurret {};
        };*/
    };

    class Heli_Transport_02_base_F: Helicopter_Base_H {
        /*class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {};
        };*/
    };

    class Heli_light_03_base_F;
    class I_Heli_light_03_base_F: Heli_light_03_base_F {
        /*class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };*/
    };
    class I_Heli_light_03_F: Heli_light_03_base_F {
        /*class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };*/
    };

    class Plane_CAS_01_base_F: Plane_Base_F {
        class Turrets;
    };

    class Plane_CAS_02_base_F: Plane_Base_F {
        class Turrets;
    };

    class Plane_Fighter_03_base_F: Plane_Base_F {
        class Turrets;
    };

    // static weapons.
    class StaticWeapon: LandVehicle {
        class Turrets {
            class MainTurret; //: NewTurret {};
        };
    };

    class StaticMGWeapon: StaticWeapon {};

    class HMG_01_base_F: StaticMGWeapon {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                GVAR(Enabled) = 1;
                GVAR(MinDistance) = 100;
                GVAR(MaxDistance) = 1500;
                GVAR(DistanceInterval) = 5;
                discreteDistance[] = {};
                discreteDistanceInitIndex = 0;
            };
        };
    };
};
