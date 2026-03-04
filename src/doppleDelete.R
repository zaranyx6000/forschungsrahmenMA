# --- Duplikate entfernen (Rohtext-basiert), erste Version behalten ---
bib_path <- "bib/reference.bib"
out_path <- "bib/reference.bib"
stopifnot(file.exists(bib_path))

lines <- readLines(bib_path, warn = FALSE)

# Entry-Startzeilen
starts <- grep("^\\s*@\\w+\\s*\\{", lines)
keys <- sub("^\\s*@\\w+\\s*\\{\\s*([^,\\s]+)\\s*,.*$", "\\1", lines[starts])
keys <- trimws(keys)

# Für jede Startzeile das Ende des Eintrags bestimmen (bis zur nächsten Startzeile - 1, sonst bis EOF)
ends <- c(starts[-1] - 1, length(lines))

# Duplikate identifizieren: alle späteren Vorkommen entfernen
dup_start_positions <- starts[duplicated(keys)]
dup_blocks <- Map(seq, dup_start_positions, ends[match(dup_start_positions, starts)])

# Zeilenindizes zum Entfernen
remove_idx <- sort(unique(unlist(dup_blocks)))

# Bereinigt schreiben
clean_lines <- lines[-remove_idx]
writeLines(clean_lines, out_path)

cat("Geschrieben:", out_path, "\n")