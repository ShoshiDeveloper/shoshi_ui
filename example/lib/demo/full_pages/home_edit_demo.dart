import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

class InfoAboutHomeDemo extends StatefulWidget {
  const InfoAboutHomeDemo({super.key});

  @override
  State<InfoAboutHomeDemo> createState() => _InfoAboutHomeDemoState();
}

class _InfoAboutHomeDemoState extends State<InfoAboutHomeDemo> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = STheme.of(context);

    return SScaffold(
      appBar: SAppBar.pop(title: 'Info about home Demo'),
      body: Column(
        spacing: SSpacings.s24,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SButton(
            'Open MBS',
            infinityWidth: true,
            onTap: () => showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => SBottomSheet(
                header: SBottomSheetHeader.title(title: 'Home address'),
                bottom: SButton('Accept', infinityWidth: true),
                children: [
                  SAlert(
                    'We did not find the house in our database. Please complete the information about the house to help us. Thank you!',
                    SAlertStatus.danger,
                  ),
                  SInput(hint: 'City'),
                  SInput(hint: 'Street'),
                  Row(
                    spacing: SSpacings.s08,
                    children: [
                      Expanded(child: SInput(hint: 'Building №')),
                      Expanded(child: SInput(hint: 'Appartement №')),
                    ],
                  ),
                  Text(
                    'More about the building',
                    style: theme.textStyles.t1(weight: FontWeight.w500),
                  ),

                  Row(
                    spacing: SSpacings.s08,
                    children: [
                      Expanded(child: SInput(hint: 'Floor count')),
                      Expanded(child: SInput(hint: 'Build year')),
                    ],
                  ),

                  SSegmentedList(
                    children: [
                      SSgmentedListItem(
                        title: 'Type',
                        suffix: SSgmentedListItemSuffix.selector(
                          value: 'Monolithic',
                          values: ['Monolithic', 'Bricks'],
                        ),
                      ),

                      SSgmentedListItem(
                        title: 'Parking',
                        suffix: SSgmentedListItemSuffix.selector(
                          value: 'Underground',
                          values: ['Underground', 'Near at building'],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
