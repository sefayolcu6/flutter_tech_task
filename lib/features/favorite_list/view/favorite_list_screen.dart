import 'package:flutter/material.dart';
import 'package:flutter_tech_task/core/helpers/custom_colors.dart';
import 'package:flutter_tech_task/core/helpers/custom_paddings.dart';
import 'package:flutter_tech_task/core/widgets/divider_widget.dart';

class FavoriteListScreen extends StatefulWidget {
  const FavoriteListScreen({super.key});

  @override
  State<FavoriteListScreen> createState() => _FavoriteListScreenState();
}

class _FavoriteListScreenState extends State<FavoriteListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Favori Listem"),
        ),
        body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: CustomPaddingConstant.instance.appPaddingAll16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "state.getBookDetailList!",
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: CustomColorConstant.instance.primaryColor,
                          ),
                    ),
                    customDivider(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildDetailRow("Handle", ".handle!"),
                        _buildDetailRow("ISBN", "state"),
                        _buildDetailRow("Yayıncı", "state"),
                        _buildDetailRow("Yıl", "state"),
                        _buildDetailRow("Notlar", "state"),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }

  Widget _buildDetailRow(
    String label,
    String value,
  ) {
    return Padding(
      padding: CustomPaddingConstant.instance.appPaddingAll8,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$label: ",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(value, style: TextStyle(color: CustomColorConstant.instance.black)),
          ),
        ],
      ),
    );
  }
}
