import 'package:flutter/material.dart';
import 'package:konsolto_app/generated/l10n.dart';
import 'package:konsolto_app/res/colors.dart';

import 'custom_loading.dart';

void showCustomLoadingDialog(BuildContext context) => showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => SimpleDialog(
        backgroundColor: MColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.all(16),
        children: [
          CustomLoading(),
          const SizedBox(height: 16),
          Center(
            child: Text(
              S.of(context).app_name,
              style:
                  Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 16),
            ),
          ),
        ],
      ),
    );
