pub fn break_line(line: String) -> String {
    let mut out = Vec::with_capacity(line.len() / 14);
    let words: Vec<&str> = line.split(' ').collect();
    let mut buffer = String::new();
    for word in words {
        if buffer.len() + word.len() > 14 {
            out.push(buffer.trim_end().to_string());
            buffer = String::new();
        }
        buffer.push_str(word);
        buffer.push(' ');
    }
    if !buffer.is_empty() {
        out.push(buffer.trim_end().to_string());
    }
    out.join("<br/>")
}

#[cfg(test)]
mod tests {
    #[test]
    fn break_line() {
        assert_eq!(
            super::break_line("The advanced combat environment mod is now rusty".to_string()),
            "The advanced<br/>combat<br/>environment<br/>mod is now<br/>rusty"
        );
        assert_eq!(
            super::break_line("test hello can you hear me? I'm the arma man".to_string()),
            "test hello can<br/>you hear me?<br/>I'm the arma<br/>man"
        );
    }
}
