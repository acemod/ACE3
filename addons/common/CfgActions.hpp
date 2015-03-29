
class CfgActions {
    // fixes pick up action on mine detectors, because all ACE items are of that simulationClass and BI doesn't seem to care
    class None;
    class TakeWeapon: None {
        show = 0;
    };
    class TakeItem: None {
        show = 0;
    };
    class TakeMagazine: None {
        show = 0;
    };
};
