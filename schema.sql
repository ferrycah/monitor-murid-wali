-- ====================================================================
-- SKEMA DATABASE SUPABASE: PANTAU 7 KEBIASAAN & PORTOFOLIO 360° SISWA
-- KHUSUS 16 PESERTA DIDIK BINAAN WALI KELAS
-- SMP NEGERI 1 SIMPANG EMPAT, KAB. TANAH BUMBU, KALIMANTAN SELATAN
-- ====================================================================
-- Jalankan skrip ini di Dashboard Supabase -> SQL Editor -> New Query -> Run
-- ====================================================================

-- 1. Reset / Bersihkan Tabel Lama agar Struktur Kolom Diperbarui
DROP VIEW IF EXISTS public.view_student_overview CASCADE;
DROP TABLE IF EXISTS public.habit_logs CASCADE;
DROP TABLE IF EXISTS public.students CASCADE;

-- 2. Buat Ulang Tabel Siswa dengan Kolom Lengkap
CREATE TABLE public.students (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nis TEXT,
    nisn TEXT UNIQUE,
    name TEXT NOT NULL UNIQUE,
    gender TEXT,
    birth_place TEXT,
    birth_date DATE,
    nik TEXT,
    religion TEXT DEFAULT 'Islam',
    address TEXT,
    phone TEXT, -- Kontak Orang Tua dari Dapodik
    previous_school TEXT,
    weight_kg INTEGER,
    height_cm INTEGER,
    father_name TEXT,
    mother_name TEXT,
    father_job TEXT,
    mother_job TEXT,
    registered_email TEXT,
    auth_user_id UUID REFERENCES auth.users(id) ON DELETE SET NULL,
    status TEXT NOT NULL DEFAULT 'belum_daftar' CHECK (status IN ('belum_daftar', 'pending', 'approved')),
    academic_grades JSONB, -- Nilai 11 Mapel & Rerata Rapor

    -- Data Pengayaan Formulir Onboarding Siswa
    dream_job TEXT,            -- Cita-cita profesi masa depan
    hobbies TEXT,              -- Minat & hobi waktu luang
    extracurricular TEXT,      -- Pilihan ekstrakurikuler di SMPN 1
    fav_subject TEXT,          -- Mata pelajaran paling disukai
    difficult_subject TEXT,    -- Mata pelajaran butuh bimbingan
    health_notes TEXT,         -- Catatan kesehatan khusus, alergi, atau pantangan
    target_sleep_time TEXT DEFAULT '21:00',    -- Jam tidur malam biasa
    target_wake_time TEXT DEFAULT '05:00',     -- Jam bangun subuh/pagi biasa
    student_phone TEXT,        -- Nomor WhatsApp pribadi siswa
    life_motto TEXT,           -- Motto hidup / kalimat motivasi diri
    extra_profile JSONB,       -- Data fleksibel format JSON

    -- Catatan Pembinaan & Konseling Guru Wali
    teacher_notes TEXT,        -- Catatan evaluasi / apresiasi / pembinaan guru wali
    counseling_logs JSONB,     -- Riwayat tindak lanjut bimbingan karakter

    approved_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 3. Buat Tabel Catatan Jurnal 7 Kebiasaan Harian
CREATE TABLE public.habit_logs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    student_id UUID NOT NULL REFERENCES public.students(id) ON DELETE CASCADE,
    date DATE NOT NULL DEFAULT CURRENT_DATE,
    habit_1 BOOLEAN DEFAULT false,
    habit_1_time TEXT DEFAULT '05:00',
    habit_2 BOOLEAN DEFAULT false,
    habit_3 BOOLEAN DEFAULT false,
    habit_4 BOOLEAN DEFAULT false,
    habit_5 BOOLEAN DEFAULT false,
    habit_6 BOOLEAN DEFAULT false,
    habit_7 BOOLEAN DEFAULT false,
    score INTEGER DEFAULT 0,
    student_note TEXT,
    parent_approved BOOLEAN DEFAULT false,
    parent_note TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL,
    CONSTRAINT unique_student_date UNIQUE (student_id, date)
);

-- 4. Masukkan 16 Data Lengkap Murid Binaan Wali Kelas
INSERT INTO public.students (
    nis, nisn, name, gender, birth_place, birth_date, nik, religion,
    address, phone, previous_school, weight_kg, height_cm, father_name, mother_name,
    father_job, mother_job, status, academic_grades
)
VALUES
    ('25-7788', '0123650010', 'Muhammad Patin Ramadhan', 'Laki-Laki', 'Tanah Bumbu', '2012-07-24', '6310062407120003', 'Islam', 'Pelabuhan Speed RT. 5 RW. 2', '083155842300', 'SD NEGERI 5 KAMPUNG BARU', 34, 143, 'Baharuddin (Almarhum)', 'Jayanti', 'Sudah Meninggal', 'Tidak bekerja', 'belum_daftar', '{"PAI": 77, "Pancasila": 79, "Indo": 75, "Inggris": 76, "Matematika": 79, "IPA": 77, "IPS": 75, "Koding_AI": 76, "PJOK": 77, "Seni": 79, "Informatika": 77, "rerata": 76.82}'::jsonb),
    ('25-7800', '0117670148', 'Muhammad Risvan', 'Laki-Laki', 'Hulu Sungai Selatan', '2011-09-27', '6306102709110001', 'Islam', 'Jl. Brigjen H Hasan Basry RT. 2 RW. 1', '083862498350', 'SD NEGERI 1 TUMINGKI', 34, 140, 'Ya''an', 'YATI', 'Wiraswasta', 'Wiraswasta', 'belum_daftar', '{"PAI": 77, "Pancasila": 82, "Indo": 77, "Inggris": 76, "Matematika": 78, "IPA": 80, "IPS": 75, "Koding_AI": 84, "PJOK": 77, "Seni": 80, "Informatika": 83, "rerata": 79.00}'::jsonb),
    ('25-7808', '0123356606', 'Muhyin Hidayat', 'Laki-Laki', 'Tarakan', '2012-10-30', '6473013010120001', 'Islam', 'Jalan Soetoyo S. Gang 21 Al-Aman No. 15', '081257707962', 'SD NEGERI TELAGA BIRU 6', 34, 143, 'Mahyuni', 'Sabaniah', 'PNS/TNI/Polri', 'Tidak bekerja', 'belum_daftar', '{"PAI": 85, "Pancasila": 81, "Indo": 85, "Inggris": 80, "Matematika": 84, "IPA": 79, "IPS": 79, "Koding_AI": 82, "PJOK": 77, "Seni": 79, "Informatika": 80, "rerata": 81.00}'::jsonb),
    ('25-7813', '3124392297', 'Nadia Khayrunisa', 'Perempuan', 'Tanah Bumbu', '2012-11-17', '6310065711120003', 'Islam', 'Tungkaran Pangeran', '083115508555', 'SD NEGERI 5 TUNGKARAN PANGERAN', 34, 143, 'Irfan', 'NUR FATIHAH', 'Tidak bekerja', 'Tidak bekerja', 'belum_daftar', '{"PAI": 82, "Pancasila": 81, "Indo": 76, "Inggris": 76, "Matematika": 75, "IPA": 79, "IPS": 82, "Koding_AI": 81, "PJOK": 77, "Seni": 79, "Informatika": 80, "rerata": 78.91}'::jsonb),
    ('25-7824', '3121967398', 'Nida Khofiyya', 'Perempuan', 'BANJARMASIN', '2012-04-08', '6371034804120003', 'Islam', 'Lingkar 30 Perumahan Al Raudah 3 Blok O No. 42', '082338838730', 'SD NEGERI 3 SARIGADUNG', 34, 140, 'FAHRUL EFFENDI', 'JULEHA', 'Karyawan Swasta', 'Tidak bekerja', 'belum_daftar', '{"PAI": 89, "Pancasila": 83, "Indo": 92, "Inggris": 90, "Matematika": 95, "IPA": 90, "IPS": 82, "Koding_AI": 86, "PJOK": 77, "Seni": 81, "Informatika": 90, "rerata": 86.82}'::jsonb),
    ('25-7834', '0125382499', 'Nur Alya Najwa', 'Perempuan', 'TANAH BUMBU', '2012-06-11', '6310065106120002', 'Islam', 'Jalan Kodeco Km. 1,5 RT. 3', '082129940901', 'SD NEGERI 8 KAMPUNG BARU', 40, 143, 'ARDIANSYAH', 'MARIATI HELDA', 'Karyawan Swasta', 'Lainnya', 'belum_daftar', '{"PAI": 77, "Pancasila": 81, "Indo": 76, "Inggris": 76, "Matematika": 75, "IPA": 77, "IPS": 75, "Koding_AI": 82, "PJOK": 77, "Seni": 79, "Informatika": 80, "rerata": 77.73}'::jsonb),
    ('25-7838', '0127391470', 'Parikesit Sakadhipa', 'Laki-Laki', 'DEMAK', '2012-11-07', '3321090711120003', 'Islam', 'Perumahan Bumi Datar Laga Blok P.28 RT. 8', '085246569467', 'SD NEGERI 2 SARIGADUNG', 35, 143, 'YUS ARDIAN NURPRAMUJO', 'SISKAWATI', 'Karyawan Swasta', 'Wiraswasta', 'belum_daftar', '{"PAI": 90, "Pancasila": 85, "Indo": 90, "Inggris": 89, "Matematika": 93, "IPA": 93, "IPS": 85, "Koding_AI": 87, "PJOK": 84, "Seni": 76, "Informatika": 90, "rerata": 87.45}'::jsonb),
    ('25-7849', '0135672098', 'Rahmat Bagoes Mahadana Lestari', 'Laki-Laki', 'Tanah Bumbu', '2013-02-18', '6310061802130001', 'Islam', 'Asrama Brimob Batulicin RT. 5', '082350038088', 'SD NEGERI 1 TUNGKARAN PANGERAN', 34, 140, 'Budi Lestari', 'Endang Trisna Wati', 'Tidak bekerja', 'Lainnya', 'belum_daftar', '{"PAI": 80, "Pancasila": 83, "Indo": 77, "Inggris": 81, "Matematika": 84, "IPA": 80, "IPS": 79, "Koding_AI": 80, "PJOK": 77, "Seni": 80, "Informatika": 86, "rerata": 80.64}'::jsonb),
    ('25-7862', '0132223382', 'Riyan Firman Fadilah', 'Laki-Laki', 'TANAH BUMBU', '2013-05-20', '6310062005130002', 'Islam', 'Pelabuhan Speed RT. 5 RW. 2', '085251919988', 'SD MUHAMMADIYAH', 34, 140, 'AZIS', 'Kartini', 'Karyawan Swasta', 'Tidak bekerja', 'belum_daftar', '{"PAI": 78, "Pancasila": 79, "Indo": 75, "Inggris": 76, "Matematika": 75, "IPA": 76, "IPS": 75, "Koding_AI": 77, "PJOK": 77, "Seni": 77, "Informatika": 80, "rerata": 76.82}'::jsonb),
    ('25-7867', '3129320730', 'Rumaisya Aliqha Dewi', 'Perempuan', 'Hulu Sungai Selatan', '2012-10-15', '6310065510120005', 'Islam', 'Jl Batu Benawa RT. 9 RW. 9', '083893598497', 'SD NEGERI 1 KAMPUNG BARU', 34, 143, 'A.Firdaus Fadillah Abdi', 'Ellyani', 'Karyawan Swasta', 'Karyawan Swasta', 'belum_daftar', '{"PAI": 80, "Pancasila": 81, "Indo": 84, "Inggris": 80, "Matematika": 85, "IPA": 81, "IPS": 79, "Koding_AI": 83, "PJOK": 79, "Seni": 80, "Informatika": 80, "rerata": 81.09}'::jsonb),
    ('25-7886', '0126940070', 'Tri Wibowo', 'Laki-Laki', 'TIMIKA', '2012-11-02', '9109030211120001', 'Islam', 'Mapurujaya', '082299773832', 'SD NEGERI 8 KAMPUNG BARU', 43, 150, 'Edi Susanto', 'FITRIANI', 'Wiraswasta', 'Lainnya', 'belum_daftar', '{"PAI": 77, "Pancasila": 79, "Indo": 76, "Inggris": 76, "Matematika": 82, "IPA": 76, "IPS": 75, "Koding_AI": 79, "PJOK": 77, "Seni": 80, "Informatika": 80, "rerata": 77.91}'::jsonb),
    ('25-7890', '0126095447', 'Vicka Dhiya Ananda', 'Perempuan', 'TANAH BUMBU', '2012-10-02', '6310064210120001', 'Islam', 'Jalan Karang Jawa Gang Purwodadi RT. 14', '082354459313', 'SD NEGERI 8 KAMPUNG BARU', 34, 140, 'MUSLIADI', 'ENNI KUSMAWATI', 'Wiraswasta', 'PNS/TNI/Polri', 'belum_daftar', '{"PAI": 86, "Pancasila": 84, "Indo": 85, "Inggris": 85, "Matematika": 93, "IPA": 91, "IPS": 82, "Koding_AI": 85, "PJOK": 80, "Seni": 83, "Informatika": 86, "rerata": 85.45}'::jsonb),
    ('25-7892', '0135220367', 'Wafiq Azizah', 'Perempuan', 'TANAH BUMBU', '2013-05-12', '6310065205130003', 'Islam', 'Jl.Kupang Gg. Rasau RT. 6', '082251651188', 'SD NEGERI 2 SARIGADUNG', 35, 143, 'ANDI SISWANTO', 'FIFIT SUMARNI', 'Karyawan Swasta', 'Tidak bekerja', 'belum_daftar', '{"PAI": 77, "Pancasila": 80, "Indo": 76, "Inggris": 76, "Matematika": 75, "IPA": 77, "IPS": 75, "Koding_AI": 80, "PJOK": 77, "Seni": 77, "Informatika": 80, "rerata": 77.27}'::jsonb),
    ('25-7904', '0121309430', 'Zhahra Izna Maharani', 'Perempuan', 'TANAH BUMBU', '2012-10-19', '6310065910120002', 'Islam', 'Perum Bumi Datar Laga Blok.J No.5 RT. 8', '082153255567', 'SD NEGERI 2 SARIGADUNG', 34, 143, 'JHAMAL', 'ATIK SULISTYANINGSIH', 'Karyawan Swasta', 'Tidak bekerja', 'belum_daftar', '{"PAI": 87, "Pancasila": 83, "Indo": 86, "Inggris": 84, "Matematika": 89, "IPA": 82, "IPS": 87, "Koding_AI": 87, "PJOK": 79, "Seni": 81, "Informatika": 88, "rerata": 84.82}'::jsonb),
    ('26-8277', '0137821216', 'Muhammad Zidane Al Rezky', 'Laki-Laki', 'Tanah Bumbu', '2013-01-08', '6310060801130004', 'Islam', 'ASPOL KEDUNGMUNDU BLOK G NO. 1 RT. 12 RW. 2', '081255550001', '-', 36, 156, 'Muhammad Soleh', 'Kurnia Agustina Anggraeni', 'PNS/TNI/Polri', 'Wiraswasta', 'belum_daftar', '{"PAI": 84, "Pancasila": 82, "Indo": 80, "Inggris": 82, "Matematika": 85, "IPA": 83, "IPS": 80, "Koding_AI": 82, "PJOK": 80, "Seni": 81, "Informatika": 84, "rerata": 82.55}'::jsonb),
    ('26-8276', '3128738580', 'Maulana Husna', 'Laki-Laki', 'TANAH BUMBU', '2012-07-12', '6310091207120001', 'Islam', 'JL. TRANSMIGRASI RT. 11', '081349583938', '-', 52, 158, 'MASDAR', 'MAHDALENA', 'Wiraswasta', 'Pedagang Kecil', 'belum_daftar', '{"PAI": 82, "Pancasila": 80, "Indo": 78, "Inggris": 79, "Matematika": 81, "IPA": 80, "IPS": 78, "Koding_AI": 80, "PJOK": 80, "Seni": 80, "Informatika": 82, "rerata": 80.00}'::jsonb);

-- 5. Buat View Analitik Rekapitulasi untuk Reporting Cepat
CREATE OR REPLACE VIEW public.view_student_overview AS
SELECT 
    s.id,
    s.nisn,
    s.nis,
    s.name,
    s.gender,
    s.status,
    s.dream_job,
    s.extracurricular,
    s.fav_subject,
    s.difficult_subject,
    s.health_notes,
    s.student_phone,
    s.phone AS parent_phone,
    COALESCE((s.academic_grades->>'rerata')::numeric, 0) AS rerata_rapor,
    COALESCE(h.score, 0) AS habit_score_today,
    COALESCE(h.parent_approved, false) AS parent_approved_today,
    s.teacher_notes,
    s.approved_at
FROM public.students s
LEFT JOIN public.habit_logs h ON s.id = h.student_id AND h.date = CURRENT_DATE
ORDER BY s.name;

-- 6. Aktifkan Row Level Security (RLS)
ALTER TABLE public.students ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.habit_logs ENABLE ROW LEVEL SECURITY;

-- 7. Kebijakan Akses (RLS Policies)
CREATE POLICY "Izinkan baca data siswa" ON public.students FOR SELECT USING (true);
CREATE POLICY "Izinkan update data siswa" ON public.students FOR UPDATE USING (true) WITH CHECK (true);
CREATE POLICY "Izinkan baca habit logs" ON public.habit_logs FOR SELECT USING (true);
CREATE POLICY "Izinkan insert habit logs" ON public.habit_logs FOR INSERT WITH CHECK (true);
CREATE POLICY "Izinkan update habit logs" ON public.habit_logs FOR UPDATE USING (true) WITH CHECK (true);

-- 8. Aktifkan Publikasi Realtime Supabase
ALTER PUBLICATION supabase_realtime ADD TABLE public.students;
ALTER PUBLICATION supabase_realtime ADD TABLE public.habit_logs;
