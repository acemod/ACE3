use std::f64::consts::FRAC_PI_4;

use arma_rs::Group;

use crate::common::{Temperature, GRAVITY};

mod simulate;

pub fn group() -> Group {
    Group::new()
}

fn findMaxAngle(muzzel_veocity: f64, air_friction: f64) -> (f64, f64) {
    if air_friction == 0.0 {
        return (FRAC_PI_4, muzzel_veocity * muzzel_veocity / GRAVITY);
    }

    let mut best_angle = FRAC_PI_4;
    let mut best_distance = -1.0;
    let mut test_angle = FRAC_PI_4;
    loop {
        let (_, result_distance, _) = simulate::shot(
            test_angle,
            muzzel_veocity,
            0.0,
            0.0,
            0.0,
            Temperature::new_15c(),
            1.0,
            air_friction,
        );
        if result_distance > best_distance {
            best_distance = result_distance;
            best_angle = test_angle;
        }

        test_angle -= FRAC_PI_4 / 100.0;
        if test_angle < 0.0 {
            break;
        }
    }
    (best_angle, best_distance)
}
