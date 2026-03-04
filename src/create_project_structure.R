# =========================================================
# create_project_structure.R
# - tidyverse-style data pipeline + GitHub Pages
# - docs/ reserved for HTML website output (GitHub Pages)
# - documentation/ contains technical documentation (md)
# =========================================================

cat("Creating project directory structure...\n")

dirs <- c(
  
  # data pipeline
  "data/01_raw/oecd",
  "data/01_raw/bfs",
  "data/01_raw/pendon",
  
  "data/02_intermediate/extracted",
  "data/02_intermediate/cleaned",
  "data/02_intermediate/harmonised",
  
  "data/03_final/panel",
  "data/03_final/indices",
  
  # source code (src with subfolders)
  "src/00_pipeline",
  "src/01_import",
  "src/02_transform",
  "src/03_model",
  "src/04_export",
  "src/utils",
  
  # outputs (tables/plots/logs)
  "outputs/tables",
  "outputs/plots",
  "outputs/logs",
  
  # GitHub Pages / Quarto website output directory
  "docs",
  
  # technical documentation (keep separate from website)
  "documentation"
)
