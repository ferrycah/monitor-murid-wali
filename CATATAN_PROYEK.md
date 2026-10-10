# Log & Catatan Perkembangan Proyek: Aplikasi Pemantauan Peserta Didik (Guru Wali)

Dokumen ini mencatat seluruh rangkuman percakapan, ide, keputusan teknis, arsitektur, dan progres pengerjaan aplikasi pemantauan peserta didik untuk guru wali.

---

## [2026-10-01] Sesi 1: Brainstorming & Saran Awal

### 1. Konteks & Tujuan
* **Tujuan**: Membangun aplikasi pemantauan peserta didik khusus implementasi Guru Wali (Wali Kelas).
* **Masalah yang Diselesaikan**:
  * Catatan perkembangan murid yang tercecer di berbagai media (buku fisik, WhatsApp, lembar presensi).
  * Ketiadaan profil 360° yang terpadu saat dibutuhkan (evaluasi, rapat dewan guru, panggilan orang tua).

### 2. Modul & Fitur yang Direkomendasikan
1. **Profil Murid 360°**: Data pokok, kontak orang tua (akses cepat WhatsApp/telepon), catatan latar belakang/kesehatan khusus.
2. **Jurnal Perkembangan & Perilaku**:
   * Catatan positif / apresiasi / prestasi.
   * Catatan pembinaan / pelanggaran / tindak lanjut / rujukan ke Guru BK.
3. **Presensi & Pola Kehadiran**: Rekap Sakit, Izin, Alpa, Terlambat, serta *Early Warning System* jika alpa berturut-turut.
4. **Monitoring Akademik**: Daftar siswa yang memerlukan remedial/bimbingan per mata pelajaran.
5. **Log Komunikasi Orang Tua**: Riwayat panggilan, chat WA, dan dokumentasi kunjungan rumah (*home visit*).
6. **Ekspor & Pelaporan**: Cetak berkas laporan PDF/Excel untuk evaluasi semester atau bahan rapat wali murid.

### 3. Rencana Bertahap (Roadmap MVP)
* **Fase 1 (MVP)**: Data Murid + Jurnal Catatan Harian Perilaku + Tombol Cepat Kontak WhatsApp Ortu.
* **Fase 2**: Presensi Harian + Analisis Pola Kehadiran.
* **Fase 3**: Akademik / Remedial + Ekspor Laporan PDF/Excel.
* **Fase 4**: Portal Akses Wali Murid (opsional di masa depan).

### 4. Hal yang Sedang Menunggu Keputusan
* Jenjang pendidikan (SD, SMP, SMA/SMK, atau Pesantren).
* Cakupan pengguna: Single-user (khusus satu guru wali) atau Multi-user (seluruh guru di sekolah).
* Preferensi teknologi (contoh: Next.js/React, Laravel, atau desktop offline-friendly).

---

## [2026-10-05] Sesi 2: Perumusan Indikator Pemantauan "7 Kebiasaan Anak Indonesia Hebat"

### 1. Landasan Program
Mengintegrasikan program Gerakan **7 Kebiasaan Anak Indonesia Hebat (Kemendikdasmen)** sebagai inti pembentukan karakter dalam aplikasi pemantauan peserta didik.

### 2. Rincian Indikator Data Pemantauan per Kebiasaan
1. **Bangun Pagi**:
   * Jam bangun tidur (target < 05.00 / sebelum subuh).
   * Jam tiba di sekolah (sinkronisasi dari presensi).
   * Kondisi kesiapan pagi (segar vs lesu/mengantuk).
2. **Beribadah**:
   * Ibadah wajib harian (sesuai agama/kepercayaan masing-masing).
   * Partisipasi ibadah di sekolah (salat berjamaah/dhuha atau doa bersama/kebaktian).
   * Pembiasaan literasi kitab suci / doa harian.
3. **Berolahraga**:
   * Aktivitas fisik harian (minimal 15-30 menit) / senam sekolah / PJOK.
   * Jenis kegiatan (jalan kaki/sepeda, olahraga permainan, senam).
4. **Makan Sehat dan Bergizi**:
   * Sarapan pagi sebelum berangkat sekolah (Ya/Tidak).
   * Membawa bekal makanan bergizi (prinsip Isi Piringku: protein, sayur, buah).
   * Membawa botol minum / tumbler air putih & kontrol jajanan ultra-proses.
5. **Gemar Belajar**:
   * Jam belajar mandiri / mengulang pelajaran di rumah.
   * Literasi membaca buku non-pelajaran (jumlah halaman/judul buku - Pojok Baca).
   * Ketepatan waktu pengumpulan tugas / PR.
6. **Bermasyarakat**:
   * Sikap sosial di sekolah (gotong royong piket, tolong menolong, ramah 5S, anti-bullying).
   * Keterlibatan sosial di rumah/lingkungan (kegiatan warga, membantu keluarga).
7. **Tidur Cepat (Istirahat Cukup)**:
   * Jam tidur malam (target < 21.00 atau 21.30).
   * Durasi istirahat cukup (7-9 jam).
   * Disiplin *screen time* (tanpa gawai menjelang tidur).

### 3. Keputusan Desain: Pembagian Peran Aktor Aplikasi (Role Model)
Telah disepakati model pembagian tugas agar tidak membebani guru wali:
* **Siswa (Pelapor Utama)**:
  * Mengisi checklist mandiri harian 7 kebiasaan (1-2 menit, antarmuka ramah anak).
* **Orang Tua (Verifikator)**:
  * Memvalidasi/konfirmasi kebiasaan harian/mingguan anak dari rumah.
  * Memberikan catatan perkembangan ringan jika diperlukan.
* **Wali Kelas (Supervisor / Dasbor Pemantauan)**:
  * **Bebas beban input data harian** (Zero-input burden for daily habits).
  * Memantau dasbor rekapitulasi kelas (persentase kebiasaan, tren).
  * Menerima notifikasi/indikator siswa yang butuh perhatian (misal: sering tidur larut, tidak sarapan).
  * Menggunakan data analitik untuk evaluasi, rapat dewan guru, konseling, atau rapor karakter.

---

## [2026-10-05] Sesi 3: Data Siswa & Mekanisme Login Siswa

### 1. Daftar Peserta Didik (16 Siswa)
Telah didata sebanyak 16 siswa:
1. Muhammad Patin Ramadhan
2. Muhammad Risvan
3. Muhyin Hidayat
4. Nadia Khayrunisa
5. Nida Khofiyya
6. Nur Alya Najwa
7. Parikesit Sakadhipa
8. Rahmat Bagoes Mahadana Lestari
9. Riyan Firman Fadilah
10. Rumaisya Aliqha Dewi
11. Tri Wibowo
12. Vicka Dhiya Ananda
13. Wafiq Azizah
14. Zhahra Izna Maharani
15. Muhammad Zidane Al Rezky
16. Maulana Husna

### 2. Opsi Mekanisme Login
* **Opsi A (Paling Standar & Direkomendasikan)**:
  * Username: **NISN** (10 digit)
  * Password/PIN: **Tanggal Lahir (DDMMYYYY)** atau 4 digit terakhir NISN.
* **Opsi B (Paling Praktis untuk Kelas Terbatas)**:
  * Pilih Nama Siswa dari Dropdown/Grid + Masukkan PIN 4 digit / Tanggal Lahir.
* **Opsi C (Modern / QR Code)**:
  * Setiap siswa dibagikan Kartu QR Code Keberhasilan (tinggal scan kamera HP).
* *(Status: Ditunda sementara, fokus beralih ke infrastruktur database lebih dulu).*

---

## [2026-10-05] Sesi 4: Evaluasi Infrastruktur Database (Google Spreadsheet vs Supabase)

### 1. Usulan Pengguna
Menggunakan **Google Spreadsheet** sebagai basis data (*database*) utama pencatatan, bukan Supabase.

### 2. Analisis Kelayakan & Keuntungan
* **Sangat Sesuai untuk Skala Kelas (16 Siswa)**:
  * 16 murid $\times$ 1 log per hari = 16 baris/hari $\approx$ 480 baris/bulan. Spreadsheet mampu menampung hingga 10 juta sel, sehingga kapasitas sangat melimpah.
* **Familiar & Fleksibel untuk Guru**:
  * Guru tidak perlu belajar query SQL atau membuka konsol database rumit.
  * Guru bisa langsung melihat, mengedit manual, membuat filter, pivot table, dan mencetak laporan Excel/PDF langsung dari Google Drive.
* **Biaya Nol & Tanpa Server Eksternal**:
  * Tidak ada biaya bulanan atau konfigurasi server database berbayar.

### 3. Arsitektur Teknis yang Direkomendasikan (Google Apps Script API)
* **Frontend Web App** $\longleftrightarrow$ **Google Apps Script (Web App Deployment JSON API)** $\longleftrightarrow$ **Google Sheet Tab (Data)**.
* **Struktur Lembar Kerja (Sheets)**:
  1. `Siswa`: [NISN, Nama, PIN/Tanggal Lahir, Kontak_Ortu, Status]
  2. `Jurnal_Kebiasaan`: [ID, Tanggal, NISN, Bangun_Pagi, Ibadah, Olahraga, Makan_Sehat, Belajar, Bermasyarakat, Tidur_Cepat, Catatan_Siswa, Waktu_Input]
  3. `Validasi_Ortu`: [ID_Jurnal, Tanggal_Validasi, Status_Valid, Catatan_Ortu]

---

## [2026-10-05] Sesi 5: Solusi Antarmuka Modern (CSS/UI) & Peran Google Apps Script

### 1. Pertanyaan Pengguna
Kekhawatiran bahwa antarmuka di Google Apps Script (GAS) kaku dan tidak bisa didesain dengan CSS menarik.

### 2. Solusi Arsitektur: "Headless Google Spreadsheet"
* **GAS Tidak Digunakan untuk Merender Tampilan**:
  * GAS murni bertindak sebagai **Mesin API Backend (Headless)** untuk membaca dan menulis data ke Spreadsheet secara tidak terlihat di balik layar (*silent background request*).
* **Frontend Dibuat Mandiri & Modern**:
  * Menggunakan teknologi web modern (Tailwind CSS, icon animasi, glassmorphism, responsive mobile UI).
  * Hosting gratis dan super cepat via Vercel, Netlify, atau GitHub Pages.
  * Tampilan bisa didesain sekaya dan seinteraktif mungkin (kartu warna-warni, efek centang, streak reward untuk siswa).
* **Catatan Tambahan**:
  * Jika suatu saat ingin memakai `HtmlService` bawaan GAS pun, Tailwind CSS dan CDN styling tetap bisa dimasukkan, namun pemisahan Frontend modern + GAS Headless API memberikan pengalaman visual dan performa terbaik tanpa batasan iframe Google.

---

## [2026-10-05] Sesi 6: Implementasi Prototipe Tampilan Web & Skrip Backend Spreadsheet

### 1. File yang Dibuat
* **[index.html](file:///e:/project%20antigravity/monitor%20murid%20wali/index.html)**:
  * Antarmuka web modern dengan Tailwind CSS, font Plus Jakarta Sans, dan ikon Lucide.
  * **3 Tampilan Utama Terintegrasi**:
    1. *Tab Siswa*: Pilihan 16 nama siswa, kartu interaktif 7 kebiasaan (dengan jam bangun tidur & catatan harian), kalkulasi capaian otomatis (%), serta animasi *confetti* saat seluruh kebiasaan tuntas.
    2. *Tab Orang Tua*: Verifikasi jujur satu klik ("Setujui Jurnal Hari Ini") + kolom catatan untuk wali kelas.
    3. *Tab Dasbor Guru Wali*: Statistik kelas (sudah mengisi vs belum mengisi, validasi ortu, rata-rata indeks kelas), tabel status 16 murid lengkap dengan filter pencarian dan tombol detail.
  * **Penyimpanan Ganda**:
    * Menggunakan LocalStorage browser secara otomatis untuk pengujian langsung tanpa konfigurasi awal.
    * Dilengkapi modal "Setelan API" untuk menempelkan URL Web App Google Apps Script jika ingin langsung sinkron ke Google Drive.
* **[google_apps_script.js](file:///e:/project%20antigravity/monitor%20murid%20wali/google_apps_script.js)**:
  * Kode backend siap pakai untuk menu *Extensions -> Apps Script* pada Google Spreadsheet.
  * Menangani request `doPost` (append baris baru otomatis ke tab `Jurnal_7_Kebiasaan`) dan `doGet` (healthcheck status).
  * Pembuatan header kolom dan pewarnaan otomatis saat pertama kali dijalankan.

---

## [2026-10-05] Sesi 7: Rencana Deployment (Netlify & Google Spreadsheet)

### 1. Pembagian Penempatan File
* **Di Netlify (Hosting Frontend Web)**:
  * File `index.html` (beserta aset web pendukung).
  * Menghasilkan URL publik HTTPS (contoh: `https://pantau-hebat-kelas.netlify.app`) yang siap dibagikan ke siswa dan orang tua.
  * Deployment sangat cepat: bisa via GitHub repo atau drag-and-drop langsung di Netlify Drop.
* **Di Google Drive / Google Spreadsheet (Database & Backend)**:
  * File `google_apps_script.js` tidak diunggah ke Netlify, melainkan disalin ke editor *Ekstensi -> Apps Script* di lembar Google Spreadsheet.
  * Berfungsi menerima data yang dikirim dari web Netlify dan menuliskannya ke baris Spreadsheet.

---

## [2026-10-06] Sesi 8: Keputusan Arsitektur Supabase & Alur Registrasi Berbasis Persetujuan (Approval Flow)

### 1. Perubahan Arah Basis Data: Menggunakan Supabase
Pengguna memutuskan untuk beralih ke **Supabase** sebagai database dan sistem autentikasi utama.

### 2. Alur Registrasi & Verifikasi Akun yang Ditetapkan
1. **Pendaftaran Siswa**:
   * Siswa/orang tua mendaftar akun.
   * Siswa memilih namanya dari daftar 16 siswa binaan.
   * Status akun awal: `Menunggu Persetujuan` (*Pending*). Siswa belum bisa mengisi sebelum divalidasi oleh wali kelas (mencegah akun palsu/iseng).
2. **Persetujuan oleh Guru Wali (Wali Approval)**:
   * Guru wali memiliki dasbor manajemen akun.
   * Terlihat secara transparan:
     - 🟢 **Sudah Terdaftar & Disetujui** (Akun Aktif).
     - 🟡 **Menunggu Persetujuan** (Baru mendaftar, menunggu klik tombol "Setujui" dari wali kelas).
     - 🔴 **Belum Mendaftar** (Nama siswa yang belum membuat akun sama sekali, sehingga wali kelas bisa mengingatkan via WA).
3. **Pengisian Jurnal**:
   * Setelah disetujui, akun siswa dapat login dan mengisi checklist 7 kebiasaan harian secara aman.

### 3. Rancangan Skema Tabel Supabase
1. `students`:
   * `id`, `name`, `status` (belum_daftar, pending, approved), `user_id` (relasi ke auth.users)
2. `habit_logs`:
   * `id`, `student_id`, `date`, `score`, `habit_1` s/d `habit_7`, `habit_1_time`, `student_note`, `parent_approved`, `parent_note`, `created_at`

---

## [2026-10-06] Sesi 9: Pembuatan Schema SQL Supabase & Implementasi Antarmuka Terpadu

### 1. File Database SQL: `schema.sql`
Telah dibuat file **[schema.sql](file:///e:/project%20antigravity/monitor%20murid%20wali/schema.sql)** yang memuat:
* Pembuatan tabel `students` dan pre-insert 16 nama siswa dengan status default `belum_daftar`.
* Pembuatan tabel `habit_logs` lengkap dengan constraint unik per siswa per tanggal.
* Kebijakan Row Level Security (RLS) dan aktivasi Supabase Realtime publication.

### 2. Pembaruan Antarmuka: `index.html`
* **Integrasi Supabase JS v2 Client**.
* **Area Siswa Terbagi 3 Keadaan (State)**:
  1. *Form Login / Register*: Pilihan dropdown 16 siswa (hanya menampilkan siswa yang belum mendaftar).
  2. *Status Pending*: Tampilan ramah "Menunggu Persetujuan Guru Wali".
  3. *Form Jurnal 7 Kebiasaan*: Terbuka penuh setelah akun disetujui.
* **Area Dasbor Wali Kelas**:
  1. *Tab Persetujuan Akun*: Indikator 🟢 Disetujui, 🟡 Menunggu Persetujuan (dengan tombol "Setujui Akun"), dan 🔴 Belum Mendaftar (dengan tombol langsung kirim pengingat WhatsApp).
  2. *Tab Pantauan Jurnal*: Monitoring capaian harian, persentase nilai, dan catatan harian siswa.
  3. *Setelan Koneksi*: Modal input Supabase URL dan Anon Key.

---

## [2026-10-08] Sesi 10: Ekstraksi Data Resmi Buku Induk (31 Siswa) & Upgrade Database 360°

### 1. Sumber Data Resmi
Pengguna mengunggah dokumen pindaian Buku Induk / Lembar Identitas Peserta Didik dari:
* **Sekolah**: **SMP Negeri 1 Simpang Empat**, Kab. Tanah Bumbu, Kalimantan Selatan
* **Rombel**: Kelas VII (Diterima Juli 2025)
* **Total Siswa Terdeteksi & Diekstrak**: **31 Peserta Didik** (dari data awal 16 menjadi 31 lengkap).

### 2. Atribut Data yang Berhasil Diekstrak Penuh (Profil 360°)
Setiap siswa kini memiliki data lengkap:
1. `nis` (Nomor Induk Siswa Sekolah)
2. `nisn` (Nomor Induk Siswa Nasional)
3. `name` (Nama Lengkap Peserta Didik)
4. `birth_place` & `birth_date` (Tempat & Tanggal Lahir)
5. `gender` (Jenis Kelamin) & `religion` (Agama)
6. `address` (Alamat Lengkap Tempat Tinggal)
7. `phone` (Nomor Telepon Rumah / No HP Orang Tua)
8. `previous_school` (Sekolah Asal SD/MI)
9. `father_name` & `mother_name` (Nama Ayah & Ibu)
10. `father_job` & `mother_job` (Pekerjaan Ayah & Ibu)

### 3. File yang Dihasilkan & Diperbarui
* **[data_siswa.json](file:///e:/project%20antigravity/monitor%20murid%20wali/data_siswa.json)**:
  * File basis data JSON yang memuat seluruh 31 profil siswa terstruktur rapi.
* **[schema.sql](file:///e:/project%20antigravity/monitor%20murid%20wali/schema.sql)**:
  * Diperbarui dengan skema tabel `students` yang kaya atribut profil 360°.
  * Dilengkapi query `INSERT ... ON CONFLICT (name) DO UPDATE` untuk seluruh 31 siswa dengan data resmi.
* **[index.html](file:///e:/project%20antigravity/monitor%20murid%20wali/index.html)**:
  * Diperbarui dengan total rombel 31 siswa SMPN 1 Simpang Empat.
  * Dilengkapi **Modal Interaktif Profil 360°** yang menampilkan identitas diri, orang tua, sekolah asal, dan **tombol 1-klik hubungi WhatsApp Ortu** langsung dari buku induk!

---

## [2026-10-08] Sesi 11: Integrasi Leger Nilai Rapor Kelas VII J & Data Dapodik Nasional

### 1. Temuan Penting & Konfirmasi Kelas
* Dokumen ekspor Dapodik dan Leger Nilai Rapor resmi mengonfirmasi bahwa rombel binaan pengguna adalah:
  * **Sekolah**: **SMP Negeri 1 Simpang Empat**, Kab. Tanah Bumbu
  * **Kelas**: **VII J**
  * **Peserta Didik**: **31 Siswa**

### 2. Atribut Baru yang Ditambahkan ke Database (Holistic Student Portfolio)
1. **Nilai Rapor Akademik Semester 1 (11 Mata Pelajaran)**:
   * Pendidikan Agama Islam & Budi Pekerti (PAI)
   * Pendidikan Pancasila (PPKn)
   * Bahasa Indonesia
   * Bahasa Inggris
   * Matematika (Umum)
   * Ilmu Pengetahuan Alam (IPA)
   * Ilmu Pengetahuan Sosial (IPS)
   * Koding dan Kecerdasan Artifisial (Koding & AI)
   * PJOK
   * Seni, Budaya dan Prakarya (SBdP)
   * Informatika
   * Nilai Rata-rata Semester 1 per Siswa.
2. **Data Dapodik Nasional**:
   * NIK Siswa
   * Berat Badan (kg), Tinggi Badan (cm)
   * Moda Transportasi ke Sekolah (Sepeda motor, jalan kaki, dsb.)
   * Detail Kelurahan / RT / RW domisili.

### 3. Pembaruan Aplikasi & Database
* **[data_siswa.json](file:///e:/project%20antigravity/monitor%20murid%20wali/data_siswa.json)**:
  * Berisi 31 objek siswa Kelas VII J lengkap dengan nilai 11 mata pelajaran dan biodata Dapodik.
* **[schema.sql](file:///e:/project%20antigravity/monitor%20murid%20wali/schema.sql)**:
  * Ditambahkan kolom `class_room`, `nik`, `weight_kg`, `height_cm`, dan `academic_grades` (JSONB).
  * Diperbarui skrip SQL untuk meng-insert seluruh nilai akademik dan data fisik siswa.
* **[index.html](file:///e:/project%20antigravity/monitor%20murid%20wali/index.html)**:
  * Tampilan tabel dasbor kini menampilkan **Rerata Nilai Rapor** berdampingan dengan **Skor 7 Kebiasaan (%)**.
  * Modal Profil 360° dilengkapi kotak khusus **"Leger Nilai Rapor Semester 1"** (11 mapel), fisik (BB/TB), dan NIK.

---

## [2026-10-08] Sesi 12: Penegasan Lingkup: Khusus 16 Murid Binaan Wali Kelas (Eliminasi Data Lain)

### 1. Arahan Pengguna
Pengguna menegaskan agar sistem **HANYA memuat 16 murid binaan wali kelas** yang sudah ditentukan di awal percakapan. Seluruh data lain (sekitar 900+ data siswa sekolah dari kelas/jenjang lain di dalam dump Dapodik) harus ditinggalkan dan dibersihkan.

### 2. Daftar 16 Murid Binaan yang Dipertahankan
1. **Muhammad Patin Ramadhan**
2. **Muhammad Risvan**
3. **Muhyin Hidayat**
4. **Nadia Khayrunisa**
5. **Nida Khofiyya**
6. **Nur Alya Najwa**
7. **Parikesit Sakadhipa**
8. **Rahmat Bagoes Mahadana Lestari**
9. **Riyan Firman Fadilah**
10. **Rumaisya Aliqha Dewi**
11. **Tri Wibowo**
12. **Vicka Dhiya Ananda**
13. **Wafiq Azizah**
14. **Zhahra Izna Maharani**
15. **Muhammad Zidane Al Rezky**
16. **Maulana Husna**

### 3. Pembersihan & Pengayaan Data
* **Data di luar 16 siswa binaan telah dibuang 100%**.
* Ke-16 siswa ini diperkaya dengan data resmi dari Buku Induk, Dapodik (NIK, Fisik BB/TB, Kontak Ortu, Alamat, Pekerjaan Ortu), serta Nilai Rapor Semester 1.
* **[data_siswa.json](file:///e:/project%20antigravity/monitor%20murid%20wali/data_siswa.json)**, **[schema.sql](file:///e:/project%20antigravity/monitor%20murid%20wali/schema.sql)**, dan **[index.html](file:///e:/project%20antigravity/monitor%20murid%20wali/index.html)** telah disinkronkan secara ketat menjadi tepat **16 murid**.

---

## [2026-10-08] Sesi 13: Instruksi Pembaruan Eksekusi SQL di Supabase

### 1. Rekomendasi Tindakan
Pengguna disarankan untuk menjalankan ulang skrip terbaru dari **[schema.sql](file:///e:/project%20antigravity/monitor%20murid%20wali/schema.sql)** di SQL Editor Supabase.

### 2. Tujuan & Manfaat Eksekusi Ulang
1. **Pembersihan Otomatis**: Skrip memuat perintah `DELETE FROM students WHERE name NOT IN (...)` sehingga seluruh data siswa di luar 16 murid binaan yang sempat masuk akan terhapus otomatis dari cloud database.
2. **Penambahan Kolom Baru**: Memperbarui struktur tabel `students` dengan kolom `academic_grades` (JSONB nilai 11 mapel), `nik`, `weight_kg`, dan `height_cm`.
3. **Penyimpanan Data Terpadu**: Memasukkan nilai rapor semester 1 dan nomor WhatsApp orang tua ke-16 murid binaan secara akurat.

---

## [2026-10-08] Sesi 14: Penanganan Error SQL: Column "nis" Does Not Exist

### 1. Penyebab Masalah
PostgreSQL Supabase memunculkan error:
`ERROR: 42703: column "nis" of relation "students" does not exist`
Hal ini terjadi karena tabel `students` sebelumnya sudah terlanjur dibuat dengan klausa `CREATE TABLE IF NOT EXISTS` versi lama (yang belum memiliki kolom `nis`, `gender`, `birth_place`, dll). Sehingga saat tabel sudah ada, PostgreSQL melewati pembuatan kolom baru dan langsung mencoba mengeksekusi `INSERT` ke kolom yang belum ada.

### 2. Solusi Teknis
* Memperbarui **[schema.sql](file:///e:/project%20antigravity/monitor%20murid%20wali/schema.sql)** dengan menambahkan perintah reset bersih di awal:
  ```sql
  DROP TABLE IF EXISTS public.habit_logs CASCADE;
  DROP TABLE IF EXISTS public.students CASCADE;
  ```
* Membuat ulang tabel `students` secara murni dan segar (*fresh table*) dengan seluruh kolom lengkap (`nis`, `nisn`, `academic_grades`, `nik`, dll), kemudian memasukkan data tepat 16 murid binaan.

---

## [2026-10-08] Sesi 15: Formulir Onboarding Pendaftaran Siswa (Pengayaan Profil Karakter, Minat & Kesehatan) & Dampak Dasbor Wali

### 1. Arahan & Kebutuhan Pengguna
Pengguna menginginkan agar ketika siswa pertama kali mendaftar akun dan memilih nama binaan, siswa diarahkan untuk mengisi formulir pendaftaran lanjutan (*onboarding profile form*) untuk melengkapi informasi yang belum tercatat di data sekolah/Dapodik, sehingga informasi tersebut langsung memperkaya dan memberi dampak signifikan di dasbor guru wali kelas.

### 2. Parameter Data Baru yang Dihimpun (Formulir Onboarding)
1. **Cita-Cita & Orientasi Profesi Masa Depan**: Pilihan profesi impian (Dokter/Medis, Polisi/TNI, Programmer/AI, Guru, Pengusaha, Atlet, Seniman, dll).
2. **Minat & Hobi Waktu Luang**: Aktivitas favorit siswa di luar jam sekolah.
3. **Pilihan Ekstrakurikuler di SMPN 1 Simpang Empat**: Pemetaan eskul (Pramuka, PMR, Paskibra, Futsal, Seni Musik/Tari, Koding & Robotik, Rohis, English Club).
4. **Radar Pembelajaran & Kebutuhan Bimbingan**:
   * *Mata pelajaran paling disukai/dikuasai*.
   * *Mata pelajaran yang dirasa paling sulit / butuh bimbingan guru* (*early warning* bagi wali kelas untuk pendampingan belajar/tutor sebaya).
5. **Catatan Kesehatan Khusus & Riwayat Alergi**: Catatan vital alergi obat/makanan, asma, riwayat sakit khusus, atau kacamata (sangat penting untuk keamanan saat olahraga/kegiatan luar ruangan).
6. **Pola Istirahat Harian (Baseline 7 Kebiasaan)**: Jam tidur malam biasa & jam bangun subuh/pagi biasa.
7. **Kontak Mandiri Siswa**: Nomor WhatsApp pribadi aktif siswa (untuk keperluan koordinasi tugas & info kelas langsung).
8. **Motto Hidup & Kalimat Motivasi Diri**: Membangun kedekatan emosional dan personalisasi konseling siswa.

### 3. Pembaruan Antarmuka & Alur Sistem (Frontend `index.html`)
* **Alur Pendaftaran Bertingkat (*Two-Step Onboarding Stepper*)**:
  * *Langkah 1 (Akun & Pilihan Murid)*: Siswa memilih salah satu dari 16 nama binaan, memasukkan email dan password akun.
  * *Langkah 2 (Formulir Profil Murid)*: Antarmuka ramah anak dengan kartu isian cita-cita, ekstrakurikuler, refleksi akademik, riwayat kesehatan, dan kebiasaan tidur.
* **Dampak Nyata pada Dasbor Guru Wali**:
  * **Widget Wawasan Karakter & Profil Kelas**: Kartu ringkasan agregat di bagian atas dasbor wali yang menampilkan distribusi cita-cita terbanyak, daftar siswa dengan perhatian medis/alergi, dan mapel yang paling membutuhkan bimbingan kelas.
  * **Tabel Persetujuan Akun**: Diperkaya dengan kolom *Cita-Cita & Eskul*, serta akses kontak ganda (*WA Ortu* dan *WA Siswa*).
  * **Modal Portofolio 360° Siswa**: Menampilkan kartu khusus *Wawasan Minat, Karakter & Kesehatan*, radar bimbingan belajar, serta tombol aksi cepat *Chat Siswa Langsung* dan *Hubungi WA Ortu*.

### 4. Pembaruan Skema Database (`schema.sql`)
Tabel `public.students` diperbarui dengan kolom-kolom profil pengayaan:
* `dream_job` (TEXT)
* `hobbies` (TEXT)
* `extracurricular` (TEXT)
* `fav_subject` (TEXT)
* `difficult_subject` (TEXT)
* `health_notes` (TEXT)
* `target_sleep_time` (TEXT)
* `target_wake_time` (TEXT)
* `student_phone` (TEXT)
* `life_motto` (TEXT)
* `extra_profile` (JSONB)

---

## [2026-10-08] Sesi 16: Modernisasi Arsitektur Produksi (GitHub & Vercel), Supabase Realtime, Visualisasi Chart.js, Ekspor CSV, dan Portofolio PDF

### 1. Arahan & Kebutuhan Pengguna
Pengguna memberikan kebebasan pengembangan arsitektur kode (*"karena ada database di supabase. maka buat aja bebas kode kode nya. karena akan aku buat di github dan vercel. boleh aja kamu buat lebih variatif dan agak kompleks kode kode nya ini"*), sehingga codebase ditransformasikan menjadi arsitektur web produksi tingkat lanjut (*production-grade*) yang siap di-*push* ke **GitHub** dan di-*deploy* langsung ke **Vercel** dengan konfigurasi zero-build modern.

### 2. Konfigurasi Deployment GitHub & Vercel
1. **[vercel.json](file:///e:/project%20antigravity/monitor%20murid%20wali/vercel.json)**:
   * Mengatur *clean URLs*, *trailing slash handling*, dan kompresi aset statis.
   * Dilengkapi *Security Headers* berstandar modern (`X-Content-Type-Options: nosniff`, `X-Frame-Options: SAMEORIGIN`, `Referrer-Policy: strict-origin-when-cross-origin`).
2. **[.gitignore](file:///e:/project%20antigravity/monitor%20murid%20wali/.gitignore)**:
   * Mengabaikan file sensitif kredensial (`.env`, `.env.local`), file temporary IDE/OS (`.DS_Store`, `Thumbs.db`), dan direktori cache.
3. **[.env.example](file:///e:/project%20antigravity/monitor%20murid%20wali/.env.example)**:
   * Template environment variable untuk konfigurasi Supabase Project URL, Anon Key, dan PIN Wali Kelas.
4. **[README.md](file:///e:/project%20antigravity/monitor%20murid%20wali/README.md)**:
   * Dokumentasi komprehensif berstandar repositori GitHub publik/open-source dengan lencana (*badges*), arsitektur alur data, panduan setup database Supabase SQL, panduan deploy instan 1-klik ke Vercel, dan daftar roster 16 siswa binaan.

### 3. Pembaruan Skema Basis Data Supabase (`schema.sql`)
1. **Kolom Baru Catatan Pembinaan**:
   * `teacher_notes` (TEXT): Menyimpan evaluasi dan apresiasi personal dari guru wali kelas.
   * `counseling_logs` (JSONB): Menyimpan riwayat tanggal dan sesi bimbingan konseling.
2. **Database Reporting View (`public.view_student_overview`)**:
   * View PostgreSQL terintegrasi yang menggabungkan biodata siswa, status akun, rerata akademik, profil minat, dan skor habit harian terbaru dalam satu query cepat.
3. **Aktivasi Supabase Realtime Publication**:
   * `ALTER PUBLICATION supabase_realtime ADD TABLE public.students;`
   * `ALTER PUBLICATION supabase_realtime ADD TABLE public.habit_logs;`

### 4. Implementasi Fitur Baru pada Frontend (`index.html`)
1. **Supabase Realtime Channel & Live Sync Indicator**:
   * Indikator status live di header (`#badge-realtime-status`) dengan warna dinamis (Hijau berdenyut = *Realtime Aktif*, Kuning = *Menghubungkan*, Abu-abu = *Lokal/Offline*).
   * Mendengarkan event perubahan basis data tabel `students` dan `habit_logs` secara otomatis tanpa reload halaman.
2. **Visualisasi Analitik Interaktif (Chart.js v4)**:
   * Tombol *Grafik Analitik* untuk menampilkan panel analitik interaktif.
   * **Chart 1 (Bar Chart)**: Persentase capaian 7 Kebiasaan Anak Indonesia Hebat hari ini di antara 16 siswa binaan.
   * **Chart 2 (Doughnut Chart)**: Pemetaan sebaran dan proporsi cita-cita / karier impian siswa.
3. **Fitur Ekspor Rekapitulasi Data ke CSV / Excel-Ready**:
   * Tombol *Ekspor CSV* mengompilasi seluruh data 16 siswa (biodata, status akun, rerata rapor, cita-cita, mapel favorit & sulit, catatan kesehatan, nilai habit harian, nomor kontak, serta catatan wali).
   * Diberikan penanda *Byte Order Mark* (BOM UTF-8 `\uFEFF`) sehingga langsung terbuka rapi berkolom-kolom di Microsoft Excel tanpa error format karakter.
4. **Catatan Konseling & Pembinaan Wali Kelas**:
   * Textarea catatan wali di modal profil siswa yang tersinkronisasi dua arah ke Supabase dan LocalStorage.
5. **Cetak Lembar Portofolio Resmi Siswa (Print-to-PDF)**:
   * Tombol *Cetak Portofolio (PDF)* merender lembar dinas resmi berstandar sekolah:
     - Kop Surat Resmi SMP Negeri 1 Simpang Empat, Kab. Tanah Bumbu.
     - Bagian I: Identitas Buku Induk & Dapodik lengkap.
     - Bagian II: Rekapitulasi Rapor Akademik Semester 1 (tabel lengkap 11 mata pelajaran + nilai rerata).
     - Bagian III: Pemetaan Minat, Bakat, Karakter & Riwayat Kesehatan.
     - Bagian IV: Monitoring 7 Kebiasaan Anak Indonesia Hebat hari ini.
     - Bagian V: Catatan Pembinaan Khusus Guru Wali Kelas.
     - Bagian VI: Lembar Pengesahan Tiga Pihak (Orang Tua Murid, Siswa yang Bersangkutan, dan Guru Wali Kelas).
   * Otomatis memicu dialog cetak peramban / simpan sebagai PDF (`window.print()`).

---

## [2026-10-09] Sesi 17: Pengaman Dasbor Wali Kelas (PIN Gatekeeper & Lock) & Portal Khusus Orang Tua Siswa (Parent Portal & Child Claiming)

### 1. Masalah & Arahan Pengguna
1. **Pengaman Dasbor Wali Kelas**: Dasbor wali sebelumnya terbuka bebas bagi siapa saja yang mengklik tab "Dasbor Wali", sehingga data rahasia Dapodik, nilai rapor, dan catatan bimbingan rentan diakses pihak tak berwenang.
2. **Akses Khusus Orang Tua**: Dibutuhkan portal khusus orang tua yang memungkinkan wali murid mendaftar dengan alamat email, login, lalu mengklaim akun anaknya dengan memasukkan nama anak, tahun lahir (verifikasi Dapodik), dan nama orang tua. Orang tua kemudian dapat memantau dan memberikan pengesahan/validasi resmi terhadap jurnal 7 kebiasaan harian anaknya.

### 2. Implementasi Pengaman Dasbor Wali Kelas
* **PIN Gatekeeper Modal (`#modal-teacher-gate`)**:
  - Saat tab "Dasbor Wali" diklik, sistem memeriksa status autentikasi guru di `sessionStorage`.
  - Jika belum terverifikasi, muncul modal pintu masuk dengan input PIN rahasia (default PIN awal: `123456`).
  - Dilengkapi fitur sembunyikan/tampilkan PIN (toggle mata), pesan kesalahan jika salah input, serta animasi proteksi.
* **Fitur Ganti PIN Wali (`#modal-change-pin`)**:
  - Wali kelas dapat mengubah PIN keamanan kapan saja melalui tombol ikon kunci di bilah navigasi wali.
  - Memvalidasi PIN lama, PIN baru (min. 4 karakter), dan konfirmasi PIN baru. Disimpan di `localStorage` (`hebat_teacher_pin`).
* **Fitur Kunci Dasbor (Logout Sesi Wali)**:
  - Tombol *"Kunci Dasbor"* berwarna merah pada sub-navigasi wali yang langsung menghapus sesi aktif dan mengembalikan layar ke area umum.

### 3. Implementasi Portal Khusus Orang Tua (`#section-ortu`)
* **Navigasi 3 Peran Terpadu di Header**:
  - 🎓 `Siswa` | 👨‍👩‍👧 `Orang Tua` | 🛡️ `Dasbor Wali` (dengan indikator status gembok terkunci/terbuka).
* **Alur Pendaftaran & Autentikasi Orang Tua (`#parent-auth-box`)**:
  - Tab *Masuk* dan *Daftar Baru* dengan email, nama lengkap orang tua/wali, no WhatsApp, dan kata sandi.
* **Alur Verifikasi Klaim Anak (`#parent-claim-box`)**:
  - Orang tua memilih salah satu dari 16 siswa binaan.
  - Memasukkan **Tahun Lahir Anak** (verifikasi 4 digit dengan data `birth_date` Dapodik siswa, misal 2011, 2012, 2013).
  - Memasukkan **Nama Orang Tua** (verifikasi kecocokan dengan `father_name` atau `mother_name` di Buku Induk sekolah).
  - Jika cocok, akun langsung terhubung (*claimed & verified*) dan memicu efek selebrasi confetti.
* **Dasbor Utama Orang Tua (`#parent-dashboard-box`)**:
  - **Banner Hubungan Anak**: Menampilkan nama siswa yang terhubung, NISN, dan tombol ganti tautan anak.
  - **Validasi Jurnal 7 Kebiasaan Hari Ini**:
    * Menampilkan status checklist 7 kebiasaan yang dicentang anak hari ini, persentase nilai, dan cerita pengalaman anak.
    * Kotak aksi pengesahan: Orang tua dapat menuliskan catatan/pesan apresiasi lalu menekan tombol **"✓ Sahkan & Validasi Jurnal Hari Ini"**.
    * Nilai validasi langsung tersinkronisasi ke status `parentApproved` di dasbor siswa dan dasbor guru wali.
  - **Leger Nilai Rapor Semester 1**: Rerata rapor anak dan rincian 11 mata pelajaran.
  - **Wawasan Minat & Karakter**: Cita-cita impian anak, hobi, mapel favorit, mapel butuh bimbingan, catatan medis/alergi, dan jam tidur.
  - **Catatan Pembinaan Guru Wali & Akses WA**: Menampilkan catatan bimbingan guru kelas serta tombol cepat konsultasi via WhatsApp ke Wali Kelas.

---

## [2026-10-10] Sesi 18: Integrasi Google Sign-In (OAuth & Interactive Account Chooser) untuk Guru Wali, Orang Tua, dan Siswa

### 1. Masalah & Permintaan Pengguna
* *"untuk dasbor wali masuknya pakai login with google account sama dengan ortu siswa dan siswa. apa bisa teman ku ?"*
* Membutuhkan integrasi autentikasi modern berbasis **"Sign in with Google" / "Masuk dengan Akun Google"** yang seragam dan praktis untuk seluruh aktor sistem:
  1. **Guru Wali Kelas**: Menggantikan atau melengkapi verifikasi PIN dengan login Akun Google resmi.
  2. **Orang Tua Siswa**: Masuk dan mendaftar menggunakan Akun Google tanpa perlu mengingat kata sandi email manual.
  3. **Siswa Binaan**: Masuk menggunakan Akun Google siswa untuk langsung mengakses lembar 7 kebiasaan atau diarahkan ke registrasi nama.

### 2. Solusi Arsitektur: Dual-Mode Google Authentication
1. **Mode Cloud / Production (Supabase Google OAuth)**:
   * Menggunakan SDK `@supabase/supabase-js` dengan metode `supabaseClient.auth.signInWithOAuth({ provider: 'google', options: { redirectTo: window.location.origin } })`.
   * Mendukung sesi login nyata saat di-deploy ke Vercel/GitHub Pages dengan Supabase Authentication aktif.
   * Dilengkapi fungsi listener `checkSupabaseOAuthCallback()` saat browser kembali dari redirect Google OAuth untuk memulihkan sesi target role (`wali`, `ortu`, atau `siswa`).
2. **Mode Offline / Local & Demo (Interactive Google Account Chooser Modal)**:
   * Karena saat dibuka langsung di browser lokal via `file:///...` atau tanpa setup Google Cloud Console OAuth redirect akan gagal, disediakan dialog simulator resmi **Google Account Chooser Modal (`#modal-google-auth-sim`)**.
   * Menampilkan dialog modal Google bernuansa otentik dengan logo resmi Google, badge peran dinamis, daftar akun instan 1-klik, dan opsi input email `@gmail.com` kustom.
   * Memastikan aplikasi 100% dapat diuji coba seketika (*zero-setup testable*) langsung di laptop pengguna.

### 3. Detail Implementasi Fitur per Peran
* **A. Gerbang Dasbor Guru Wali Kelas / Admin (`#modal-teacher-gate`)**:
  * Tombol utama: *"Masuk dengan Akun Google Guru"* berlogo resmi Google warna-warni.
  * Opsi sekunder: Garis pemisah *"atau PIN Wali"* dengan input PIN 6-digit sebagai alternatif darurat/offline (`123456`).
  * **Proteksi Whitelist Email Admin (`TEACHER_ADMIN_EMAIL`)**:
    - Akun Admin Resmi Bawaan: `wali.kelas7@smpn1simpangempat.sch.id` & `guru.pendamping@gmail.com`.
    - Jika ada siswa atau orang luar yang mencoba masuk ke Dasbor Wali menggunakan email Google lain, sistem **menolak akses** (*Akses Admin Ditolak*).
    - Guru Wali dapat mendaftarkan/mengganti alamat **Email Google Admin Utama** miliknya sendiri melalui tombol **Ikon Kunci (Pengaturan Akun Admin Wali)** di dalam Dasbor Wali.
  * Saat login berhasil, status gembok terbuka (`hebat_wali_authenticated: true`), modal tertutup, memicu animasi *confetti*, dan langsung menampilkan Dasbor Guru Wali Kelas (tempat menyetujui pendaftaran akun siswa di sub-tab *Persetujuan Akun*).
* **B. Portal Orang Tua Murid (`#parent-auth-box`)**:
  * Tombol utama: *"Lanjutkan dengan Akun Google"* berlogo Google.
  * Opsi sekunder: Form input email dan password manual.
  * Akun instan rekomendasi: `kartini.speed@gmail.com`, `yaan.yati@gmail.com`, dan akun custom.
  * Otomatis membuat profil orang tua jika baru pertama kali login, lalu menyimpan sesi ke `current_parent_session_16_wali` dan mengarahkan ke langkah klaim anak atau dasbor orang tua.
* **C. Portal Siswa Binaan (`#siswa-auth-box`)**:
  * Tombol utama: *"Lanjutkan dengan Akun Google"* berlogo Google.
  * Akun instan rekomendasi: `risvan.smpn1@gmail.com`, `patin.ramadhan@gmail.com`, `nadia.khayrunisa@gmail.com`.
  * Sistem otomatis mencocokkan email Google dengan daftar 16 siswa binaan:
    - Jika email atau nama cocok dengan siswa yang sudah terdaftar, langsung login ke akun siswa tersebut.
    - Jika email baru, sistem otomatis mengisikan alamat email tersebut ke formulir registrasi onboarding sehingga siswa tinggal memilih namanya dari 16 daftar siswa.

---
*Catatan akan terus diperbarui seiring berjalannya percakapan dan pengerjaan.*


