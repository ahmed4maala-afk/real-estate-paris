# 🏠 Real Estate Analysis in Paris

A data engineering project to analyze real estate prices in Paris using public French data sources.

---

## 👥 Team

- **Ahmed Maala** — ahmed4maala@gmail.com
- **Natalja Voth** — nvwonthave@gmail.com

**Mentor:** Yaniv (Data Engineer at Liora)

---

## 🎯 Project Goal

Build an ETL pipeline to analyze real estate prices in Paris using:
- DVF dataset (property sales)
- opendata.paris API (rent control, risk sectors, green spaces)

---

## 📊 Data Sources

| # | Source | Description | Link |
|---|--------|-------------|------|
| 1 | DVF 2022 | Property sales in France | [data.gouv.fr](https://www.data.gouv.fr/fr/datasets/demandes-de-valeurs-foncieres-geolocalisees/) |
| 2 | opendata.paris | Paris open data portal | [opendata.paris.fr](https://opendata.paris.fr) |
| 3 | Risk Sectors | Flood risk areas (PLU Bioclimatique 2024) | `plub_pprizone` |
| 4 | Rent Control | Legal rent prices | `logement-encadrement-des-loyers` |
| 5 | Green Spaces | Open spaces to be planted (PLU Bioclimatique 2024) | `plub_elpv` |

---

## 🛠️ Tech Stack

- **Language:** Python 3.11+
- **Libraries:** pandas, numpy, matplotlib, seaborn, requests
- **Notebooks:** Jupyter
- **Database:** Snowflake (Step 2+)
- **Schema:** 3NF Snowflake Schema
- **Modeling Tool:** Draw.io
- **BI Tool:** Power BI (Step 4)
- **Version Control:** Git + GitHub

---

## 📁 Project Structure
real-estate-paris/
│
├── data/
│   ├── raw/              # Original datasets (gitignored)
│   └── processed/        # Cleaned datasets (gitignored)
│├── design/               # Step 2: UML diagrams (Draw.io)
│
├── docs/                 # Team reports & documentation
│   └── step2/            # Step 2 progress notes
│
├── notebooks/            # Jupyter analysis notebooks
│
├── reports/              # Final deliverables
│   └── Step1_Final_Report.pdf
│
├── scripts/              # Python production scripts
│
├── .gitignore
├── README.md
└── requirements.txt
---

## 🚀 Setup Instructions

### 1. Clone the repository
```bash
git clone https://github.com/ahmed4maala-afk/real-estate-paris.git
cd real-estate-paris
```

### 2. Create virtual environment
```bash
python -m venv venv
```

### 3. Activate virtual environment

**Windows:**
```bash
.\venv\Scripts\Activate.ps1
```

**Mac/Linux:**
```bash
source venv/bin/activate
```

### 4. Install dependencies
```bash
pip install -r requirements.txt
```

---

## 📅 Project Timeline

| Step | Description | Deadline | Status |
|------|-------------|----------|--------|
| 1 | Unstructured Data Exploration | May 14, 2026 | ✅ Done |
| 2 | Data Modeling (3NF Snowflake) | May 28, 2026 | 🔄 In Progress |
| 3 | ETL Pipeline | June 8, 2026 | ⏳ Pending |
| 4 | Power BI Dashboard + Defense | June 15, 2026 | ⏳ Pending |

---

## 📊 Step 1 — Data Exploration (✅ Completed)

### Results
- **DVF 2022:** Cleaned from 4.67M to 45,207 Paris transactions (99.4% memory reduction)
- **API Integration:** 18,921 records from 3 opendata.paris datasets
- **Total:** 64,128 high-quality records across 4 datasets

### Deliverables
- `notebooks/01_data_exploration.ipynb` — DVF analysis
- `notebooks/02_opendata_paris_api.ipynb` — API integration
- `reports/Step1_Final_Report.pdf` — Comprehensive Step 1 report

---

## 🗂️ Step 2 — Database Modeling (🔄 In Progress)

### Approach (Decided by Yaniv on May 15, 2026)
- **Schema Type:** 3NF Snowflake Schema
- **Tool:** Draw.io for UML diagram
- **Implementation:** Snowflake SQL

### Focus Datasets
1. DVF 2022 (Property Transactions) — Primary
2. Open Spaces (Green Spaces) — Secondary
3. Additional dataset (TBD)

### Process
1. **Design** UML diagram in Draw.io
2. **Validate** diagram with Yaniv
3. **Implement** approved schema in Snowflake SQL

### Next Check-in
**Thursday, May 22, 2026 at 6 PM** — Review schema draft with Yaniv

---

## 📝 License

This project is part of the Liora Data Engineering Training program.

---

**Last Updated:** May 15, 2026