import 'package:flutter/material.dart';

class CirculoOpcao extends StatelessWidget {
  final String imagemPath;
  final double tamanho;
  final VoidCallback? onTap;

  const CirculoOpcao({
    super.key,
    required this.imagemPath,
    this.tamanho = 100,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final circulo = Container(
      width: tamanho,
      height: tamanho,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey[400]!, width: 2),
      ),
      child: ClipOval(
        child: Image.asset(
          imagemPath,
          fit: BoxFit.cover,
        ),
      ),
    );

    if (onTap == null) return circulo;

    return GestureDetector(
      onTap: onTap,
      child: circulo,
    );
  }
}
