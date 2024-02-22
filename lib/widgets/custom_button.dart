import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    this.isLoading = false,
  });

  final void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 55,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: isLoading
                ? const CircularProgressIndicator(
                    color: Colors.deepPurpleAccent,
                  )
                : Text(
                    'Add',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
          ),
        ),
      ),
    );
  }
}
