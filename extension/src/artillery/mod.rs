use std::f64::consts::{FRAC_PI_4, PI};

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

fn calc_range_table_line(range_to_hit: f64, muzzle_velocity: f64, air_friction: f64, min_elev: f64, max_elev: f64, high_arc: bool) -> Option<[Box<String>; 12]> {
    let (actual_distance, line_elevation, line_tof) = simulate::find_solution(range_to_hit, 0.0, muzzle_velocity, air_friction, min_elev, max_elev, high_arc);
    if line_tof < 0.0 {
        return None;
    }
    let (_, line_height_elevation, line_height_tof) = simulate::find_solution(range_to_hit, -100.0, muzzle_velocity, air_friction, min_elev, max_elev, high_arc);

    let (dr_elev_adjust, dr_tof_adjust) = if line_height_elevation > 0.0 {
        (
            format!("{:.0}", (line_height_elevation - line_elevation) * 3200.0 / PI),
            format!("{:.1}", line_height_tof - line_tof),
        )
    } else {
        (String::from("-"), String::from("-"))
    };

    let (
        crosswind_offset,
        headwind_offset,
        tailwind_offset,
        temp_dec_offset,
        temp_inc_offset,
        air_density_dec_offset,
        air_density_inc_offset,
    ) = if air_friction != 0.0 {
        (
            {
                let (x_offset, _, _) = simulate::shot(line_elevation, muzzle_velocity, 0.0, 10.0, 0.0, Temperature::new_15c(), 1.0, air_friction);
                format!("{:0width$.1}", x_offset.atan2(actual_distance) / 10.0 * 3200.0 / PI, width = 1)
            },
            {
                let (_, y_offset, _) = simulate::shot(line_elevation, muzzle_velocity, 0.0, 0.0, -10.0, Temperature::new_15c(), 1.0, air_friction);
                let headwind_offset = (actual_distance - y_offset) / 10.0;
                format!("{:0width$.precision$}", headwind_offset, width = 1, precision = if headwind_offset.abs() > 9.949 { 1 } else { 0 })
            },
            {
                let (_, y_offset, _) = simulate::shot(line_elevation, muzzle_velocity, 0.0, 0.0, 10.0, Temperature::new_15c(), 1.0, air_friction);
                let tailwind_offset = (actual_distance - y_offset) / 10.0;
                format!("{:0width$.precision$}", tailwind_offset, width = 1, precision = if tailwind_offset.abs() > 9.949 { 1 } else { 0 })
            },
            {
                let (_, y_offset, _) = simulate::shot(line_elevation, muzzle_velocity, 0.0, 0.0, 0.0, Temperature::new_celsius(5.0), 1.0, air_friction);
                let temp_dec_offset = (actual_distance - y_offset) / 10.0;
                format!("{:0width$.precision$}", temp_dec_offset, width = 1, precision = if temp_dec_offset.abs() > 9.949 { 1 } else { 0 })
            },
            {
                let (_, y_offset, _) = simulate::shot(line_elevation, muzzle_velocity, 0.0, 0.0, 0.0, Temperature::new_celsius(25.0), 1.0, air_friction);
                let temp_inc_offset = (actual_distance - y_offset) / 10.0;
                format!("{:0width$.precision$}", temp_inc_offset, width = 1, precision = if temp_inc_offset.abs() > 9.949 { 1 } else { 0 })
            },
            {
                let (_, y_offset, _) = simulate::shot(line_elevation, muzzle_velocity, 0.0, 0.0, 0.0, Temperature::new_15c(), 0.9, air_friction);
                let air_density_dec_offset = (actual_distance - y_offset) / 10.0;
                format!("{:0width$.precision$}", air_density_dec_offset, width = 1, precision = if air_density_dec_offset.abs() > 9.949 { 1 } else { 0 })
            },
            {
                let (_, y_offset, _) = simulate::shot(line_elevation, muzzle_velocity, 0.0, 0.0, 0.0, Temperature::new_15c(), 1.1, air_friction);
                let air_density_inc_offset = (actual_distance - y_offset) / 10.0;
                format!("{:0width$.precision$}", air_density_inc_offset, width = 1, precision = if air_density_inc_offset.abs() > 9.949 { 1 } else { 0 })
            },
        )
    } else {
        (String::from("-"), String::from("-"), String::from("-"), String::from("-"), String::from("-"), String::from("-"), String::from("-"))
    };

    Some([
        Box::new(format!("{:.0}", range_to_hit)),
        Box::new(format!("{:.0}", line_elevation * 3200.0 / PI)),
        Box::new(dr_elev_adjust),
        Box::new(dr_tof_adjust),
        Box::new(format!("{:.precision$}", line_tof, precision = if line_tof < 99.945 { 1 } else { 0 })),
        Box::new(crosswind_offset),
        Box::new(headwind_offset),
        Box::new(tailwind_offset),
        Box::new(temp_dec_offset),
        Box::new(temp_inc_offset),
        Box::new(air_density_dec_offset),
        Box::new(air_density_inc_offset),
    ])
}
