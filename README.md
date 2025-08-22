# 📊 User Behavior Analysis - Technical Test

## 📌 Objective
Proyek ini dibuat untuk menganalisis perilaku pengguna menggunakan dataset **Users_Data**, **Cards_Data**, dan **Transactions_Data**.  
Analisis dilakukan menggunakan **SQL (BigQuery)**, **Google Looker Studio**, dan didokumentasikan dalam bentuk **dashboard** serta **presentasi**.  

> ⚠️ Catatan: Dataset **Transactions_Data** dibatasi hingga **10.000 rows** dikarenakan saya tidak punya akun berbayar GCS karena filenya terlalu berat.

---

## ⚙️ How to Run

1. **Import Dataset**
   - Upload dataset ke BigQuery:
     - `Users_Data`
     - `Cards_Data`
     - `Transactions_Data` (dibatasi 10.000 rows)

2. **Run SQL Queries**
   - Gunakan script di file [`queries.sql`](./queries.sql)
   - Script sudah dipisahkan per section (KPI dan Analysis Views).
   - Setiap query akan membuat **View** di BigQuery.

3. **Connect to Looker Studio**
   - Hubungkan project BigQuery ke Looker Studio.
   - Gunakan Views yang sudah dibuat (`kpi_total_users`, `top_users_view`, dll).
   - Bangun dashboard sesuai layout.

4. **Presentation**
   - Lihat file [`presentation.pdf`](./presentation.pdf) untuk penjelasan hasil analisis.

---

## 📑 Deliverables

- ✅ SQL Script: [`queries.sql`](./queries.sql)  
- ✅ Documentation: `README.md`  
- ✅ Presentation: `presentation.pdf`  
- ✅ Dashboard: [Looker Studio Link](#)  

---

## 🛠️ Tools Used
- **BigQuery** (SQL Analysis)
- **Google Looker Studio** (Dashboard)
- **Google Slides** (Presentation)
- **GitHub** (Submission Repository)

---

## 👤 Author
*Muh Rifky Parahian Sopian - rifkyparahian2@gmail.com*  
Technical Test 1 - Data Analyst
