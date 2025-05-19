import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Country {
  final String name;
  final String flagAsset;
  final String description;

  Country({required this.name, required this.flagAsset, required this.description});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home: CountryGridPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CountryGridPage extends StatelessWidget {
  CountryGridPage({super.key});

  final List<Country> countries = [
    Country(name: "Bangladesh", flagAsset: "assets/First_flag_of_Bangladesh.png", description: "Known for vibrant culture and history."),
    Country(name: "Zarandia", flagAsset: "assets/Flag_of_Uzbekistan.png", description: "Ancient ruins and tech hub."),
    Country(name: "Belvaria", flagAsset: "assets/Flag_of_Belgium.png", description: "Countryside and medieval towns."),
    Country(name: "Oceanor", flagAsset: "assets/Flag_of_Fiji.svg.png", description: "Marine biodiversity and reefs."),
    Country(name: "Nordovia", flagAsset: "assets/Flag_of_Norway.png", description: "Winter sports and hydropower."),
    Country(name: "Solvania", flagAsset: "assets/Bandera_Uruguay_2018.png", description: "Dance, music, and beaches."),
    Country(name: "Drakoria", flagAsset: "assets/Flag_of_Bhutan.svg.png", description: "Dragons, myths and spirituality."),
    Country(name: "Vintaria", flagAsset: "assets/Flag_of_Portugal.svg.png", description: "Vineyards, castles, coastal trade."),
    Country(name: "Crysalar", flagAsset: "assets/Flag_of_Iceland.png", description: "Tech research and glaciers."),
    Country(name: "Nimbala", flagAsset: "assets/Flag_of_Ghana.png", description: "Wildlife and colorful festivals."),
    Country(name: "Arvantis", flagAsset: "assets/Flag_of_Greece.png", description: "Philosophy and ancient ruins."),
    Country(name: "Sylvaria", flagAsset: "assets/Flag_of_Sri_Lanka.svg.png", description: "Herbal medicine and nature."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Assignment',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
        elevation: 2,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              debugPrint("Search tapped");
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                debugPrint("Settings tapped");
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Help'),
              onTap: () {
                Navigator.pop(context);
                debugPrint("Help tapped");
              },
            ),
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount = constraints.maxWidth >= 1000
              ? 4
              : constraints.maxWidth >= 600
              ? 3
              : 2;

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 3 / 4,
            ),
            itemCount: countries.length,
            itemBuilder: (context, index) {
              final country = countries[index];
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Image.asset(
                        country.flagAsset,
                        height: 120,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        country.name,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 6),
                      Expanded(
                        child: Text(
                          country.description,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 30,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text("Explore More", style: TextStyle(fontSize: 12)),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
