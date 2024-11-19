Tugas 7

1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.

Stateless widget adalah widget yang bersifat statis atau tidak dapat diubah (immutable), di mana semua nilai yang ada di dalamnya bersifat final. Karena sifatnya yang statis, Stateless Widget memiliki performa yang lebih baik karena tidak perlu mengelola state. Stateless Widget cocok digunakan untuk tampilan yang bersifat statis seperti text, icon, atau tombol dengan tampilan tetap. 

Stateful widget adalah widget yang bersifat dinamis atau dapat berubah (mutable). Widget jenis ini memiliki data internal yang dapat berubah (state) dan dapat melakukan rebuild ketika terjadi perubahan state menggunakan fungsi setState(). Stateful Widget biasanya digunakan untuk membuat tampilan yang interaktif dan dinamis seperti checkbox, radio button, slider, form input, atau counter. 

Perbedaan antara keduanya adalah pada kemampuan mengelola state dan cara mereka memperbarui tampilan. Stateless widget tidak memiliki state internal dan tidak bisa berubah secara internal, sedangkan stateful widget memiliki state yang dapat diubah menggunakan setState(). Dalam segi performa, stateless widget lebih ringan karena tidak perlu mengelola state, sementara stateful widget lebih berat karena harus mengelola perubahan state.

2. Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.

- Scaffold: Menyediakan struktur dasar halaman aplikasi dengan mengatur app bar dan body
- AppBar: Menampilkan bar navigasi di bagian atas aplikasi yang berisi judul "Jual Beli"
- Column: Mengatur widget secara vertikal untuk menampung welcome text dan grid tombol
- GridView.count: Menampilkan tombol dalam bentuk grid 3 kolom
- Material: Memberikan efek material design pada tombol dan mengatur warna latar belakang
- InkWell: Memberikan efek ripple dan menangani interaksi ketika tombol ditekan
- Container: Membungkus konten tombol dan memberikan padding
- Icon: Menampilkan ikon pada tombol
- Text: Menampilkan teks seperti judul dan label tombol
- Padding: Memberikan jarak pada widget
- SnackBar: Menampilkan pesan pop-up ketika tombol ditekan

3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
setState() adalah fungsi yang digunakan pada stateful widget untuk mengubah suatu variabel dalam sebuah widget. Variabel yang dapat diubah di setState adalah variabel yang sifatnya mutable, terkecuali variabel tersebut diinisialisasi dengan menggunakan keyword final atau const.

4. Jelaskan perbedaan antara const dengan final.
Const: nilainya harus diketahui saat kompilasi, untuk nilai yang benar-benar konstan.
Final: nilainya dapat diketahui saat runtime, untuk nilai yang hanya perlu diassign sekali.

Contoh: 
final String text;
MyWidget(this.text);  // Ini tidak bisa dilakukan menggunakan const. Karena jika menggunakan const, maka nilai dari String text adalah null ketika dijalankan.

5. Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.
Saya menggunakan tutorial 6 untuk mengimplementasikan secara garis besarnya, video tutorial flutter di youtube untuk mengerti apa yang dilakukan suatu kode yang ada di tutorial, dan menggunakan dokumentasi dari flutter untuk menambahkan beberapa kode yang tidak ada di tutorial.



Tugas 8

1. Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?

const adalah deklarasi yang digunakan untuk membuat objek yang nilainya bersifat konstan dan ditentukan pada waktu kompilasi (compile-time), bukan pada waktu runtime. const sebaiknya digunakan ketika kita memiliki variabel yang nilainya tetap, seperti saat membuat variabel nama aplikasi, nama button, style suatu widget. const sebaiknya tidak digunakan ketika valuenya mungkin berubah, semisal pada form (karena valuenya bergantung pada user input), atau jika digunakan di stateful widget, karena statenya dapat berubah.

2. Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
Column mengatur child widgets secara vertikal dari atas ke bawah, contoh implementasi dari layout widget ini ada pada product_form.dart pada project ini, dimana terlihat bahwa setiap widget inputnya dipisahkan secara vertikal.
Row mengatur child secara horizontal dari kiri ke kanan. Contoh implementasinya biasanya dipakai di navbar, karena biasanya item yang berada di navbar terletak secara horizontal.

3. Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
- TextFormField, ini adalah elemen input teks biasa baik untuk teks pendek, panjang, ataupun untuk angka (digunakan)
- DropdownButtonFormField<String>, elemen input agar user dapat memilih dari suatu daftar pilihan yang tersedia (digunakan untuk category)
- InputDatePickerFormField, elemen input agar user dapat memilih tanggal yang sesuai format

4. Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
Ya, saya telah mengimplementasikan tema dalam aplikasi Flutter ini melalui pengaturan di main.dart menggunakan ThemeData dengan Material 3 dan ColorScheme.fromSeed berbasis warna indigo. Tema ini diterapkan secara konsisten di seluruh aplikasi, terlihat pada penggunaan Theme.of(context).colorScheme.primary untuk warna DrawerHeader dan warna indigo untuk AppBar. Meskipun sederhana, implementasi ini membantu menjaga konsistensi visual aplikasi.

5. Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
Struktur direktori yang baik berpengaruh dalam mengatur navigasi pada aplikasi yang memiliki banyak halaman. Sebagai contoh, pada project ini, halaman halaman disimpan dalam direktori screen. Sedangkan widget custom disimpan dalam direktori widgets.

Tugas 9

1. Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?
Model diperlukan untuk memetakan data JSON ke objek Dart agar lebih terstruktur dan mudah diakses, memberikan type-safety (menghindari runtime errors), dan memudahkan validasi data. Tanpa model, akan terjadi beberapa masalah seperti kode lebih rawan error karena tidak ada pengecekan tipe data, data harus diakses secara manual menggunakan Map, dan lebih sulit untuk mengelola dan memvalidasi data. Meskipun bisa menggunakan map langsung, penggunaan model adalah best practice untuk maintainability dan reliability kode.

2. Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini
Library http di Flutter berfungsi untuk melakukan HTTP requests ke server. Library ini menyediakan fungsi-fungsi untuk melakukan operasi GET (mengambil data), POST (mengirim data), PUT (memperbarui data), dan DELETE (menghapus data). Dalam tugas ini, library http digunakan untuk mengambil dan mengirim data produk ke Django backend melalui HTTP requests, dimana GET digunakan untuk mengambil daftar produk dan POST untuk menambahkan produk baru.

3. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
CookieRequest berfungsi untuk mengelola state autentikasi dan session cookies dalam aplikasi Flutter, memungkinkan komunikasi yang konsisten dengan backend Django. Instance CookieRequest perlu dibagikan ke semua komponen (shared across widgets) menggunakan Provider untuk memastikan status autentikasi konsisten di seluruh aplikasi, menghindari multiple login sessions, dan memungkinkan semua widget mengakses fungsi autentikasi yang sama. Hal ini penting untuk menjaga keamanan dan konsistensi state aplikasi.

4. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
Mekanisme pengiriman data dari input hingga tampil di Flutter adalah: Pertama, user mengisi form input di Flutter. Ketika form di-submit, data dari form dikonversi menjadi format JSON. Data JSON tersebut dikirim ke Django backend menggunakan HTTP POST request. Backend Django memproses data, menyimpan ke database, dan mengirim response. Flutter menerima response, mengkonversi data JSON menjadi objek model, dan menampilkan data tersebut menggunakan widget. Untuk menampilkan data yang sudah ada, Flutter melakukan HTTP GET request ke backend, menerima data JSON, mengkonversi ke objek model, lalu menampilkannya di UI.

5. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Login: User memasukkan username dan password di Flutter -> Data dikirim ke Django melalui POST request -> Django memverifikasi kredensial -> Mengirim response berupa cookie session jika valid -> Flutter menyimpan cookie dan menampilkan halaman utama

Register: User mengisi form registrasi di Flutter -> Data dikirim ke Django -> Django membuat user baru di database -> Mengirim response sukses/gagal -> Flutter menampilkan pesan sesuai response

Logout: User menekan tombol logout -> Flutter mengirim request logout ke Django -> Django menghapus session -> Flutter menghapus cookie dan kembali ke halaman login

6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
Mengikuti tutorial untuk secara umum, melihat tutorial di youtube, dan menggunakan bbrp sumber spt stackoverflow, dokumentasi, dll untuk proses debug.