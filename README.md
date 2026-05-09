# 🏠 Real Estate Analysis in Paris

> A data engineering project to analyze real estate prices in Paris using public French data sources.

---

## 👥 Team

- **Ahmed Maala** — ahmed4maala@gmail.com
- **Natalja Voth**

## 🎯 Project Goal

Build an ETL pipeline to analyze real estate prices in Paris using:
- DVF dataset (property sales)
- opendata.paris API (rent control, risk sectors, green spaces)

## 📊 Data Sources

| # | Source | Description | Link |
|---|--------|-------------|------|
| 1 | DVF 2022 | Property sales in France | [data.gouv.fr](https://www.data.gouv.fr/fr/datasets/demandes-de-valeurs-foncieres/) |
| 2 | opendata.paris | Paris open data portal | [opendata.paris.fr](https://opendata.paris.fr/) |
| 3 | Risk Sectors | Flood risk areas | [link](https://opendata.paris.fr/explore/dataset/plu-secteurs-de-risques-delimites-par-le-ppri/) |
| 4 | Rent Control | Legal rent prices | [link](https://opendata.paris.fr/explore/dataset/logement-encadrement-des-loyers/) |
| 5 | Green Spaces | Open spaces to be planted | [link](https://opendata.paris.fr/explore/dataset/plu-espaces-libres-a-vegetaliser-elv/) |

## 🛠️ Tech Stack

- **Language:** Python 3.11+
- **Libraries:** pandas, numpy, matplotlib, seaborn, requests
- **Notebooks:** Jupyter
- **Database:** PostgreSQL (Step 2)
- **BI Tool:** Power BI (Step 4)
- **Version Control:** Git + GitHub

## 📁 Project Structure

\`\`\`
real-estate-paris/
├── data/
│   ├── raw/          # Original data (not in Git)
│   └── processed/    # Cleaned data
├── notebooks/        # Jupyter exploration notebooks
├── scripts/          # Python production scripts
├── reports/
│   └── figures/      # Charts and visualizations
├── docs/             # Documentation
├── requirements.txt  # Python dependencies
└── README.md         # This file
\`\`\`

## 🚀 Setup Instructions

\`\`\`bash
# 1. Clone the repository
git clone https://github.com/[username]/real-estate-paris.git
cd real-estate-paris

# 2. Create virtual environment
python -m venv venv

# 3. Activate virtual environment
# Windows:
.\venv\Scripts\Activate.ps1
# Mac/Linux:
source venv/bin/activate

# 4. Install dependencies
pip install -r requirements.txt
\`\`\`

## 📅 Project Timeline

| Step | Description | Deadline |
|------|-------------|----------|
| 1 | Unstructured Data Exploration | May 14, 2026 |
| 2 | Data Modeling (3NF) | May 28, 2026 |
| 3 | ETL Pipeline | June 8, 2026 |
| 4 | Power BI Dashboard + Defense | June 15, 2026 |

## 👨‍🏫 Mentor

**Yaniv** — Data Engineer at Liora

---

*Project developed as part of the Liora Data Engineering Training Program.*