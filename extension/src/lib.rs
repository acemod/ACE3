#![deny(clippy::all)]
#![deny(missing_debug_implementations)]

//! ACE3 Extension for quick maths and OS APIs

use arma_rs::{arma, Extension, Group};

mod artillery;
pub mod ballistics;
mod break_line;
mod common;
mod fcs;

#[cfg(feature = "clipboard")]
mod clipboard;

#[arma]
fn init() -> Extension {
    Extension::build()
        .version(env!("GIT_HASH").to_string())
        .group("artillery", artillery::group())
        .group("ballistics", ballistics::group())
        .group(
            "clipboard",
            if cfg!(feature = "clipboard") {
                clipboard::group()
            } else {
                Group::new()
            },
        )
        .command("break_line", break_line::break_line)
        .command("fcs", fcs::get_solution)
        .command("version", || env!("GIT_HASH"))
        .finish()
}
