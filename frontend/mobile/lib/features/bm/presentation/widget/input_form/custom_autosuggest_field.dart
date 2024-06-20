import 'package:bm_mobile/core/style/style_extensions.dart';
import 'package:bm_mobile/features/bm/domain/entity/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAutosuggestField extends ConsumerWidget {
  final String? Function(String?)? validator;
  final String labelText;
  final List<UserData> optionsList;
  final ValueNotifier<UserData?> selectedUser;

  const CustomAutosuggestField({
    super.key,
    required this.labelText,
    required this.selectedUser,
    required this.optionsList,
    this.validator,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) => Autocomplete<String>(
        initialValue: TextEditingValue(
          text: selectedUser.value == null
              ? ""
              : "${selectedUser.value?.user.firstName} ${selectedUser.value?.user.lastName}",
        ),
        optionsBuilder: (textEditingValue) {
          return optionsList
              .where((option) =>
                  option.user.firstName.toString().toLowerCase().contains(textEditingValue.text.toLowerCase()) ||
                  option.user.lastName.toString().toLowerCase().contains(textEditingValue.text.toLowerCase()))
              .map((option) => "${option.user.firstName} ${option.user.lastName}");
        },
        onSelected: (String selection) {
          UserData selectedUserData =
              optionsList.firstWhere((option) => "${option.user.firstName} ${option.user.lastName}" == selection);
          selectedUser.value = selectedUserData;
        },
        optionsViewBuilder: (context, onSelected, options) => Align(
          alignment: Alignment.topLeft,
          child: Material(
            color: Theme.of(context).appBarTheme.backgroundColor,
            elevation: 10.0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: SizedBox(
              height: options.length > 6 ? MediaQuery.of(context).size.height / 2 : options.length * 50,
              width: constraints.maxWidth,
              child: Scrollbar(
                child: ListView.builder(
                  itemCount: options.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                      options.elementAt(index).toString(),
                      style: context.subtitleText,
                    ),
                    onTap: () => onSelected(options.elementAt(index).toString()),
                  ),
                ),
              ),
            ),
          ),
        ),
        fieldViewBuilder: (context, controller, focusNode, onEditingComplete) => TextFormField(
          validator: validator,
          controller: controller,
          focusNode: focusNode,
          onEditingComplete: onEditingComplete,
          onChanged: (value) {
            UserData selectedUserData =
                optionsList.firstWhere((option) => "${option.user.firstName} ${option.user.lastName}" == value);
            selectedUser.value = selectedUserData;
          },
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: context.primaryColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: context.primaryColor,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: context.errorColor,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: context.errorColor,
              ),
            ),
            labelText: labelText,
            labelStyle: TextStyle(
              color: context.primaryColor,
            ),
            suffixIcon: Icon(Icons.arrow_drop_down, color: Theme.of(context).colorScheme.secondary),
          ),
        ),
      ),
    );
  }
}
