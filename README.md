# Welcome to MotoGP Data and Analytics like never before

> **What makes this repository special?**
>
> - 🏆 **First of its kind:** There has been a lack of any MotoGP data—let alone advanced statistics—about this great sport. This is a comprehensive, structured, and regularly updated MotoGP data repository (currently only for the current season (2025).
> - ⏱ **Timely updates:** Data will be updated one day after each race-weekend (exact timing note yet determined) in 2025 and every update will be documented under /data/releases.
> - ✅ **Verified accuracy:** All data is verified against the official standings on [motogp.com](https://motogp.com) (IN PROGRESS, NOT YET IMPLEMENTED, CHECKS ARE STILL MANUAL).
> - 📦 **Open access:** The raw data as well as advanced analytics and race reports are freely downloadable as CSV and .md files. (Later to follow are Embedded PowerBI reports).
> - 🤝 **Community-driven:** Users are invited to create their own analyses with the raw datain any format (f.e. Jupyter Notebooks, sql queries, csv, PowerBI files etc.) and upload them here—let’s grow the MotoGP analytics community together!

---

This repository is the central hub for collecting, sharing, and analyzing MotoGP statistics—currently focused on the ongoing season, with plans to include all historical data. All results are persisted in a (currently only local) MySQL database and made available for community-driven analytics and reporting.

---

## 🏗️ Data Architecture: Medallion Approach

- **Bronze Layer:** Raw data ingested as-is from sources (currently: API -> CSVs -> MySQL).
- **Silver Layer:** Cleaned, standardized, and normalized data—ensuring quality and consistency.
- **Gold Layer:** Race-ready, analytical data—modeled and aggregated for reporting and advanced analytics (what ends up here on GitHub).

---

## 📊 Project Overview

- **MotoGP Data Collection:** Scripts and notebooks fetch, parse, (and verify) MotoGP race data.
- **ETL Pipelines:** Data flows from Bronze to Silver to Gold layers, enabling robust analytics.
- **Data Modeling:** Clear schemas for riders, teams, races, results, and more.
- **Analytics & Reporting:** Advanced analytics, queries, and visualizations to analyze performance, trends, and history.
- **Community Analysis:** A dedicated place for everyone to contribute their own notebooks, visualizations, and findings.

---

## 🗂️ Repository Structure

```
motogp-data/
│
├── data/
│   ├── releases/   
│
├── community/
│
├── docs/
│   ├── schema.md
│   ├── query_gallery.md
│   ├── dwh_architecture.md
│   ├── dwh_modeling_guidelines.md
│   └── load_strategy.md
│
├── dwh_engineering/
│   ├── scripts/                   
│   └── tests/
│
├── README.md
└── CONTRIBUTING.md

```

---

## 🚦 Current Features

- Fetches and stores MotoGP race results for the current season.
- Bronze/Silver/Gold medallion pipeline for data quality and traceability. 
- **Community hub**: Share your own notebooks and findings!

---

## 🚧 Roadmap

- [ ] Expand coverage to include all historical MotoGP seasons.
- [ ] Integrate more dashboards (Power BI/Tableau/similar).
- [ ] Automate data updates and data verification.
- [ ] Grow the community section with more user submissions and collaborative projects.
- [ ] All data is downloadable, API-accessible, and ready for analysis.
- [ ] Improve analytics with visualizations
- [ ] Add curated md-reports for each race weekend and the state of the season after each one.

---

## 📖 Documentation

- All scripts, data model diagrams and process outlines are in the `docs/` folder.
- See [docs/CONTRIBUTING.md](docs/CONTRIBUTING.md) for details on how to contribute your analysis.
- For a detailed breakdown of the database schema and analytics queries, see the documentation and `data/README.md`.

---

## 💡 Contributing

We encourage you to:

- Download and explore the data
- Create and share your own analysis or reports in the `/community` folder
- Submit issues or pull requests for improvements or corrections
- Help build the MotoGP analytics community!

---

## 🛡️ License

This project is licensed under the [MIT License](LICENSE). Contributions are welcome!

---

## 👤 Author

Hi! I’m **Max**.  
I’m passionate about motorsports, data analysis, SQL and building open-source solutions to make statistics accessible and insightful for everyone and on the way learn to work with SQL.

Feel free to open issues, suggest improvements, or contribute directly!

---

## 🌐 Contact & Links

- [GitHub Profile](https://github.com/MojoRisin46)
- [Issues & Feature Requests](https://github.com/MojoRisin46/motogp-data/issues)
