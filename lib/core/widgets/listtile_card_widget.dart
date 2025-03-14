import 'package:flutter/material.dart';

class CustomListTileCard extends StatefulWidget {
  final Color? color;
  final bool? enabled;
  final bool? dense;
  final VoidCallback? onTap;
  final Widget title;
  final Widget subtitle;
  final Widget? trailing;
  final Widget? leading;

  const CustomListTileCard({
    Key? key,
    this.color,
    this.enabled,
    this.dense,
    this.onTap,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.leading,
  }) : super(key: key);

  @override
  _CustomListTileCardState createState() => _CustomListTileCardState();
}

class _CustomListTileCardState extends State<CustomListTileCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.color,
      child: ListTile(
        onTap: widget.onTap,
        enabled: widget.enabled ?? true,
        dense: widget.dense,
        title: widget.title,
        subtitle: widget.subtitle,
        trailing: widget.trailing,
        leading: widget.leading,
      ),
    );
  }
}
