use crate::common::GRAVITY;

const SIMULATION_STEP: f64 = 0.05;
const MAX_ITERATIONS: u16 = 600;
const MAX_ELEVATION: f64 = 20.0;
const PRECISION: f64 = 0.1;

fn trace_bullet(
    init_speed: f64,
    air_friction: f64,
    angle: f64,
    angle_target: f64,
    distance: f64,
) -> f64 {
    let mut vel_x = angle.to_radians().cos() * init_speed;
    let mut vel_y = angle.to_radians().sin() * init_speed;
    let pos_target_x = angle_target.to_radians().cos() * distance;
    let pos_target_y = angle_target.to_radians().sin() * distance;
    let mut pos_x = 0.0;
    let mut pos_y = 0.0;
    let mut last_pos_x = 0.0;
    let mut last_pos_y = 0.0;

    for _ in 0..MAX_ITERATIONS {
        last_pos_x = pos_x;
        last_pos_y = pos_y;
        let vel_mag = vel_x.hypot(vel_y);
        pos_x += vel_x * SIMULATION_STEP * 0.5;
        pos_y += vel_y * SIMULATION_STEP * 0.5;
        vel_x += SIMULATION_STEP * (vel_x * vel_mag * air_friction);
        vel_y += SIMULATION_STEP * (vel_y * vel_mag * air_friction - GRAVITY);
        pos_x += vel_x * SIMULATION_STEP * 0.5;
        pos_y += vel_y * SIMULATION_STEP * 0.5;
        if pos_x >= pos_target_x {
            break;
        }
    }

    let coef = (pos_target_x - last_pos_x) / (pos_x - last_pos_x);
    (pos_y - last_pos_y).mul_add(coef, last_pos_y) - pos_target_y
}

pub fn get_solution(init_speed: f64, air_friction: f64, angle_target: f64, distance: f64) -> f64 {
    if trace_bullet(
        init_speed,
        air_friction,
        MAX_ELEVATION,
        angle_target,
        distance,
    ) < 0.0
    {
        return MAX_ELEVATION - angle_target;
    }

    let mut a1 = angle_target;
    let mut a2 = MAX_ELEVATION;
    let mut f1 = trace_bullet(init_speed, air_friction, a1, angle_target, distance);
    if f1.abs() <= PRECISION {
        return 0.0;
    }
    while f1.abs() > PRECISION {
        let f2 = trace_bullet(init_speed, air_friction, a2, angle_target, distance);
        let tmp = a2 - f2 * (a2 - a1) / (f2 - f1);
        a1 = a2;
        a2 = tmp;
        f1 = f2;
    }
    a2 - angle_target
}

#[cfg(test)]
mod tests {
    use std::f64::EPSILON;

    use super::get_solution;

    #[test]
    fn test_get_solution() {
        assert!(get_solution(400.0, 0.0, 28.0, 950.0) - -8.0 < EPSILON)
    }
}
