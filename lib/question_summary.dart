import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget{
  const QuestionSummary({super.key, required this.summaryData});

  final List<Map<String,Object>> summaryData;
  
  @override
  Widget build(context){
    return Column(
      children: summaryData.map(
        (data) {
          final isCorrect = data['user_answer'] == data['correct_answer'];
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 35,
                height: 35,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isCorrect ? Colors.green : Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Text(((data['question_index'] as int) +1).toString(),
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data['question'] as String,
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text('Your answer: ${data['user_answer']}',
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 255, 180, 180),
                    fontSize: 16,
                  ),
                ),
                Text('Correct answer: ${data['correct_answer']}',
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 170, 255, 170),
                  fontSize: 16,
                  ),
                ),
               ],
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}