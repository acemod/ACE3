use std::f64::consts::PI;

use rand::{distributions::Uniform, prelude::Distribution};
use rand_chacha::ChaCha8Rng;

use crate::{
    ballistics::{
        atmosphere::{
            calculate_air_density, calculate_atmospheric_correction, calculate_roughness_length,
            speed_of_sound, AtmosphereModel,
        },
        drag::{calculate_retard, DragFunction},
        map::Map,
    },
    common::{Temperature, Vector3, GRAVITY_ACCEL},
};

const STD_AIR_DENSITY_ICAO: f64 = 1.22498;

pub struct Bullet {
    pub air_friction: f64,
    pub bullet_caliber: f64,
    pub bullet_length: f64,
    pub bullet_mass: f64,
    pub ballistic_coefficients: Vec<f64>,
    pub velocity_boundaries: Vec<f64>,
    pub atmosphere_model: AtmosphereModel,
    pub drag_function: DragFunction,
    pub muzzle_velocities: Vec<f64>,
    pub barrel_length: f64,
    pub stability_factor: f64,
    pub twist_direction: f64,
    pub transonic_stability_coefficient: f64,
    pub bullet_velocity_last_frame: Vector3,
    pub origin: Vector3,
    pub latitude: f64,
    pub temperature: Temperature,
    pub altitude: f64,
    pub humidity: f64,
    pub overcast: f64,
    pub start_time: f64,
    pub last_frame: f64,
    pub rng: ChaCha8Rng,
}

impl Bullet {
    pub fn simulate(
        &mut self,
        map: &Map,
        bullet_velocity_current_frame: Vector3,
        bullet_position: Vector3,
        mut wind: Vector3,
        height_atl: f64,
        tick_time: f64,
    ) -> Vector3 {
        const EARTH_ANGULAR_SPEED: f64 = 0.000_072_92;
        let mut tof = tick_time - self.start_time;
        let delta_time = tick_time - self.last_frame;

        let temperature =
            Temperature::new_celsius(self.temperature.as_celsius() - 0.0065 * bullet_position.z());
        let pressure = (1010.32 - 10.0 * self.overcast)
            * (1.0
                - (0.0065 * (self.altitude + bullet_position.z()))
                    / 0.0065f64.mul_add(self.altitude, temperature.as_kelvin()))
            .powf(5.255_754_495);

        self.last_frame = tick_time;

        if wind.magnitude() > 0.1 {
            let mut wind_attenuation = 1.0;
            let wind_source_terrain = bullet_position - wind.normalize() * 100.0;

            let grid_x = (wind_source_terrain.x() / 50.0).floor() as i64;
            let grid_y = (wind_source_terrain.y() / 50.0).floor() as i64;
            let grid_cell = grid_x * map.grids() as i64 + grid_y;

            if grid_cell >= 0 {
                let grid_cell = grid_cell as usize;
                if grid_cell < map.heights().len() && grid_cell < map.building_nums().len() {
                    let grid_height = map.height(grid_cell) as f64;
                    if grid_height > bullet_position.z() {
                        let angle = ((grid_height - bullet_position.z()) / 100.0).atan();
                        wind_attenuation *= angle.cos().abs().powi(2);
                    }
                }
            }

            if height_atl > 0.0 && height_atl < 20.0 {
                let wind_source_obstacles = bullet_position - wind.normalize() * 25.0;
                let roughness_length = calculate_roughness_length(
                    map,
                    wind_source_obstacles.x(),
                    wind_source_obstacles.y(),
                );
                wind_attenuation *=
                    0.0f64.max(height_atl / roughness_length.log(20.0 / roughness_length));
            }

            wind *= wind_attenuation;
        }

        let mut velocity_offset = Vector3::default();

        {
            let mut bullet_velocity = self.bullet_velocity_last_frame;
            let mut time = 0.0;
            while time < delta_time {
                let dt = (delta_time - time).min(0.005);
                let drag_ref = -self.air_friction * bullet_velocity.magnitude_squared();
                let accel_ref = bullet_velocity.normalize() * drag_ref;

                velocity_offset += accel_ref * dt;
                bullet_velocity -= accel_ref * dt;
                bullet_velocity += GRAVITY_ACCEL * dt;

                time += dt;
            }
        }

        let mut bullet_velocity = self.bullet_velocity_last_frame;
        let mut time = 0.0;
        tof -= delta_time;

        while time < delta_time {
            let dt = (delta_time - time).min(0.005 * 2.0);

            let mut true_velocity = bullet_velocity - wind;

            let sound_speed = speed_of_sound(temperature);
            if self.transonic_stability_coefficient < 1.0
                && true_velocity.magnitude() < 1.2 * sound_speed
                && true_velocity.magnitude() > sound_speed
            {
                let distribution = Uniform::from(-10.0..10.0);
                let offset = Vector3::new(
                    distribution.sample(&mut self.rng),
                    distribution.sample(&mut self.rng),
                    distribution.sample(&mut self.rng),
                );
                let coef = 1.0 - self.transonic_stability_coefficient;
                let true_speed = true_velocity.magnitude();
                true_velocity += offset * coef;
                true_velocity = true_velocity.normalize() * true_speed;
            }

            let drag = if self.ballistic_coefficients.len() == self.velocity_boundaries.len() + 1 {
                let mut ballistic_coefficient = self.ballistic_coefficients[0];
                for (i, boundry) in self.velocity_boundaries.iter().enumerate() {
                    if true_velocity.magnitude() < *boundry {
                        ballistic_coefficient = self.ballistic_coefficients[i + 1];
                        break;
                    }
                }

                ballistic_coefficient = calculate_atmospheric_correction(
                    ballistic_coefficient,
                    temperature,
                    pressure,
                    self.humidity,
                    self.atmosphere_model,
                );

                calculate_retard(
                    self.drag_function,
                    ballistic_coefficient,
                    true_velocity.magnitude(),
                    speed_of_sound(temperature),
                )
            } else {
                let air_density = calculate_air_density(temperature, pressure, self.humidity);
                let air_friction = self.air_friction * air_density / STD_AIR_DENSITY_ICAO;

                -air_friction * true_velocity.magnitude_squared()
            };

            let accel = true_velocity.normalize() * drag;

            velocity_offset -= accel * dt;
            bullet_velocity -= accel * dt;

            if tof > 0.0 {
                let bullet_dir = bullet_velocity.x().atan2(bullet_velocity.y());
                let drift_accel = self.twist_direction
                    * (0.048_225_1 * (self.stability_factor + 1.2))
                    / tof.powf(0.17);
                let drift_velocity = 0.058_102_5 * (self.stability_factor + 1.2) * tof.powf(0.83);
                let drag_correction = (drift_velocity / true_velocity.magnitude()) * drag;
                let magnitude = (drift_accel + drag_correction) * dt;
                let offset = Vector3::new(
                    (bullet_dir + PI / 2.0).sin() * magnitude,
                    (bullet_dir + PI / 2.0).cos() * magnitude,
                    0.0,
                );
                velocity_offset += offset;
                bullet_velocity += offset;
            }

            let lat = self.latitude;
            let accel = Vector3::new(
                2.0 * EARTH_ANGULAR_SPEED
                    * (bullet_velocity.y() * lat.sin() - bullet_velocity.x() * lat.cos()),
                2.0 * EARTH_ANGULAR_SPEED * -(bullet_velocity.x() * lat.sin()),
                2.0 * EARTH_ANGULAR_SPEED * (bullet_velocity.x() * lat.cos()),
            );

            velocity_offset += accel * dt;
            bullet_velocity -= accel * dt + GRAVITY_ACCEL * dt;

            tof += dt;
            time += dt;
        }
        self.bullet_velocity_last_frame = bullet_velocity_current_frame + velocity_offset;
        velocity_offset
    }
}
