import 'package:example/demo/helpers/demo_page.dart';
import 'package:example/demo/helpers/demo_section.dart';
import 'package:example/demo/helpers/demo_title.dart';
import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

class ChipDemo extends StatefulWidget {
  const ChipDemo({super.key});

  @override
  State<ChipDemo> createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  bool isSelected = false;

  var chips = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return DemoPage(
      title: 'Chip',
      children: [
        DemoSection(
          title: DemoTitle('Default selected color'),
          demo: SChip(
            isSelected: isSelected,
            text: 'Chip',
            onChanged: (value) => setState(() => isSelected = value),
          ),
        ),

        DemoSection(
          title: DemoTitle('Brand selected color'),
          demo: SChip(
            isSelected: isSelected,
            text: 'Chip',
            selectedVariant: SChipSelectedVariant.brand,
            onChanged: (value) => setState(() => isSelected = value),
          ),
        ),

        DemoSection(
          title: DemoTitle('Chip group'),
          demo: SChipGroup(
            onChanged: (index, isSelected) =>
                setState(() => chips[index] = isSelected),
            children: List.generate(
              chips.length,
              (index) => SChip(
                isSelected: chips[index],
                icon: SIconsFilled.shieldWarning,
                text: '$index chip',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
