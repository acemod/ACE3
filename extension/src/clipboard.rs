use arboard::Clipboard;
use arma_rs::{FromArma, Group, loadout::Loadout};

pub fn group() -> Group {
    Group::new()
        .command("clear", clear)
        .command("append", append)
        .command("complete", complete)
        .command("loadout", loadout)
}

static mut BUFFER: String = String::new();

pub fn clear() {
    // Safety: this is all single threaded, so no need to lock
    unsafe {
        BUFFER.clear();
    }
}

pub fn append(text: String) {
    // Safety: this is all single threaded, so no need to lock
    unsafe {
        BUFFER.push_str(&text);
    }
}

pub fn complete() -> Result<(), String> {
    let mut clipboard = Clipboard::new().map_err(|e| e.to_string())?;
    // Safety: this is all single threaded, so no need to lock
    unsafe {
        clipboard
            .set_text(BUFFER.clone())
            .map_err(|e| e.to_string())?;
        BUFFER = String::new();
    }
    Ok(())
}

pub fn loadout() -> Option<String> {
    let mut clipboard = match Clipboard::new().map_err(|e| e.to_string()) {
        Ok(clipboard) => clipboard,
        Err(e) => {
            eprintln!("Clipboard error: {e}");
            return None;
        }
    };
    let content = clipboard.get_text().ok()?;
    match Loadout::from_arma(content.clone()) {
        Ok(_) => return Some(content),
        Err(e) => eprintln!("Loadout parsing error: {e}"),
    }
    None
}
