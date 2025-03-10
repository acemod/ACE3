class ACE_detector {
    class detectors {
        class ACE_VMM3 {
            detectorPosition[] = {1.3, -0.22, 0.4};
            radius = 2.5;
            sounds[] = {"ace_detector_1", "ace_detector_2", "ace_detector_3", "ace_detector_4"};
            soundDistances[] = {0, 0.5, 1.25, 2};
            soundIntervals[] = {0.5, 0.7, 0.85, 1};
            soundIntervalDistances[] = {0, 0.75, 1.25, 2};
        };
        class ACE_VMH3: ACE_VMM3 {
            detectorPosition[] = {1, -0.32, 0.3};
        };
    };
};
