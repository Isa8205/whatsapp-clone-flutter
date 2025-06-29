import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final String? initialValue;

  const CustomDropdown({
    required this.items,
    this.initialValue,
    super.key,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  bool isOpen = false;
  late String selected;

  @override
  void initState() {
    super.initState();
    selected = widget.initialValue ?? widget.items.first;
  }

  void toggleDropdown() {
    setState(() {
      isOpen = !isOpen;
    });
  }

  void setSelected(item) {
    setState(() {
      selected = item;
      isOpen = !isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.horizontal(
                right: Radius.circular(4),
                left: Radius.circular(4)
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(selected),
                GestureDetector(
                  onTap: () {
                    toggleDropdown();
                  },
                  child: Icon(Icons.add_box_outlined, size: 20,),
                )
              ],
            ),

          ),
          //Only show the items list when state is open
          isOpen ? Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.grey[100],
            ),
            child: Column(
              children: [
                for (var item in widget.items)
                  GestureDetector(
                    onTap: () {
                      setSelected(item);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(item),
                      ),
                    ),
                  )
              ],
            ),
          ) : SizedBox.shrink()
        ],
      ),

    );
  }
}
