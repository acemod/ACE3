use std::ops::Deref;

use arma_rs::{FromArma, FromArmaError};

#[derive(Debug, Clone, Copy)]
/// Muzzle velocity in m/s
pub struct MuzzleVelocity(f64);

impl MuzzleVelocity {
    #[allow(dead_code)] // Only used in tests
    pub fn new(muzzle_velocity: f64) -> Self {
        Self(muzzle_velocity)
    }
}

impl FromArma for MuzzleVelocity {
    fn from_arma(value: String) -> Result<Self, FromArmaError> {
        Ok(Self(value.parse::<f64>().map_err(|_| {
            FromArmaError::InvalidValue("Invalid muzzle velocity".into())
        })?))
    }
}

impl AsRef<f64> for MuzzleVelocity {
    fn as_ref(&self) -> &f64 {
        &self.0
    }
}

impl Deref for MuzzleVelocity {
    type Target = f64;

    fn deref(&self) -> &Self::Target {
        &self.0
    }
}
