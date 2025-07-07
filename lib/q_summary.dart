import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class QSummary extends StatelessWidget {
  const QSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,

      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((e) {
            return Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(right: 15),
                  
                  decoration: BoxDecoration(
                    color: e['user_answer'] == e['correct_answer']
                        ? const Color.fromARGB(255, 26, 135, 157)
                        : const Color.fromARGB(243, 240, 77, 17),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    ((e['question_index'] as int) + 1).toString(),
                    style: const TextStyle(fontSize: 15, color: Colors.white),
                    
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        e['question'] as String,
                        style: GoogleFonts.lato(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Your answer: ${e['user_answer']}',
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        'Correct answer: ${e['correct_answer']}',
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
