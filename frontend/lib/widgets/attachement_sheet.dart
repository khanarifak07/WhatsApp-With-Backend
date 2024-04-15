import 'package:flutter/material.dart';

class AttachmentSheet extends StatelessWidget {
  const AttachmentSheet({
    super.key,
    required this.theme,
  });

  final ColorScheme theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: theme.primary, borderRadius: BorderRadius.circular(20)),
      height: MediaQuery.sizeOf(context).height * .30,
      width: MediaQuery.sizeOf(context).width * .95,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconCreation(
                onTap: () {},
                color: const Color(0xff755ee8),
                text: 'Document',
                icon: Icons.insert_drive_file,
              ),
              IconCreation(
                  onTap: () {},
                  color: const Color(0xffe72a6d),
                  icon: Icons.camera_alt,
                  text: "Camera"),
              IconCreation(
                  onTap: () {},
                  color: const Color(0xffb758e6),
                  icon: Icons.photo,
                  text: "Gallery"),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconCreation(
                onTap: () {},
                color: const Color(0xffe45d30),
                text: 'Audio',
                icon: Icons.headset,
              ),
              IconCreation(
                  onTap: () {},
                  color: const Color(0xff1d9b51),
                  icon: Icons.location_on,
                  text: "Location"),
              IconCreation(
                  onTap: () {},
                  color: const Color(0xff0191d0),
                  icon: Icons.person,
                  text: "Contact"),
            ],
          )
        ],
      ),
    );
  }
}

class IconCreation extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final Function() onTap;
  const IconCreation({
    super.key,
    required this.color,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Text(text)
        ],
      ),
    );
  }
}
          // backgroundColor: Color(0xff755ee8),

