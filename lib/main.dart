import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ==========================================
// 1. DATA MODEL & DUMMY DATABASE (STATE GLOBAL)
// ==========================================

class EventItem {
  final String id;
  final String title;
  final String date;
  final String location;
  final String category;
  final String description;
  final List<String> requirements;
  // >>> SLOT FOTO / POSTER EVENT <<<
  // Kamu bisa isi dengan URL internet (https://...) atau path asset lokal ('assets/foto.jpg')
  // Jika diisi null atau string kosong, otomatis menampilkan kotak wireframe dengan slot foto.
  final String? imageUrl;

  EventItem({
    required this.id,
    required this.title,
    required this.date,
    required this.location,
    required this.category,
    required this.description,
    required this.requirements,
    this.imageUrl,
  });
}

class VolunteerItem {
  final String id;
  final String position;
  final String eventName;
  final String date;
  final String location;
  final String description;
  final List<String> tasks;
  final List<String> benefits;
  final String? imageUrl;

  VolunteerItem({
    required this.id,
    required this.position,
    required this.eventName,
    required this.date,
    required this.location,
    required this.description,
    required this.tasks,
    required this.benefits,
    this.imageUrl,
  });
}

class EventRegistration {
  final String eventTitle;
  final String date;
  final String location;
  final String fullName;
  final String nim;
  final String email;
  final String phone;
  final String faculty;
  final String token;
  final String status;

  EventRegistration({
    required this.eventTitle,
    required this.date,
    required this.location,
    required this.fullName,
    required this.nim,
    required this.email,
    required this.phone,
    required this.faculty,
    required this.token,
    required this.status,
  });
}

class VolunteerRegistration {
  final String eventName;
  final String position;
  final String division;
  final String fullName;
  final String nim;
  final String email;
  final String phone;
  final String reason;
  final String schedule;
  final String status;
  final String uploadedFileName;

  VolunteerRegistration({
    required this.eventName,
    required this.position,
    required this.division,
    required this.fullName,
    required this.nim,
    required this.email,
    required this.phone,
    required this.reason,
    required this.schedule,
    required this.status,
    this.uploadedFileName = 'CV_Vyn_Richter_2026.pdf',
  });
}

// State penampung data dummy (Sesuai ketentuan UTS: state lokal / dummy diperbolehkan)
class AppData {
  // Banner Sorotan Desktop
  static const String highlightBannerUrl =
      'https://images.unsplash.com/photo-1523240795612-9a054b0db644?w=1200&q=80';

  static List<EventItem> events = [
    EventItem(
      id: 'EVT-01',
      title: 'Seminar Nasional AI & Big Data 2026',
      date: '15 November 2026',
      location: 'Auditorium IT PLN',
      category: 'Seminar',
      description:
          'Seminar nasional yang membahas perkembangan kecerdasan buatan dan integrasinya pada sektor energi dan industri modern.',
      requirements: [
        'Mahasiswa aktif perguruan tinggi (dibuktikan dengan KTM)',
        'Membawa laptop pribadi untuk sesi interaktif',
        'Wajib hadir tepat waktu sebelum sesi registrasi ditutup',
      ],
      // Kamu bisa ganti URL ini dengan foto pribadimu / asset lokal
      imageUrl: 'https://images.unsplash.com/photo-1540575467063-178a50c2df87?w=800&q=80',
    ),
    EventItem(
      id: 'EVT-02',
      title: 'Workshop Flutter: Beginner to Pro',
      date: '22 November 2026',
      location: 'Lab Komputer Gd. C',
      category: 'Workshop',
      description:
          'Pelatihan langsung membuat aplikasi mobile multiplatform dengan Flutter dan Dart mulai dari dasar hingga layout kompleks.',
      requirements: [
        'Telah menginstall Flutter SDK & Android Studio / VS Code',
        'Memiliki pemahaman dasar pemrograman berorientasi objek',
        'Mengikuti workshop hingga selesai untuk klaim e-sertifikat',
      ],
      imageUrl: 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=800&q=80',
    ),
    EventItem(
      id: 'EVT-03',
      title: 'Lomba UI/UX Design Kampus Fest',
      date: '05 Desember 2026',
      location: 'Online / Zoom Meeting',
      category: 'Lomba',
      description:
          'Kompetisi desain antarmuka aplikasi berorientasi pemecahan masalah nyata di lingkungan akademik kampus.',
      requirements: [
        'Peserta perorangan atau tim maksimal 3 mahasiswa',
        'Menggunakan software Figma dalam mendesain prototipe',
        'Mengumpulkan proposal desain sesuai batas waktu yang ditentukan',
      ],
      imageUrl: 'https://images.unsplash.com/photo-1581291518857-4e27b48ff24e?w=800&q=80',
    ),
    EventItem(
      id: 'EVT-04',
      title: 'Tech Talk: Cloud Architecture 2026',
      date: '12 Desember 2026',
      location: 'Ruang Seminar 2 IT PLN',
      category: 'Seminar',
      description:
          'Membahas arsitektur microservices dan serverless computing terkini di industri teknologi.',
      requirements: [
        'Terbuka untuk seluruh mahasiswa IT PLN',
        'Membawa catatan atau laptop pribadi',
      ],
      // Contoh jika imageUrl = null, otomatis muncul kotak wireframe slot foto
      imageUrl: null,
    ),
  ];

  static List<VolunteerItem> volunteerList = [
    VolunteerItem(
      id: 'VOL-01',
      position: 'Staff Acara & Registrasi',
      eventName: 'Seminar Nasional AI & Big Data 2026',
      date: '15 November 2026',
      location: 'Auditorium IT PLN',
      description:
          'Membantu alur registrasi peserta, pembagian seminar kit, dan mengoordinasikan jalannya rangkaian rundown acara.',
      tasks: ['Registrasi', 'Dokumentasi', 'Logistik', 'Acara'],
      benefits: [
        'E-Sertifikat Volunteer Resmi Panitia',
        'Konsumsi (Makan siang & snack)',
        'Relasi kepanitiaan dan networking',
        'Poin SKPI / Jam Kegiatan Kampus',
      ],
      imageUrl: 'https://images.unsplash.com/photo-1511578314322-379afb476865?w=800&q=80',
    ),
    VolunteerItem(
      id: 'VOL-02',
      position: 'Staff Dokumentasi & Multimedia',
      eventName: 'Workshop Flutter: Beginner to Pro',
      date: '22 November 2026',
      location: 'Lab Komputer Gd. C',
      description:
          'Bertanggung jawab mendokumentasikan foto dan video acara serta live update media sosial resmi panitia.',
      tasks: ['Dokumentasi', 'Editing Foto/Video', 'Publikasi Sosmed'],
      benefits: [
        'E-Sertifikat Panitia',
        'Akses materi workshop gratis',
        'Makan siang dan merchandise eksklusif',
      ],
      imageUrl: 'https://images.unsplash.com/photo-1522202176988-66273c2fd55f?w=800&q=80',
    ),
    VolunteerItem(
      id: 'VOL-03',
      position: 'Staff Logistik & Perlengkapan',
      eventName: 'Lomba UI/UX Design Kampus Fest',
      date: '05 Desember 2026',
      location: 'Hall Utama Gd. Rektorat',
      description:
          'Mengatur sarana prasarana, kelistrikan, koneksi jaringan, dan kebutuhan teknis ruang lomba.',
      tasks: ['Logistik', 'Teknis & IT', 'Perlengkapan'],
      benefits: [
        'Sertifikat Volunteer',
        'Konsumsi & Merchandise',
      ],
      imageUrl: null,
    ),
  ];

  // Riwayat pendaftaran peserta aktif (default sample untuk demo)
  static List<EventRegistration> registeredEvents = [
    EventRegistration(
      eventTitle: 'Seminar Nasional AI & Big Data 2026',
      date: '15 November 2026',
      location: 'Auditorium IT PLN',
      fullName: 'Vyn Richter',
      nim: '202331001',
      email: 'vyn.richter@itpln.ac.id',
      phone: '081234567890',
      faculty: 'FTEN / S1 Sistem Informasi',
      token: 'KMP789',
      status: 'Pendaftaran Terverifikasi oleh Panitia',
    ),
  ];

  // Riwayat pendaftaran volunteer aktif
  static List<VolunteerRegistration> registeredVolunteers = [
    VolunteerRegistration(
      eventName: 'Seminar Nasional AI & Big Data 2026',
      position: 'Staff Acara',
      division: 'Divisi Acara',
      fullName: 'Vyn Richter',
      nim: '202331001',
      email: 'vyn.richter@itpln.ac.id',
      phone: '081234567890',
      reason: 'Ingin mengasah kemampuan manajemen kepanitiaan kampus.',
      schedule: '15 Nov 2026 (07.30 - Selesai)',
      status: 'Terdaftar',
      uploadedFileName: 'CV_Vyn_Richter_2026.pdf',
    ),
  ];
}

// Helper pengecekan tampilan Desktop vs Mobile
bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 850;

// ==========================================
// 2. ROOT APLIKASI & TEMA WIREFRAME
// ==========================================

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KampusEvent App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF7F7F8),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          primary: Colors.black,
          secondary: Colors.grey.shade800,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0.5,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black45, width: 1.2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black38, width: 1.2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red, width: 1.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red, width: 2),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            minimumSize: const Size.fromHeight(46),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            textStyle: const TextStyle(
              fontSize: 14.5,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}

// ==========================================
// WIDGET FOTO / POSTER DENGAN SLOT TEMPEL FOTO
// ==========================================

class EventImageBox extends StatelessWidget {
  final String? imageUrl;
  final String label;
  final double height;
  final double? width;
  final BorderRadius? borderRadius;

  const EventImageBox({
    super.key,
    this.imageUrl,
    required this.label,
    this.height = 140,
    this.width,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius ?? BorderRadius.circular(8);

    // Jika pengguna memasukkan URL atau path foto
    if (imageUrl != null && imageUrl!.trim().isNotEmpty) {
      final url = imageUrl!.trim();
      Widget imgWidget;
      if (url.startsWith('http://') || url.startsWith('https://')) {
        imgWidget = Image.network(
          url,
          height: height,
          width: width ?? double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => _buildPlaceholder(),
        );
      } else {
        imgWidget = Image.asset(
          url,
          height: height,
          width: width ?? double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => _buildPlaceholder(),
        );
      }
      return ClipRRect(
        borderRadius: radius,
        child: imgWidget,
      );
    }

    // Default: Tampilkan kotak wireframe rapi yang siap ditempel foto
    return ClipRRect(
      borderRadius: radius,
      child: _buildPlaceholder(),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      height: height,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        border: Border.all(color: Colors.black38, width: 1.2),
      ),
      child: CustomPaint(
        painter: _CrossPainter(),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 255, 255, 0.92),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.black26),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.add_photo_alternate_outlined, size: 14, color: Colors.black87),
                    const SizedBox(width: 6),
                    Text(
                      label,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Slot Foto / Poster Event',
                style: TextStyle(fontSize: 10.5, color: Colors.black54, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CrossPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black26
      ..strokeWidth = 1.2;

    canvas.drawLine(const Offset(0, 0), Offset(size.width, size.height), paint);
    canvas.drawLine(Offset(size.width, 0), Offset(0, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ==========================================
// 3. SCREEN 1: LOGIN (RESPONSIVE DESKTOP & MOBILE)
// ==========================================

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _identifierController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _identifierController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Selamat datang, ${_identifierController.text}!'),
          backgroundColor: Colors.black87,
          duration: const Duration(seconds: 2),
        ),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainNavigationScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final desktop = isDesktop(context);

    Widget formContent = Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo KampusEvent
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(25),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Center(
              child: Text(
                'K',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'KampusEvent',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Portal Kegiatan & Lowongan Volunteer Mahasiswa',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
          ),
          const SizedBox(height: 32),

          // Input Email / NIM
          TextFormField(
            controller: _identifierController,
            decoration: const InputDecoration(
              hintText: 'Email / NIM Mahasiswa',
              prefixIcon: Icon(Icons.person_outline),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Email atau NIM tidak boleh kosong!';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          // Input Password
          TextFormField(
            controller: _passwordController,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              hintText: 'Password',
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey.shade700,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Password wajib diisi!';
              }
              if (value.length < 4) {
                return 'Password minimal 4 karakter!';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),

          // Tombol LOGIN
          ElevatedButton(
            onPressed: _handleLogin,
            child: const Text('LOGIN'),
          ),
          const SizedBox(height: 16),

          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Silakan masukkan data dummy untuk langsung mencoba alur demo.'),
                ),
              );
            },
            child: const Text(
              'Daftar akun',
              style: TextStyle(
                color: Colors.black87,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: desktop
                ? Container(
                    width: 440,
                    padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 40),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.black12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(15),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: formContent,
                  )
                : formContent,
          ),
        ),
      ),
    );
  }
}

// ==========================================
// 4. MAIN CONTAINER: RESPONSIVE NAVIGATION
//    (Desktop: Top Navbar, Mobile: Bottom Nav)
// ==========================================

class MainNavigationScreen extends StatefulWidget {
  final int initialIndex;
  const MainNavigationScreen({super.key, this.initialIndex = 0});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final desktop = isDesktop(context);

    final List<Widget> pages = [
      BerandaScreen(
        onNavigateToEvents: () => _onTabTapped(1),
        onNavigateToVolunteer: () => _onTabTapped(2),
      ),
      const DaftarEventScreen(),
      const LowonganVolunteerScreen(),
      const AktivitasHubScreen(),
      const ProfilScreen(),
    ];

    return Scaffold(
      // Top Navbar untuk tampilan Desktop (Sesuai Diagram Desktop Web App)
      appBar: desktop
          ? PreferredSize(
              preferredSize: const Size.fromHeight(68),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(bottom: BorderSide(color: Colors.grey.shade300, width: 1)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  children: [
                    // Brand / Logo
                    InkWell(
                      onTap: () => _onTabTapped(0),
                      child: Row(
                        children: [
                          Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Text('K', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            'KampusEvent',
                            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, letterSpacing: 0.5),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),

                    // Nav Menu Desktop
                    _desktopNavItem('Beranda', Icons.home_outlined, 0),
                    _desktopNavItem('Event', Icons.event_note_outlined, 1),
                    _desktopNavItem('Volunteer', Icons.people_outline, 2),
                    _desktopNavItem('Aktivitas', Icons.notifications_none, 3),
                    _desktopNavItem('Profil', Icons.person_outline, 4),
                  ],
                ),
              ),
            )
          : null,

      body: pages[_currentIndex],

      // Bottom Navigation untuk tampilan Mobile
      bottomNavigationBar: !desktop
          ? Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Colors.grey.shade300, width: 1)),
              ),
              child: BottomNavigationBar(
                currentIndex: _currentIndex,
                onTap: _onTabTapped,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.grey.shade600,
                selectedFontSize: 11,
                unselectedFontSize: 11,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    activeIcon: Icon(Icons.home),
                    label: 'Beranda',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.event_note_outlined),
                    activeIcon: Icon(Icons.event_note),
                    label: 'Event',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.people_outline),
                    activeIcon: Icon(Icons.people),
                    label: 'Volunteer',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.notifications_none),
                    activeIcon: Icon(Icons.notifications),
                    label: 'Aktivitas',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline),
                    activeIcon: Icon(Icons.person),
                    label: 'Profil',
                  ),
                ],
              ),
            )
          : null,
    );
  }

  Widget _desktopNavItem(String label, IconData icon, int index) {
    final isSelected = _currentIndex == index;
    return InkWell(
      onTap: () => _onTabTapped(index),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: const EdgeInsets.only(left: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18, color: isSelected ? Colors.white : Colors.black87),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black87,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                fontSize: 13.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 5. SCREEN 2: BERANDA (RESPONSIVE GRID & HERO)
// ==========================================

class BerandaScreen extends StatefulWidget {
  final VoidCallback onNavigateToEvents;
  final VoidCallback onNavigateToVolunteer;

  const BerandaScreen({
    super.key,
    required this.onNavigateToEvents,
    required this.onNavigateToVolunteer,
  });

  @override
  State<BerandaScreen> createState() => _BerandaScreenState();
}

class _BerandaScreenState extends State<BerandaScreen> {
  String _selectedCategory = 'Semua';
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final desktop = isDesktop(context);

    final filteredEvents = AppData.events.where((event) {
      final matchesCat = _selectedCategory == 'Semua' || event.category == _selectedCategory;
      final matchesSearch = event.title.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCat && matchesSearch;
    }).toList();

    return Scaffold(
      appBar: !desktop ? AppBar(title: const Text('KampusEvent')) : null,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: desktop ? 32 : 16,
              vertical: desktop ? 24 : 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Banner Utama Sorotan (Tampilan Desktop Sesuai Mockup)
                if (desktop) ...[
                  Container(
                    width: double.infinity,
                    height: 200,
                    margin: const EdgeInsets.only(bottom: 24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Colors.black26),
                      image: const DecorationImage(
                        image: NetworkImage(AppData.highlightBannerUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(28),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        gradient: LinearGradient(
                          colors: [Colors.black.withAlpha(200), Colors.black.withAlpha(80), Colors.transparent],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Text(
                              'SOROTAN UTAMA KAMPUS',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Colors.black),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Dies Natalis & KampusFest IT PLN 2026',
                            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Ikuti berbagai seminar inspiratif, kompetisi teknologi, serta open recruitment volunteer.',
                            style: TextStyle(color: Colors.white70, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],

                // Search Bar
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search nama kegiatan, seminar, atau lomba...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _searchQuery.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () => setState(() => _searchQuery = ''),
                          )
                        : null,
                  ),
                  onChanged: (val) {
                    setState(() {
                      _searchQuery = val;
                    });
                  },
                ),
                const SizedBox(height: 14),

                // Filter Kategori
                Row(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: ['Semua', 'Seminar', 'Workshop', 'Lomba'].map((category) {
                            final isSelected = _selectedCategory == category;
                            return Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: ChoiceChip(
                                label: Text(category),
                                selected: isSelected,
                                selectedColor: Colors.black,
                                labelStyle: TextStyle(
                                  color: isSelected ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.5,
                                ),
                                backgroundColor: Colors.grey.shade200,
                                onSelected: (selected) {
                                  if (selected) {
                                    setState(() {
                                      _selectedCategory = category;
                                    });
                                  }
                                },
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    // Shortcut Cabang Alur
                    if (!desktop) ...[
                      IconButton(
                        tooltip: 'Cabang Peserta',
                        icon: const Icon(Icons.event),
                        onPressed: widget.onNavigateToEvents,
                      ),
                      IconButton(
                        tooltip: 'Cabang Volunteer',
                        icon: const Icon(Icons.volunteer_activism),
                        onPressed: widget.onNavigateToVolunteer,
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Rekomendasi Event Kampus',
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${filteredEvents.length} Event Tersedia',
                      style: TextStyle(fontSize: 12.5, color: Colors.grey.shade700),
                    ),
                  ],
                ),
                const SizedBox(height: 14),

                // List Card Event (GRID di Desktop, Single Column di Mobile)
                if (filteredEvents.isEmpty)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: const Center(
                      child: Text('Tidak ada kegiatan yang sesuai pencarian.'),
                    ),
                  )
                else if (desktop)
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 18,
                      mainAxisSpacing: 18,
                      childAspectRatio: 0.88,
                    ),
                    itemCount: filteredEvents.length,
                    itemBuilder: (context, idx) => _buildEventCard(context, filteredEvents[idx], isGrid: true),
                  )
                else
                  ...filteredEvents.map((event) => _buildEventCard(context, event, isGrid: false)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEventCard(BuildContext context, EventItem event, {required bool isGrid}) {
    return Container(
      margin: EdgeInsets.only(bottom: isGrid ? 0 : 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black38, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar / Slot Poster Event
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(11)),
            child: EventImageBox(
              imageUrl: event.imageUrl,
              label: event.category,
              height: isGrid ? 140 : 150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14.5, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 13, color: Colors.black54),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        event.date,
                        style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, size: 14, color: Colors.black54),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        event.location,
                        style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailEventScreen(event: event),
                      ),
                    );
                  },
                  child: const Text('Lihat Detail'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// =======================================================
// CABANG PESERTA EVENT (SCREEN 3, 4, 5, 6, 7)
// =======================================================

// SCREEN 3: DAFTAR EVENT (RESPONSIVE SIDEBAR DI DESKTOP)
class DaftarEventScreen extends StatefulWidget {
  const DaftarEventScreen({super.key});

  @override
  State<DaftarEventScreen> createState() => _DaftarEventScreenState();
}

class _DaftarEventScreenState extends State<DaftarEventScreen> {
  String _selectedCat = 'Semua';
  String _search = '';

  @override
  Widget build(BuildContext context) {
    final desktop = isDesktop(context);

    final list = AppData.events.where((e) {
      final matchesCat = _selectedCat == 'Semua' || e.category == _selectedCat;
      final matchesSearch = e.title.toLowerCase().contains(_search.toLowerCase());
      return matchesCat && matchesSearch;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Event'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: desktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Sidebar Filter Kategori (Desktop Mockup Screen 3)
                    Container(
                      width: 260,
                      padding: const EdgeInsets.all(24),
                      margin: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black26),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Filter Kategori', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          const SizedBox(height: 16),
                          ...['Semua', 'Seminar', 'Workshop', 'Lomba'].map((cat) {
                            final active = _selectedCat == cat;
                            return ListTile(
                              contentPadding: EdgeInsets.zero,
                              dense: true,
                              leading: Icon(
                                active ? Icons.radio_button_checked : Icons.radio_button_off,
                                color: active ? Colors.black : Colors.grey,
                                size: 18,
                              ),
                              title: Text(cat, style: TextStyle(fontWeight: active ? FontWeight.bold : FontWeight.normal)),
                              onTap: () => setState(() => _selectedCat = cat),
                            );
                          }),
                        ],
                      ),
                    ),

                    // Grid Konten Event di Desktop
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 24, 24, 24),
                        child: Column(
                          children: [
                            TextField(
                              decoration: const InputDecoration(
                                hintText: 'Cari event kegiatan...',
                                prefixIcon: Icon(Icons.search),
                              ),
                              onChanged: (v) => setState(() => _search = v),
                            ),
                            const SizedBox(height: 16),
                            Expanded(
                              child: GridView.builder(
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16,
                                  childAspectRatio: 0.9,
                                ),
                                itemCount: list.length,
                                itemBuilder: (context, index) => _buildEventItemCard(list[index]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    // Filter Bar Mobile
                    Container(
                      padding: const EdgeInsets.all(12),
                      color: Colors.white,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: ['Semua', 'Seminar', 'Workshop', 'Lomba'].map((cat) {
                            final active = _selectedCat == cat;
                            return Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: FilterChip(
                                label: Text(cat),
                                selected: active,
                                selectedColor: Colors.black,
                                labelStyle: TextStyle(
                                  color: active ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                                onSelected: (val) => setState(() => _selectedCat = cat),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: list.length,
                        itemBuilder: (context, index) => _buildEventItemCard(list[index]),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildEventItemCard(EventItem event) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black45, width: 1.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            child: EventImageBox(imageUrl: event.imageUrl, height: 130, label: event.category),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(event.title, style: const TextStyle(fontSize: 14.5, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 13),
                    const SizedBox(width: 6),
                    Text(event.date, style: const TextStyle(fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, size: 14),
                    const SizedBox(width: 6),
                    Text(event.location, style: const TextStyle(fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailEventScreen(event: event),
                      ),
                    );
                  },
                  child: const Text('Lihat Detail'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// SCREEN 4: DETAIL EVENT (RESPONSIVE 2-KOLOM DI DESKTOP)
class DetailEventScreen extends StatelessWidget {
  final EventItem event;
  const DetailEventScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final desktop = isDesktop(context);

    Widget imageAndInfo = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EventImageBox(imageUrl: event.imageUrl, height: desktop ? 260 : 180, label: event.title),
        const SizedBox(height: 16),
        Text(event.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.calendar_today, size: 15),
            const SizedBox(width: 6),
            Text(event.date, style: const TextStyle(fontSize: 13)),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            const Icon(Icons.location_on_outlined, size: 16),
            const SizedBox(width: 6),
            Text(event.location, style: const TextStyle(fontSize: 13)),
          ],
        ),
      ],
    );

    Widget descAndRequirements = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Deskripsi Event', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        Text(event.description, style: TextStyle(fontSize: 13, color: Colors.grey.shade800, height: 1.4)),
        const SizedBox(height: 16),
        const Text('Persyaratan Peserta', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black26),
          ),
          child: Column(
            children: event.requirements
                .map(
                  (req) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('• ', style: TextStyle(fontWeight: FontWeight.bold)),
                        Expanded(child: Text(req, style: const TextStyle(fontSize: 12.5))),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FormPendaftaranPesertaScreen(event: event)),
            );
          },
          child: const Text('Daftar sebagai Peserta'),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Detail Event')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1050),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: desktop
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 5, child: imageAndInfo),
                      const SizedBox(width: 32),
                      Expanded(flex: 5, child: descAndRequirements),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      imageAndInfo,
                      const Divider(height: 28),
                      descAndRequirements,
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

// SCREEN 5: FORM PENDAFTARAN PESERTA
class FormPendaftaranPesertaScreen extends StatefulWidget {
  final EventItem event;
  const FormPendaftaranPesertaScreen({super.key, required this.event});

  @override
  State<FormPendaftaranPesertaScreen> createState() => _FormPendaftaranPesertaScreenState();
}

class _FormPendaftaranPesertaScreenState extends State<FormPendaftaranPesertaScreen> {
  final _formKey = GlobalKey<FormState>();

  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _emailController = TextEditingController();
  final _hpController = TextEditingController();
  final _fakultasController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _emailController.dispose();
    _hpController.dispose();
    _fakultasController.dispose();
    super.dispose();
  }

  void _kirimPendaftaran() {
    if (_formKey.currentState!.validate()) {
      final token = 'KMP${DateTime.now().millisecond.toString().padLeft(3, '7')}';

      final newReg = EventRegistration(
        eventTitle: widget.event.title,
        date: widget.event.date,
        location: widget.event.location,
        fullName: _namaController.text.trim(),
        nim: _nimController.text.trim(),
        email: _emailController.text.trim(),
        phone: _hpController.text.trim(),
        faculty: _fakultasController.text.trim(),
        token: token,
        status: 'Pendaftaran Terverifikasi oleh Panitia',
      );

      setState(() {
        AppData.registeredEvents.insert(0, newReg);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Pendaftaran Berhasil Dikirim!'),
          backgroundColor: Colors.black87,
        ),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AktivitasSayaEventScreen(registration: newReg),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Pendaftaran Peserta')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 680),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(color: Colors.black26),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mendaftar: ${widget.event.title}',
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 18),

                      const Text('Nama Lengkap', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: _namaController,
                        decoration: const InputDecoration(hintText: 'Masukkan nama lengkap'),
                        validator: (val) => val == null || val.trim().isEmpty ? 'Nama lengkap wajib diisi!' : null,
                      ),
                      const SizedBox(height: 14),

                      const Text('NIM', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: _nimController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(hintText: 'Contoh: 202331001'),
                        validator: (val) {
                          if (val == null || val.trim().isEmpty) return 'NIM wajib diisi!';
                          if (val.trim().length < 5) return 'NIM minimal 5 digit angka!';
                          return null;
                        },
                      ),
                      const SizedBox(height: 14),

                      const Text('Email Mahasiswa', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(hintText: 'nama@itpln.ac.id'),
                        validator: (val) {
                          if (val == null || val.trim().isEmpty) return 'Email tidak boleh kosong!';
                          if (!val.contains('@') || !val.contains('.')) return 'Format email tidak valid!';
                          return null;
                        },
                      ),
                      const SizedBox(height: 14),

                      const Text('No. HP / WhatsApp', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: _hpController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(hintText: 'Contoh: 081234567890'),
                        validator: (val) => val == null || val.trim().isEmpty ? 'Nomor HP wajib diisi!' : null,
                      ),
                      const SizedBox(height: 14),

                      const Text('Fakultas / Prodi', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: _fakultasController,
                        decoration: const InputDecoration(hintText: 'Contoh: FTEN / S1 Sistem Informasi'),
                        validator: (val) => val == null || val.trim().isEmpty ? 'Fakultas / Prodi tidak boleh kosong!' : null,
                      ),
                      const SizedBox(height: 24),

                      ElevatedButton(
                        onPressed: _kirimPendaftaran,
                        child: const Text('Kirim Pendaftaran'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// SCREEN 6: AKTIVITAS SAYA (EVENT AKTIF)
class AktivitasSayaEventScreen extends StatelessWidget {
  final EventRegistration registration;
  const AktivitasSayaEventScreen({super.key, required this.registration});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aktivitas Saya'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 680),
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: const TabBar(
                    indicatorColor: Colors.black,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(text: 'Event Aktif'),
                      Tab(text: 'Riwayat'),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      SingleChildScrollView(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black38),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Info Event', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 8),
                                  Text(registration.eventTitle, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                  const SizedBox(height: 4),
                                  Text('${registration.date} • ${registration.location}', style: TextStyle(fontSize: 12, color: Colors.grey.shade700)),
                                  const SizedBox(height: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(registration.status, style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),

                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(24),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black38),
                              ),
                              child: Column(
                                children: [
                                  const Text('Kode Token (6 digit)', style: TextStyle(fontSize: 13, color: Colors.black54)),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        registration.token,
                                        style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold, letterSpacing: 2),
                                      ),
                                      const SizedBox(width: 8),
                                      IconButton(
                                        icon: const Icon(Icons.copy, size: 22),
                                        onPressed: () {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text('Kode Token ${registration.token} disalin!'), duration: const Duration(seconds: 1)),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  const Text('Tunjukkan token saat registrasi', style: TextStyle(fontSize: 12, color: Colors.black54)),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),

                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VerifikasiPanitiaScreen(registration: registration),
                                  ),
                                );
                              },
                              child: const Text('Lihat Bukti Verifikasi Panitia'),
                            ),
                          ],
                        ),
                      ),
                      const Center(child: Text('Belum ada riwayat kegiatan selesai.')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// SCREEN 7: VERIFIKASI PANITIA
class VerifikasiPanitiaScreen extends StatelessWidget {
  final EventRegistration registration;
  const VerifikasiPanitiaScreen({super.key, required this.registration});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verifikasi Panitia'), automaticallyImplyLeading: false),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 580),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.black, width: 3)),
                  child: const Center(child: Icon(Icons.check, size: 60, color: Colors.black)),
                ),
                const SizedBox(height: 20),
                const Text('Pendaftaran Terverifikasi\noleh Panitia', textAlign: TextAlign.center, style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, height: 1.3)),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.black26)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Detail Peserta:', style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 6),
                      Text('Nama : ${registration.fullName}'),
                      Text('NIM  : ${registration.nim}'),
                      Text('Prodi: ${registration.faculty}'),
                      const Divider(height: 16),
                      Text('Event: ${registration.eventTitle}', style: const TextStyle(fontWeight: FontWeight.w600)),
                      Text('Token: ${registration.token} (Valid)'),
                      const SizedBox(height: 6),
                      const Text('Data nomor registrasi dan event valid. Pendaftaran terverifikasi oleh Panitia.', style: TextStyle(fontSize: 11.5, color: Colors.black54)),
                    ],
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const MainNavigationScreen(initialIndex: 0)),
                      (route) => false,
                    );
                  },
                  child: const Text('Kembali ke Beranda'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// =======================================================
// CABANG VOLUNTEER (SCREEN 8, 9, 10, 11)
// =======================================================

// SCREEN 8: LOWONGAN VOLUNTEER
class LowonganVolunteerScreen extends StatefulWidget {
  const LowonganVolunteerScreen({super.key});

  @override
  State<LowonganVolunteerScreen> createState() => _LowonganVolunteerScreenState();
}

class _LowonganVolunteerScreenState extends State<LowonganVolunteerScreen> {
  String _search = '';
  String _selectedDiv = 'Semua';

  @override
  Widget build(BuildContext context) {
    final desktop = isDesktop(context);

    final list = AppData.volunteerList.where((v) {
      final matchesSearch = v.position.toLowerCase().contains(_search.toLowerCase()) ||
          v.eventName.toLowerCase().contains(_search.toLowerCase());
      final matchesDiv = _selectedDiv == 'Semua' || v.tasks.contains(_selectedDiv);
      return matchesSearch && matchesDiv;
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Lowongan Volunteer')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: desktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Sidebar Divisi Desktop
                    Container(
                      width: 260,
                      padding: const EdgeInsets.all(24),
                      margin: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black26),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Filter Divisi', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          const SizedBox(height: 16),
                          ...['Semua', 'Registrasi', 'Dokumentasi', 'Logistik', 'Acara'].map((div) {
                            final active = _selectedDiv == div;
                            return ListTile(
                              contentPadding: EdgeInsets.zero,
                              dense: true,
                              leading: Icon(
                                active ? Icons.radio_button_checked : Icons.radio_button_off,
                                color: active ? Colors.black : Colors.grey,
                                size: 18,
                              ),
                              title: Text(div, style: TextStyle(fontWeight: active ? FontWeight.bold : FontWeight.normal)),
                              onTap: () => setState(() => _selectedDiv = div),
                            );
                          }),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 24, 24, 24),
                        child: Column(
                          children: [
                            TextField(
                              decoration: const InputDecoration(
                                hintText: 'Cari Posisi Volunteer...',
                                prefixIcon: Icon(Icons.search),
                              ),
                              onChanged: (v) => setState(() => _search = v),
                            ),
                            const SizedBox(height: 16),
                            Expanded(
                              child: GridView.builder(
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16,
                                  childAspectRatio: 0.9,
                                ),
                                itemCount: list.length,
                                itemBuilder: (context, index) => _buildVolunteerCard(list[index]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextField(
                        decoration: const InputDecoration(hintText: 'Cari Posisi Volunteer...', prefixIcon: Icon(Icons.search)),
                        onChanged: (v) => setState(() => _search = v),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: list.length,
                        itemBuilder: (context, index) => _buildVolunteerCard(list[index]),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildVolunteerCard(VolunteerItem vol) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black45, width: 1.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            child: EventImageBox(imageUrl: vol.imageUrl, height: 130, label: vol.position),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(vol.position, style: const TextStyle(fontSize: 14.5, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(vol.eventName, style: TextStyle(fontSize: 12, color: Colors.grey.shade800)),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 13),
                    const SizedBox(width: 6),
                    Text(vol.date, style: const TextStyle(fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailVolunteerScreen(volunteer: vol)),
                    );
                  },
                  child: const Text('Lihat Detail'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// SCREEN 9: DETAIL VOLUNTEER
class DetailVolunteerScreen extends StatelessWidget {
  final VolunteerItem volunteer;
  const DetailVolunteerScreen({super.key, required this.volunteer});

  @override
  Widget build(BuildContext context) {
    final desktop = isDesktop(context);

    Widget leftInfo = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EventImageBox(imageUrl: volunteer.imageUrl, height: desktop ? 240 : 160, label: volunteer.position),
        const SizedBox(height: 16),
        Text(volunteer.position, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(volunteer.eventName, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.calendar_today, size: 15),
            const SizedBox(width: 6),
            Text(volunteer.date, style: const TextStyle(fontSize: 13)),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            const Icon(Icons.location_on_outlined, size: 16),
            const SizedBox(width: 6),
            Text(volunteer.location, style: const TextStyle(fontSize: 13)),
          ],
        ),
      ],
    );

    Widget rightTasksAndBenefits = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Deskripsi Tugas', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        Text(volunteer.description, style: TextStyle(fontSize: 13, color: Colors.grey.shade800, height: 1.4)),
        const SizedBox(height: 16),
        const Text('Divisi Tugas', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: volunteer.tasks.map((task) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.black38),
              ),
              child: Text(task, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        const Text('Benefit yang Didapat', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black26),
          ),
          child: Column(
            children: volunteer.benefits.map((b) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.check_circle_outline, size: 16),
                    const SizedBox(width: 8),
                    Expanded(child: Text(b, style: const TextStyle(fontSize: 12.5))),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FormPendaftaranVolunteerScreen(volunteer: volunteer)),
            );
          },
          child: const Text('Daftar Volunteer'),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Detail Volunteer')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1050),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: desktop
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 5, child: leftInfo),
                      const SizedBox(width: 32),
                      Expanded(flex: 5, child: rightTasksAndBenefits),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      leftInfo,
                      const Divider(height: 28),
                      rightTasksAndBenefits,
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

// SCREEN 10: FORM PENDAFTARAN VOLUNTEER (DENGAN UPLOAD BERKAS)
class FormPendaftaranVolunteerScreen extends StatefulWidget {
  final VolunteerItem volunteer;
  const FormPendaftaranVolunteerScreen({super.key, required this.volunteer});

  @override
  State<FormPendaftaranVolunteerScreen> createState() => _FormPendaftaranVolunteerScreenState();
}

class _FormPendaftaranVolunteerScreenState extends State<FormPendaftaranVolunteerScreen> {
  final _formKey = GlobalKey<FormState>();

  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _emailController = TextEditingController();
  final _hpController = TextEditingController();
  final _alasanController = TextEditingController();

  String? _selectedDivisi;
  String? _uploadedFileName;
  bool _uploadError = false;

  @override
  void initState() {
    super.initState();
    if (widget.volunteer.tasks.isNotEmpty) {
      _selectedDivisi = widget.volunteer.tasks.first;
    }
  }

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _emailController.dispose();
    _hpController.dispose();
    _alasanController.dispose();
    super.dispose();
  }

  void _pilihBerkas() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) {
        final options = [
          {'name': 'CV_Vyn_Richter_2026.pdf', 'desc': 'Curriculum Vitae terbaru • 1.4 MB'},
          {'name': 'Portofolio_Volunteer_Vyn.pdf', 'desc': 'Portofolio Desain & Acara • 2.6 MB'},
          {'name': 'KTM_Vyn_Richter.pdf', 'desc': 'Scan Kartu Tanda Mahasiswa • 650 KB'},
        ];
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Pilih Dokumen / Berkas', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(ctx)),
                  ],
                ),
                const Text('Pilih berkas dari perangkat untuk dilampirkan (Simulasi File Picker):', style: TextStyle(fontSize: 12, color: Colors.black54)),
                const SizedBox(height: 12),
                ...options.map((opt) => Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: const BorderSide(color: Colors.black26),
                      ),
                      child: ListTile(
                        leading: const Icon(Icons.picture_as_pdf, color: Colors.red),
                        title: Text(opt['name']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                        subtitle: Text(opt['desc']!, style: const TextStyle(fontSize: 11)),
                        trailing: const Icon(Icons.upload, size: 20),
                        onTap: () {
                          Navigator.pop(ctx);
                          setState(() {
                            _uploadedFileName = opt['name'];
                            _uploadError = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Berkas "${opt['name']}" berhasil dipilih!'), duration: const Duration(seconds: 2)),
                          );
                        },
                      ),
                    )),
              ],
            ),
          ),
        );
      },
    );
  }

  void _kirimPendaftaran() {
    final formValid = _formKey.currentState!.validate();
    if (_uploadedFileName == null) {
      setState(() {
        _uploadError = true;
      });
    }

    if (formValid && _uploadedFileName != null) {
      final newVolReg = VolunteerRegistration(
        eventName: widget.volunteer.eventName,
        position: widget.volunteer.position,
        division: _selectedDivisi ?? 'Umum',
        fullName: _namaController.text.trim(),
        nim: _nimController.text.trim(),
        email: _emailController.text.trim(),
        phone: _hpController.text.trim(),
        reason: _alasanController.text.trim(),
        schedule: '${widget.volunteer.date} (08:00 - Selesai)',
        status: 'Terdaftar',
        uploadedFileName: _uploadedFileName!,
      );

      setState(() {
        AppData.registeredVolunteers.insert(0, newVolReg);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Pendaftaran Volunteer & Berkas Berhasil Dikirim!'),
          backgroundColor: Colors.black87,
        ),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AktivitasSayaVolunteerScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Pendaftaran Volunteer')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 680),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(color: Colors.black26),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Posisi: ${widget.volunteer.position}', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      Text(widget.volunteer.eventName, style: TextStyle(fontSize: 12.5, color: Colors.grey.shade700)),
                      const SizedBox(height: 18),

                      const Text('Nama Lengkap', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: _namaController,
                        decoration: const InputDecoration(hintText: 'Nama lengkap Anda'),
                        validator: (val) => val == null || val.trim().isEmpty ? 'Nama lengkap wajib diisi!' : null,
                      ),
                      const SizedBox(height: 14),

                      const Text('NIM', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: _nimController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(hintText: 'NIM Mahasiswa'),
                        validator: (val) => val == null || val.trim().isEmpty ? 'NIM wajib diisi!' : null,
                      ),
                      const SizedBox(height: 14),

                      const Text('Email', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(hintText: 'Email Anda'),
                        validator: (val) => val == null || !val.contains('@') ? 'Email tidak valid!' : null,
                      ),
                      const SizedBox(height: 14),

                      const Text('No. HP / WA', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: _hpController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(hintText: '08xxxxxxxxxx'),
                        validator: (val) => val == null || val.trim().isEmpty ? 'No. HP wajib diisi!' : null,
                      ),
                      const SizedBox(height: 14),

                      const Text('Pilih Divisi', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                      const SizedBox(height: 6),
                      DropdownButtonFormField<String>(
                        initialValue: _selectedDivisi,
                        items: widget.volunteer.tasks.map((task) {
                          return DropdownMenuItem<String>(value: task, child: Text(task));
                        }).toList(),
                        onChanged: (val) => setState(() => _selectedDivisi = val),
                        decoration: const InputDecoration(hintText: 'Pilih Divisi'),
                        validator: (val) => val == null || val.isEmpty ? 'Pilih divisi tugas!' : null,
                      ),
                      const SizedBox(height: 14),

                      const Text('Alasan (opsional)', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: _alasanController,
                        maxLines: 3,
                        decoration: const InputDecoration(hintText: 'Ceritakan motivasi atau pengalaman relevan...'),
                      ),
                      const SizedBox(height: 18),

                      // Upload Berkas
                      const Text('Upload Berkas / CV', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                      const SizedBox(height: 4),
                      Text('Wajib melampirkan berkas CV atau portofolio (PDF/JPG)', style: TextStyle(fontSize: 11.5, color: Colors.grey.shade700)),
                      const SizedBox(height: 8),

                      InkWell(
                        onTap: _pilihBerkas,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: _uploadedFileName == null ? Colors.grey.shade100 : Colors.green.shade50,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: _uploadError ? Colors.red : (_uploadedFileName == null ? Colors.black45 : Colors.green.shade700),
                              width: _uploadError ? 1.5 : 1.2,
                            ),
                          ),
                          child: _uploadedFileName == null
                              ? Column(
                                  children: [
                                    Icon(Icons.cloud_upload_outlined, size: 36, color: _uploadError ? Colors.red : Colors.black54),
                                    const SizedBox(height: 6),
                                    Text('Klik untuk memilih berkas pendukung', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: _uploadError ? Colors.red : Colors.black87)),
                                    const SizedBox(height: 2),
                                    Text('Format: PDF, JPG, PNG (Maksimal 5MB)', style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
                                  ],
                                )
                              : Row(
                                  children: [
                                    const Icon(Icons.picture_as_pdf, color: Colors.red, size: 32),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(_uploadedFileName!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                                          const SizedBox(height: 2),
                                          Row(
                                            children: [
                                              Icon(Icons.check_circle, size: 13, color: Colors.green.shade700),
                                              const SizedBox(width: 4),
                                              Text('Berkas siap diunggah', style: TextStyle(fontSize: 11, color: Colors.green.shade700, fontWeight: FontWeight.w600)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.close, color: Colors.black54),
                                      onPressed: () => setState(() => _uploadedFileName = null),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                      if (_uploadError) ...[
                        const SizedBox(height: 6),
                        const Text('Wajib mengunggah berkas CV / portofolio terlebih dahulu!', style: TextStyle(color: Colors.red, fontSize: 12)),
                      ],
                      const SizedBox(height: 24),

                      ElevatedButton(
                        onPressed: _kirimPendaftaran,
                        child: const Text('Kirim Pendaftaran'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// SCREEN 11: AKTIVITAS SAYA (TUGAS VOLUNTEER)
class AktivitasSayaVolunteerScreen extends StatelessWidget {
  const AktivitasSayaVolunteerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aktivitas Saya'), automaticallyImplyLeading: false),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 780),
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: const TabBar(
                    indicatorColor: Colors.black,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(text: 'Tugas Volunteer'),
                      Tab(text: 'Riwayat'),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: AppData.registeredVolunteers.length,
                        itemBuilder: (context, index) {
                          final item = AppData.registeredVolunteers[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 14),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black38),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 58,
                                  height: 58,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.black26),
                                  ),
                                  child: const Icon(Icons.badge_outlined, color: Colors.black54),
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(item.eventName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14.5)),
                                      const SizedBox(height: 4),
                                      Text('Divisi: ${item.division}', style: TextStyle(fontSize: 12.5, color: Colors.grey.shade800)),
                                      Text('Jadwal: ${item.schedule}', style: TextStyle(fontSize: 12, color: Colors.grey.shade700)),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          const Icon(Icons.attach_file, size: 13, color: Colors.black54),
                                          const SizedBox(width: 4),
                                          Expanded(
                                            child: Text(
                                              item.uploadedFileName,
                                              style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.w600, color: Colors.black87),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(6)),
                                  child: Text(item.status, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      const Center(child: Text('Belum ada riwayat tugas volunteer yang selesai.')),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const MainNavigationScreen(initialIndex: 0)),
                        (route) => false,
                      );
                    },
                    child: const Text('Kembali ke Beranda'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ==========================================
// 6. SCREEN AKTIVITAS HUB & PROFIL (PELENGKAP TAB)
// ==========================================

class AktivitasHubScreen extends StatelessWidget {
  const AktivitasHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aktivitas Saya')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: const TabBar(
                    indicatorColor: Colors.black,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(text: 'Peserta Event'),
                      Tab(text: 'Tugas Volunteer'),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      if (AppData.registeredEvents.isEmpty)
                        const Center(child: Text('Belum mendaftar di event manapun.'))
                      else
                        ListView.builder(
                          padding: const EdgeInsets.all(16),
                          itemCount: AppData.registeredEvents.length,
                          itemBuilder: (context, idx) {
                            final reg = AppData.registeredEvents[idx];
                            return Card(
                              margin: const EdgeInsets.only(bottom: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: const BorderSide(color: Colors.black26),
                              ),
                              child: ListTile(
                                leading: const Icon(Icons.confirmation_number_outlined, color: Colors.black),
                                title: Text(reg.eventTitle, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5)),
                                subtitle: Text('Token: ${reg.token} • ${reg.status}'),
                                trailing: const Icon(Icons.arrow_forward_ios, size: 14),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => AktivitasSayaEventScreen(registration: reg)),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      if (AppData.registeredVolunteers.isEmpty)
                        const Center(child: Text('Belum mendaftar sebagai volunteer.'))
                      else
                        ListView.builder(
                          padding: const EdgeInsets.all(16),
                          itemCount: AppData.registeredVolunteers.length,
                          itemBuilder: (context, idx) {
                            final vol = AppData.registeredVolunteers[idx];
                            return Card(
                              margin: const EdgeInsets.only(bottom: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: const BorderSide(color: Colors.black26),
                              ),
                              child: ListTile(
                                leading: const Icon(Icons.badge_outlined, color: Colors.black),
                                title: Text(vol.eventName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5)),
                                subtitle: Text('Divisi: ${vol.division} • ${vol.status}'),
                                trailing: const Icon(Icons.arrow_forward_ios, size: 14),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const AktivitasSayaVolunteerScreen()),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil Pengguna')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 44,
                  backgroundColor: Colors.black,
                  child: Icon(Icons.person, size: 54, color: Colors.white),
                ),
                const SizedBox(height: 14),
                const Text(
                  'Vyn Richter',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  'NIM: 202331001 • S1 Sistem Informasi',
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black26),
                  ),
                  child: const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Status Mahasiswa:'),
                          Text('Aktif', style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Divider(height: 22),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Fakultas:'),
                          Text('FTEN IT PLN', style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Divider(height: 22),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Semester:'),
                          Text('5 (Gasal 2026/2027)', style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade800,
                    foregroundColor: Colors.white,
                  ),
                  icon: const Icon(Icons.logout),
                  label: const Text('LOGOUT'),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
