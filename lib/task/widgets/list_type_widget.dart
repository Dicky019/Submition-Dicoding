import 'package:flutter/material.dart';

class ListTypeWidget extends StatelessWidget {
  final List<bool> type;
  final List<String> listTypeName;
  final VoidCallback onTap;
  const ListTypeWidget({
    Key? key,
    required this.type,
    required this.listTypeName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          type.length,
          (index) => Material(
            color: type[index] ? Colors.black : Colors.transparent,
            borderRadius: BorderRadius.circular(15),
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black87,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 7,
                ),
                child: Text(
                  listTypeName[index],
                  style: TextStyle(
                    color: type[index] ? Colors.white : Colors.black,
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
