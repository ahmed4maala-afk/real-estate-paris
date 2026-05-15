# Step 2 — Database Modeling Progress Notes

**Project:** Real Estate Analysis in Paris  
**Phase:** Step 2 — Database Modeling (3NF Snowflake)  
**Deadline:** May 28, 2026  
**Last Updated:** May 15, 2026

---

## 🎯 Yaniv's Decisions (Meeting May 15, 2026)

### Scope Update
- Focus on **2-3 datasets** (not all 5)
- Primary: **DVF** (Property Transactions)
- Secondary: **Open Spaces** (Green Spaces)
- Third: TBD (Rent Control or Risk Sectors)

### Schema Choice
- **Type:** 3NF Snowflake Schema
- **Tool:** Draw.io for UML diagram
- **Process:** Diagram → Yaniv reviews → Implementation in Snowflake SQL

### Important Rules
- ⚠️ Don't build tables before diagram is approved by Yaniv
- ⚠️ Send drafts to Yaniv for early feedback
- ⚠️ Implementation uses Snowflake SQL (not PostgreSQL as initially planned)

---

## 📅 Timeline

| Date | Milestone |
|------|-----------|
| May 15, 2026 | Initial meeting with Yaniv ✅ |
| May 18-21, 2026 | Design Draw.io diagram |
| May 22, 2026 (6 PM) | Check-in with Yaniv |
| May 28, 2026 | Final submission of Step 2 |

---

## 🤝 Work Distribution

### Natalja Voth
- Lead Draw.io diagram design
- Identify entities and attributes
- Define relationships between tables
- Send drafts to Yaniv

### Ahmed Maala
- Research 3NF Snowflake best practices
- Support with technical concepts (PKs, FKs, normalization)
- GitHub management
- Prepare SQL planning notes for future implementation

### Together
- Choose datasets (2-3)
- Define main entities
- Review diagram before sending to Yaniv
- Attend May 22 meeting

---

## 📋 Action Items

### From Yaniv's Meeting Recap

- [x] Send GitHub invite to Yaniv (Ahmed)
- [ ] Wait for Draw.io link from Yaniv
- [ ] Draft 3NF Snowflake schema (DVF + Green Spaces)
- [ ] Send drafts to Yaniv for early feedback
- [ ] Attend Thursday May 22 at 6 PM check-in

---

## 💡 Initial Entity List (Draft)

### From DVF Dataset
1. **Property Transaction** (Fact Table)
   - transaction_id (PK)
   - date_mutation
   - valeur_fonciere
   - nature_mutation
   - property_id (FK)
   - location_id (FK)

2. **Property**
   - property_id (PK)
   - type_local
   - surface_reelle_bati
   - nombre_pieces_principales

### From Open Spaces Dataset
3. **Green Space**
   - green_space_id (PK)
   - name
   - type
   - surface
   - year_opened
   - year_renovated

### Shared Dimensions
4. **Location / Neighborhood**
   - location_id (PK)
   - code_postal
   - nom_commune
   - latitude
   - longitude
   - district

5. **Time / Date**
   - date_id (PK)
   - full_date
   - year
   - month
   - quarter

---

## ❓ Questions for Discussion

### Internal (with Natalja)
1. Which third dataset should we add? (Rent Control or Risk Sectors)
2. How granular should our Location dimension be?

### For Yaniv (May 22 meeting)
1. Is our entity list complete?
2. Should we include the third dataset now or later?
3. How does the Snowflake-specific syntax differ from standard SQL?

---

## 📚 Learning Resources

### 3NF Normalization
- Goal: Eliminate data redundancy
- Steps: 1NF → 2NF → 3NF
- Each non-key attribute depends on the key, the whole key, and nothing but the key

### Snowflake Schema
- Fact table at center
- Dimension tables can have sub-dimensions
- Better normalization than Star Schema
- Suitable for hierarchical data (e.g., country → city → district → neighborhood)

---

## 🔗 Important Links

- **GitHub Repo:** https://github.com/ahmed4maala-afk/real-estate-paris
- **Draw.io:** https://app.diagrams.net
- **Step 1 Final Report:** `/reports/Step1_Final_Report.pdf`

---

**Status:** Planning phase — waiting for Yaniv's Draw.io link