/**
 * SKRIP GOOGLE APPS SCRIPT (GAS) - DATABASE BACKEND
 * 
 * CARA MENGGUNAKAN:
 * 1. Buka Google Spreadsheet baru di Google Drive Anda.
 * 2. Klik menu 'Ekstensi' (Extensions) -> 'Apps Script'.
 * 3. Hapus semua kode yang ada, lalu tempelkan (paste) seluruh isi file ini.
 * 4. Klik ikon Disket (Simpan).
 * 5. Klik 'Terapkan' (Deploy) -> 'Penerapan baru' (New deployment).
 * 6. Pilih Jenis: 'Aplikasi Web' (Web app).
 * 7. Pada 'Yang memiliki akses' (Who has access), pilih: 'Siapa saja' (Anyone).
 * 8. Klik 'Terapkan' (Deploy), lalu salin URL Web App yang muncul.
 * 9. Tempelkan URL tersebut ke tombol "Setelan API" di aplikasi web Anda.
 */

function doPost(e) {
  try {
    var sheet = getOrCreateSheet();
    var data = JSON.parse(e.postData.contents);
    
    // Siapkan baris data baru
    var row = [
      new Date(),                             // Timestamp
      data.date || '',                        // Tanggal
      data.student || '',                     // Nama Siswa
      data.score ? data.score + '%' : '0%',   // Skor Kebiasaan (%)
      data.habits?.habit_1 ? "Ya" : "Tidak",  // 1. Bangun Pagi
      data.habit1Time || '',                  // Jam Bangun
      data.habits?.habit_2 ? "Ya" : "Tidak",  // 2. Beribadah
      data.habits?.habit_3 ? "Ya" : "Tidak",  // 3. Berolahraga
      data.habits?.habit_4 ? "Ya" : "Tidak",  // 4. Makan Sehat
      data.habits?.habit_5 ? "Ya" : "Tidak",  // 5. Gemar Belajar
      data.habits?.habit_6 ? "Ya" : "Tidak",  // 6. Bermasyarakat
      data.habits?.habit_7 ? "Ya" : "Tidak",  // 7. Tidur Cepat
      data.note || '',                        // Catatan Siswa
      data.parentApproved ? "Valid" : "Belum",// Status Validasi Ortu
      data.parentNote || ''                   // Catatan Ortu
    ];

    sheet.appendRow(row);

    return ContentService
      .createTextOutput(JSON.stringify({ status: "success", message: "Data berhasil disimpan!" }))
      .setMimeType(ContentService.MimeType.JSON);

  } catch (err) {
    return ContentService
      .createTextOutput(JSON.stringify({ status: "error", message: err.toString() }))
      .setMimeType(ContentService.MimeType.JSON);
  }
}

function doGet(e) {
  return ContentService
    .createTextOutput(JSON.stringify({ status: "online", message: "API 7 Kebiasaan Anak Indonesia Hebat Aktif!" }))
    .setMimeType(ContentService.MimeType.JSON);
}

function getOrCreateSheet() {
  var ss = SpreadsheetApp.getActiveSpreadsheet();
  var sheetName = "Jurnal_7_Kebiasaan";
  var sheet = ss.getSheetByName(sheetName);

  if (!sheet) {
    sheet = ss.insertSheet(sheetName);
    // Buat Baris Header Otomatis
    var headers = [
      "Timestamp",
      "Tanggal",
      "Nama Siswa",
      "Skor (%)",
      "Bangun Pagi",
      "Jam Bangun",
      "Beribadah",
      "Berolahraga",
      "Makan Sehat",
      "Gemar Belajar",
      "Bermasyarakat",
      "Tidur Cepat",
      "Catatan Siswa",
      "Validasi Ortu",
      "Catatan Ortu"
    ];
    sheet.appendRow(headers);
    // Format Header menjadi tebal & berwarna
    var headerRange = sheet.getRange(1, 1, 1, headers.length);
    headerRange.setFontWeight("bold");
    headerRange.setBackground("#dbeafe");
  }
  return sheet;
}
