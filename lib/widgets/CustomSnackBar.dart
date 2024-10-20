import 'package:flutter/material.dart';

class CustomTopSnackBar {
  static void show(BuildContext context, String message,
      {Color backgroundColor = Colors.blue, Color textColor = Colors.white}) {
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;

    // Controller per animazione
    final animationController = AnimationController(
      duration: const Duration(milliseconds: 750),
      vsync: Navigator.of(context),
    );

    // Animazione di scorrimento
    final animation = Tween<Offset>(
      begin: const Offset(0, -4),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.elasticInOut,
    ));

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: SafeArea(
          child: Material(
            color: Colors.transparent,
            child: SlideTransition(
              position: animation,
              child: Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        message,
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close, color: textColor),
                      onPressed: () {
                        animationController.reverse().then((_) {
                          overlayEntry.remove();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    // Inserisci l'OverlayEntry e avvia l'animazione di apparizione
    overlay.insert(overlayEntry);
    animationController.forward();

    // Rimuovi lo snack bar dopo 3 secondi con un'animazione di dissolvenza
    Future.delayed(const Duration(seconds: 3), () {
      if (overlayEntry.mounted) {
        animationController.reverse().then((_) {
          overlayEntry.remove();
        });
      }
    });
  }
}
