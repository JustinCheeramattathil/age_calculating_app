import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/age_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    final ageProvider = Provider.of<AgeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Age Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            TextFormField(
              readOnly: true,
              controller: TextEditingController(
                text: ageProvider.getFormattedDate(),
              ),
              decoration: InputDecoration(
                labelText: 'Date of Birth',
                //After pressing the suffix icon the date picker calender invokes
                suffixIcon: InkWell(
                    onTap: () => ageProvider.selectDate(context, ageProvider),
                    child: const Icon(Icons.calendar_today)),
              ),
            ),
            const SizedBox(height: 20),
            //This button calls the calculate age function inside the provider class
            ElevatedButton(
              onPressed: () => ageProvider.calculateAge(context),
              child: const Text('Calculate Age'),
            ),
            const SizedBox(height: 20),
            //This is the text that shows the correct age after calculating
            Text(
              ageProvider.age,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
