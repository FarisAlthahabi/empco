import 'package:empco/Core/Resources/Constants/font_weights.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Features/Roles/Freelancer/Jobs/Model/job_model/job_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class JobDetailsDescription extends StatelessWidget {
  const JobDetailsDescription({
    super.key,
    required this.screenWidth,
    required this.job,
  });

  final double screenWidth;
  final JobModel job;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 99,
          height: 16,
          decoration:
              const BoxDecoration(color: Color.fromRGBO(15, 50, 91, 0.07)),
          child: Center(
            child: Text(
              'Description',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: AppColors.black,
                  fontSize: 12.35,
                  fontWeight: weightlevel7,
                ),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          job.body,
          style: const TextStyle(fontWeight: weightlevel4),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Skills Required:',
          style: TextStyle(fontWeight: weightlevel7),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          job.requiredSkills,
          style: const TextStyle(fontWeight: weightlevel4),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Responsibilities:',
          style: TextStyle(fontWeight: weightlevel7),
        ),
        const SizedBox(
          height: 6,
        ),
        const Text(
            'Responsibilities'),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
