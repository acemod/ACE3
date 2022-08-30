use arma_rs::Group;

use crate::common::Temperature;

mod atmosphere;
mod bullet;
mod drag;
mod map;
mod zero;

use self::{
    atmosphere::{calculate_atmospheric_correction, speed_of_sound},
    drag::calculate_retard,
};

pub use self::{atmosphere::AtmosphereModel, drag::DragFunction, map::Map};

#[derive(Debug)]
pub enum BallisticModel {
    Vanilla(
        /// Air friction
        f64,
    ),
    Advanced(AdvancedBallistics),
}

#[derive(Debug)]
pub struct AdvancedBallistics {
    temperature: Temperature,
    pressure: f64,
    relative_humidity: f64,
    ballistic_coefficient: f64,
    drag_function: DragFunction,
    atmosphere_model: AtmosphereModel,
}

impl AdvancedBallistics {
    #[must_use]
    pub const fn temperature(&self) -> Temperature {
        self.temperature
    }

    #[must_use]
    pub const fn pressure(&self) -> f64 {
        self.pressure
    }

    #[must_use]
    pub const fn relative_humidity(&self) -> f64 {
        self.relative_humidity
    }

    #[must_use]
    pub const fn ballistic_coefficient(&self) -> f64 {
        self.ballistic_coefficient
    }

    #[must_use]
    pub const fn drag_function(&self) -> DragFunction {
        self.drag_function
    }

    #[must_use]
    pub const fn atmosphere_model(&self) -> AtmosphereModel {
        self.atmosphere_model
    }
}

#[must_use]
pub fn group() -> Group {
    Group::new()
        .command("retard", retard)
        .command("atmospheric_correction", atmospheric_correction)
        .command("replicate_vanilla_zero", replicate_vanilla_zero)
        .command("zero_vanilla", zero_vanilla)
        .command("zero_advanced", zero_advanced)
        .group("bullet", bullet::group())
        .group("map", map::group())
}

fn retard(
    drag_function: DragFunction,
    ballistic_coefficient: f64,
    velocity: f64,
    temperature: Temperature,
) -> f64 {
    calculate_retard(
        drag_function,
        ballistic_coefficient,
        velocity,
        speed_of_sound(temperature),
    )
}

fn atmospheric_correction(
    ballistic_coefficient: f64,
    temperature: Temperature,
    pressure: f64,
    relative_humidity: f64,
    atmosphere_model: AtmosphereModel,
) -> f64 {
    calculate_atmospheric_correction(
        ballistic_coefficient,
        temperature,
        pressure,
        relative_humidity,
        atmosphere_model,
    )
}

fn replicate_vanilla_zero(zero_range: f64, muzzle_velocity: f64, air_friction: f64) -> f64 {
    zero::replicate_vanilla(zero_range, muzzle_velocity, air_friction)
}

fn zero_vanilla(zero_range: f64, muzzle_velocity: f64, air_friction: f64, bore_height: f64) -> f64 {
    zero::calculate(
        zero_range,
        muzzle_velocity,
        bore_height,
        BallisticModel::Vanilla(air_friction),
    )
}

#[allow(clippy::too_many_arguments)]
fn zero_advanced(
    zero_range: f64,
    muzzle_velocity: f64,
    bore_height: f64,
    temperature: Temperature,
    pressure: f64,
    relative_humidity: f64,
    ballistic_coefficient: f64,
    drag_function: DragFunction,
    atmosphere_model: AtmosphereModel,
) -> f64 {
    zero::calculate(
        zero_range,
        muzzle_velocity,
        bore_height,
        BallisticModel::Advanced(AdvancedBallistics {
            temperature,
            pressure,
            relative_humidity,
            ballistic_coefficient,
            drag_function,
            atmosphere_model,
        }),
    )
}
