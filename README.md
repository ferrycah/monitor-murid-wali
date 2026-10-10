# 🌟 HebatKita: Pemantauan Peserta Didik & Portofolio 360° (Wali Kelas)

[![Vercel Deployment](https://img.shields.io/badge/Deploy-Vercel-black?style=for-the-badge&logo=vercel)](https://vercel.com)
[![Supabase Database](https://img.shields.io/badge/Database-Supabase-3ECF8E?style=for-the-badge&logo=supabase)](https://supabase.com)
[![Tailwind CSS](https://img.shields.io/badge/Style-Tailwind_CSS-38B2AC?style=for-the-badge&logo=tailwind-css)](https://tailwindcss.com)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=for-the-badge)](LICENSE)

Aplikasi pemantauan karakter terpadu berbasis program **7 Kebiasaan Anak Indonesia Hebat** (Kemendikdasmen) dan **Portofolio Siswa 360°**, dirancang khusus untuk **Guru Wali (Wali Kelas)** dalam mendampingi **16 Siswa Binaan** di **SMP Negeri 1 Simpang Empat, Kabupaten Tanah Bumbu, Kalimantan Selatan**.

---

## 🎯 Gambaran Umum Proyek

Aplikasi ini mengadopsi filosofi **Zero-Input Burden for Teachers**:
* **Siswa (Pelapor Aktif)**: Melakukan checklist mandiri 7 kebiasaan setiap hari (1–2 menit) dan melengkapi profil minat/kesehatan.
* **Orang Tua (Verifikator Rumah)**: Melakukan konfirmasi checklist dari rumah dengan satu klik.
* **Guru Wali (Supervisor & Analis)**: Menerima rekapitulasi otomatis, notifikasi realtime, memetakan kebutuhan bimbingan akademik, dan mencetak laporan portofolio 360°.

---

## 🚀 Fitur Unggulan

### 1. ⚡ Sinkronisasi Realtime Supabase (Live Sync)
* Perubahan status pendaftaran, persetujuan akun, dan pengisian jurnal harian langsung ter-update di Dasbor Guru Wali secara **realtime tanpa reload halaman**.
* Dilengkapi indikator koneksi cloud interaktif (*Live Connected*).

### 2. 📝 Formulir Onboarding Siswa 2-Tahap (*Profile Enrichment*)
* Saat pertama kali mendaftar, siswa memilih salah satu dari 16 nama binaan dan mengisi data pengayaan:
  * **Cita-Cita Masa Depan** & **Pilihan Ekstrakurikuler di SMPN 1 Simpang Empat**.
  * **Minat & Hobi Waktu Luang**.
  * **Radar Belajar**: Mapel paling disukai vs Mapel yang dirasa butuh bantuan/bimbingan (*Early Academic Warning*).
  * **Catatan Medis Khusus**: Riwayat alergi, asma, atau kacamata (vital untuk keselamatan olahraga & kegiatan luar).
  * **Pola Istirahat**: Baseline jam tidur & bangun.
  * **Kontak Mandiri**: Nomor WhatsApp pribadi siswa.

### 3. 📊 Analitik Visual Interaktif (Chart.js)
* **Grafik Capaian 7 Kebiasaan Kelas**: Bar chart persentase pencapaian per kebiasaan hari ini.
* **Donut Chart Distribusi Cita-Cita**: Pemetaan karier impian 16 siswa binaan.
* **Wawasan Medis & Pembelajaran**: Ringkasan siswa dengan perhatian medis khusus dan mapel prioritas bimbingan.

### 4. 🖨️ Cetak Portofolio 360° Resmi (Print-to-PDF Ready)
* Dilengkapi layout cetak standar kedinasan dengan Kop Resmi SMP Negeri 1 Simpang Empat.
* Memuat buku induk Dapodik, nilai 11 mata pelajaran rapor semester 1, rekap karakter 7 kebiasaan, catatan kesehatan, serta lembar pengesahan tanda tangan Guru Wali, Orang Tua, dan Kepala Sekolah.

### 5. 📥 Ekspor Rekapitulasi Data (Excel / CSV)
* Satu klik untuk mengunduh rekapitulasi lengkap 16 siswa ke format `.csv` untuk arsip spreadsheet atau evaluasi dewan guru.

### 6. 🔐 Autentikasi Terpadu Google Sign-In & PIN Gatekeeper
* **Google Sign-In**: Akses 1-klik untuk ketiga aktor (Guru Wali, Orang Tua, dan Siswa Binaan). Mendukung Supabase OAuth di cloud dan Interactive Google Chooser di lingkungan lokal.
* **Pengaman Dasbor Wali**: Modal gerbang keamanan dengan proteksi Google Account atau PIN rahasia 6-digit serta fitur *Kunci Dasbor* / ubah PIN.
* **Portal Khusus Orang Tua**: Alur verifikasi klaim anak (verifikasi tahun lahir & nama orang tua di Dapodik) serta aksi pengesahan (*parent approval*) jurnal 7 kebiasaan.

### 7. 🛡️ Dual-Mode Storage
* Terhubung otomatis dengan cloud **Supabase** (Postgres + Auth + Realtime).
* Dilengkapi *Offline / LocalStorage Fallback* otomatis jika koneksi internet terputus.

---

## 📂 Struktur Repositori

```text
├── index.html          # Single Page Application (UI Siswa + Dasbor Wali + Modal 360°)
├── data_siswa.json     # Master Data 16 Siswa Binaan (Dapodik & Nilai Rapor Semester 1)
├── schema.sql          # Skema Database PostgreSQL Supabase + View Analitik + Realtime
├── vercel.json         # Konfigurasi deployment & security headers Vercel
├── .env.example        # Template variabel lingkungan Supabase
├── .gitignore          # Konfigurasi file yang diabaikan git
├── CATATAN_PROYEK.md   # Catatan kronologis perkembangan dan log keputusan proyek
└── README.md           # Dokumentasi teknis proyek
```

---

## 🛠️ Panduan Instalasi & Setup

### 1. Setup Database Supabase
1. Buka [Supabase Dashboard](https://supabase.com) dan buat project baru.
2. Buka menu **SQL Editor** -> **New Query**.
3. Salin seluruh isi berkas [`schema.sql`](schema.sql) dan klik **Run**.
4. Database tabel `students`, `habit_logs`, view `view_student_overview`, serta Realtime Replication telah aktif secara otomatis!

### 2. Dapatkan API Key Supabase
1. Masuk ke **Project Settings** -> **API**.
2. Salin:
   * **Project URL** (contoh: `https://xyzcompany.supabase.co`)
   * **Anon Public Key** (contoh: `eyJhbGciOiJIUzI1NiIsInR5cCI6...`)

### 3. Hubungkan ke Aplikasi
* **Cara Cepat (Di Browser)**: Buka aplikasi, masuk ke tab **Dasbor Wali**, klik ikon roda gigi (⚙️) di pojok kanan atas, lalu tempelkan Project URL dan Anon Key. Konfigurasi tersimpan otomatis!

---

## 🌐 Panduan Deployment ke Vercel

1. Push folder proyek ini ke repository **GitHub** Anda:
   ```bash
   git init
   git add .
   git commit -m "feat: initial commit HebatKita Supabase + Vercel"
   git branch -M main
   git remote add origin https://github.com/<username>/<repo-name>.git
   git push -u origin main
   ```
2. Buka [Vercel Dashboard](https://vercel.com) -> Klik **Add New Project**.
3. Pilih repositori GitHub Anda.
4. Klik **Deploy** (Tanpa konfigurasi build karena arsitektur static modern zero-build).
5. Aplikasi Anda langsung aktif dan dapat diakses publik melalui domain `https://<nama-proyek>.vercel.app`!

---

## 👥 Profil 16 Siswa Binaan Wali Kelas

1. **Muhammad Patin Ramadhan** (NIS: 25-7788, NISN: 0123650010)
2. **Muhammad Risvan** (NIS: 25-7800, NISN: 0117670148)
3. **Muhyin Hidayat** (NIS: 25-7808, NISN: 0123356606)
4. **Nadia Khayrunisa** (NIS: 25-7813, NISN: 3124392297)
5. **Nida Khofiyya** (NIS: 25-7824, NISN: 3121967398)
6. **Nur Alya Najwa** (NIS: 25-7834, NISN: 0125382499)
7. **Parikesit Sakadhipa** (NIS: 25-7838, NISN: 0127391470)
8. **Rahmat Bagoes Mahadana Lestari** (NIS: 25-7849, NISN: 0135672098)
9. **Riyan Firman Fadilah** (NIS: 25-7862, NISN: 0132223382)
10. **Rumaisya Aliqha Dewi** (NIS: 25-7867, NISN: 3129320730)
11. **Tri Wibowo** (NIS: 25-7886, NISN: 0126940070)
12. **Vicka Dhiya Ananda** (NIS: 25-7890, NISN: 0126095447)
13. **Wafiq Azizah** (NIS: 25-7892, NISN: 0135220367)
14. **Zhahra Izna Maharani** (NIS: 25-7904, NISN: 0121309430)
15. **Muhammad Zidane Al Rezky** (NIS: 26-8277, NISN: 0137821216)
16. **Maulana Husna** (NIS: 26-8276, NISN: 3128738580)

---

## 📜 Lisensi & Atribusi
Dikembangkan untuk Guru Wali SMP Negeri 1 Simpang Empat, Tanah Bumbu, Kalimantan Selatan.
Lisensi di bawah **MIT License**.
