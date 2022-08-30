use crate::common::{Temperature, Vector3, GRAVITY, GRAVITY_ACCEL};

const TIME_STEP: f64 = 1.0 / 60.0;

#[allow(clippy::too_many_arguments)]
pub fn shot(
    fire_angle_rad: f64,
    muzzle_velocity: f64,
    height_of_target: f64,
    cross_wind: f64,
    tail_wind: f64,
    temperature: Temperature,
    air_density: f64,
    air_friction: f64,
) -> (f64, f64, f64) {
    let k_coefficient = -1.0 * air_density * air_friction;
    let powder_effects = if air_friction != 0.0 {
        (temperature.as_kelvin() / 288.13 - 1.0) / 40.0 + 1.0
    } else {
        1.0
    };

    let mut current_time = 0.0;
    let mut current_position = Vector3::default();
    let mut last_position = Vector3::default();
    let mut current_velocity = Vector3::new(
        0.0,
        powder_effects * muzzle_velocity * fire_angle_rad.cos(),
        powder_effects * muzzle_velocity * fire_angle_rad.sin(),
    );
    let wind = Vector3::new(cross_wind, tail_wind, 0.0);

    while current_velocity.z() > 0.0 || current_position.z() > height_of_target {
        last_position = current_position;
        let apparent_wind = wind - current_velocity;
        let change_in_velocity =
            GRAVITY_ACCEL + apparent_wind * (k_coefficient * apparent_wind.magnitude());
        current_velocity += change_in_velocity * TIME_STEP;
        current_position += current_velocity * TIME_STEP;
        current_time += TIME_STEP;
    }

    let last_current_ratio =
        (height_of_target - current_position.z()) / (last_position.z() - current_position.z());
    let final_pos = last_position.lerp(&current_position, last_current_ratio);

    (final_pos.x(), final_pos.y(), current_time)
}

#[allow(unused_assignments)]
pub fn find_solution(
    range_to_hit: f64,
    height_to_hit: f64,
    muzzle_velocity: f64,
    air_friction: f64,
    min_elev: f64,
    max_elev: f64,
    high_arc: bool,
) -> (f64, f64, f64) {
    if air_friction == 0.0 {
        let radicand = muzzle_velocity.powi(4)
            - GRAVITY
                * (GRAVITY * range_to_hit.powi(2) + 2.0 * height_to_hit * muzzle_velocity.powi(2));
        if range_to_hit == 0.0 || radicand < 0.0 {
            return (-1.0, -1.0, -1.0);
        }
        let radicand = radicand.sqrt();
        let angle_root =
            (muzzle_velocity.mul_add(muzzle_velocity, radicand) / (GRAVITY * range_to_hit)).atan();
        if angle_root > max_elev || angle_root < min_elev {
            return (-1.0, -1.0, -1.0);
        }
        let tof = range_to_hit / (muzzle_velocity * angle_root.cos());
        return (range_to_hit, angle_root, tof);
    }

    let mut number_of_attempts = 50;
    let mut result_distance = -1.0;
    let mut result_time = -1.0;
    let mut search_min = min_elev;
    let mut search_max = max_elev;
    let mut current_error = 9999.0;
    let mut current_elevation = -1.0;
    loop {
        number_of_attempts -= 1;
        current_elevation = (search_min + search_max) / 2.0;
        let (_, shot_distance, shot_time) = shot(
            current_elevation,
            muzzle_velocity,
            height_to_hit,
            0.0,
            0.0,
            Temperature::new_15c(),
            1.0,
            air_friction,
        );
        result_distance = shot_distance;
        result_time = shot_time;
        if !result_distance.is_nan() {
            current_error = range_to_hit - result_distance;
        }
        if (current_error > 0.0) != !high_arc {
            search_max = current_elevation;
        } else {
            search_min = current_elevation;
        }
        if number_of_attempts == 0 {
            break;
        }
        if (search_max - search_min) <= 0.000025 {
            break;
        }
    }
    if current_error.abs() > (range_to_hit * 0.001 * (if high_arc { 1.0 } else { 2.0 })) {
        return (-1.0, -1.0, -1.0);
    }

    (result_distance, current_elevation, result_time)
}

#[cfg(test)]
mod tests {
    use std::f64::consts::FRAC_PI_4;

    use crate::common::Temperature;

    use super::shot;

    #[test]
    fn test_shot() {
        let (x, y, result_time) = shot(
            FRAC_PI_4,
            400.0,
            0.0,
            0.0,
            0.0,
            Temperature::new_15c(),
            1.0,
            -0.00005,
        );
        assert_eq!(x, 0.0);
        assert_eq!(y, 10331.03903821219); // old ace: 10330.2
        assert_eq!(result_time, 50.31666666666509); // old ace: 50.3167
    }

    #[test]
    fn find_solution() {
        let (result_distance, current_elevation, result_time) =
            super::find_solution(1000.0, 0.0, 400.0, -0.00005, -5.0, 80.0, true);
        assert_eq!(result_distance, 999.6287373584529); // old ace: 999.773
        assert_eq!(current_elevation, 1.5223753452301025); // old ace: 1.52238
        assert_eq!(result_time, 69.69999999999733); // old ace: 69.7
    }
}
