import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image_web/cached_network_image_web.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'clases.dart';

class VistaImagenes extends StatelessWidget {
  const VistaImagenes({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /* CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(url),
          ), */
          CachedNetworkImage(imageUrl: url),
          TextButton(onPressed: (){
            var bloc = context.read<ClaseBloc>();
            bloc.add(Creado());
          }, child: Text('Volver'))
        ],
      ),
    );
  }
}