import 'package:empco/Core/Theme/components/colors.dart';
import 'package:empco/Features/Roles/Freelancer/Jobs/Model/job_model/job_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JobDetailsHead extends StatelessWidget {
  const JobDetailsHead({
    super.key,
    this.onAddToFavoriteTap,
    this.onEdit,
    this.onDelete,
    required this.job,
  });

  final VoidCallback? onAddToFavoriteTap;
  final ValueSetter<JobModel>? onEdit;
  final ValueSetter<int>? onDelete;
  final JobModel job;

  @override
  Widget build(BuildContext context) {
    final onAddToFavoriteTap = this.onAddToFavoriteTap;
    final onEdit = this.onEdit;
    final onDelete = this.onDelete;

    return ListTile(
        leading: const SizedBox(
          width: 45,
        ),
        title: Text(
          job.title,
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
                color: Color.fromRGBO(29, 91, 164, 1),
                fontSize: 20.64,
                fontWeight: FontWeight.w700),
          ),
          textAlign: TextAlign.center,
        ),
        trailing: onAddToFavoriteTap != null
            ? InkWell(
                onTap: onAddToFavoriteTap,
                child: const Icon(
                  Icons.bookmark_outline,
                  size: 40,
                  color: AppColors.black,
                ),
              )
            : SizedBox(
                width: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (onEdit != null)
                      InkWell(
                        onTap: () => onEdit(job),
                        child: const Icon(Icons.edit_outlined),
                      ),
                    if (onDelete != null)
                      InkWell(
                        onTap: () => onDelete(job.id),
                        child: const Icon(Icons.delete_outline_outlined),
                      ),
                  ],
                ),
              ));
  }
}
