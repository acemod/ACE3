class DefaultEventhandlers;
class CfgVehicles {
    class Boat_F;
    class Plane;
    class Plane_Base_F: Plane {
        class Eventhandlers;
    };
    class UAV: Plane {
        class Eventhandlers;
    };
    class Tank;
    class Tank_F : Tank {
        class Eventhandlers;
        class Turrets {
            class MainTurret;
        };
    };
    class Air;
    class Helicopter : Air {
        class Turrets;
    };
    class Helicopter_Base_F : Helicopter {
        class Eventhandlers;
        class Turrets: Turrets {
            class MainTurret;
        };
    };
    class Helicopter_Base_H;

    class StaticWeapon;
    class StaticATWeapon : StaticWeapon {
        class Eventhandlers;
    };
    // Clases a modificar
    class ffaa_ea_hercules_base : Plane_Base_F {
        class Eventhandlers : Eventhandlers {
            delete init;
        };
    };
    class Boat_Armed_01_base_F: Boat_F {
        class Eventhandlers;
    };
    class ffaa_ar_lcm : Boat_Armed_01_base_F {
        class Eventhandlers : Eventhandlers {
            delete init;
        };
    };
    class ffaa_ar_zodiac_hurricane : Boat_Armed_01_base_F {
        class Eventhandlers : Eventhandlers {
            delete init;
        };
    };
    class ffaa_spike_tripode : StaticATWeapon {
        class Eventhandlers : Eventhandlers {
            delete init;
            delete fired;
        };
    };
    class ffaa_et_ch47_base : Helicopter_Base_H {
        class Eventhandlers : Eventhandlers {
            delete init;
        };
    };
    class ffaa_famet_cougar_base : Helicopter_Base_H {
        class Eventhandlers : Eventhandlers {
            delete init;
        };
    };
    class ffaa_et_pizarro: Tank_F {
        class Eventhandlers : Eventhandlers {
            delete init;
        };
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                ACE_fcs_enabled=1;
                ACE_fcs_minDistance=100;
                ACE_fcs_maxDistance=2400;
                ACE_fcs_distanceInterval=5;
                discreteDistance[]={};
                discreteDistanceInitIndex=0;
            };
        };
    };
    class ffaa_et_toa : Tank_F {
        class Eventhandlers : Eventhandlers {
            delete init;
        };
    };
    class ffaa_et_toa_m2 : ffaa_et_toa {
        class Eventhandlers : Eventhandlers {
            delete init;
        };
    };
    class ffaa_et_toa_mando : ffaa_et_toa_m2 {
        class Eventhandlers : Eventhandlers {
            delete init;
        };
    };
    class ffaa_et_toa_zapador : ffaa_et_toa_m2 {
        class Eventhandlers : Eventhandlers {
            delete init;
        };
    };
    class ffaa_et_toa_ambulancia : ffaa_et_toa_m2 {
        class Eventhandlers : Eventhandlers {
            delete init;
        };
    };
    class ffaa_et_leopardo_base: Tank_F {
        class Eventhandlers : Eventhandlers {
            delete init;
        };
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                ACE_fcs_enabled=1;
                ACE_fcs_minDistance=100;
                ACE_fcs_maxDistance=2400;
                ACE_fcs_distanceInterval=5;
                discreteDistance[]={};
                discreteDistanceInitIndex=0;
            };
        };
    };
    class ffaa_famet_tigre_base: Helicopter_Base_F {
        class EventHandlers : Eventhandlers {
            delete init;
            delete fired;
        };
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                ACE_fcs_enabled=1;
                ACE_fcs_minDistance=200;
                ACE_fcs_maxDistance=9990;
                ACE_fcs_distanceInterval=5;
                discreteDistance[]={};
                discreteDistanceInitIndex=0;
            };
        };
    };
    class ffaa_et_searcherIII: UAV {
        class EventHandlers : Eventhandlers {
            delete init;
        };
    };
    class ffaa_UAVStation : StaticWeapon {
        class EventHandlers : DefaultEventhandlers {
            delete GetIn;
        };
    };
};
