import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: Row(
        children: <Widget>[
          buildDivider(),
          buildDivider(),
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return const Expanded(
      child: Divider(
        color: Colors.blue,
        height: 1.5,
      ),
    );
  }
}

class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.8,
      child: Row(
        children: <Widget>[
          buildDivider(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "OR",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          buildDivider(),
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return const Expanded(
      child: Divider(
        color: Colors.blue,
        height: 1.5,
      ),
    );
  }
}

class CustomPageRoute extends PageRouteBuilder {
  final Widget child;

  CustomPageRoute({required this.child})
      : super(
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (context, animation, secondaryAnimation) => child,
  );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) =>
      SlideTransition(
        child: child,
        position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
            .animate(animation),
      );
}

class RoundedButton extends StatelessWidget {
  final void Function()? press;
  final String text;
  final Color textColor;
  final Color bgColor;

  const RoundedButton(this.press, this.text, this.textColor, this.bgColor);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      // margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        // borderRadius: BorderRadius.circular(29),
        child: TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
            backgroundColor: bgColor,
          ),
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                letterSpacing: 1.3),
          ),
        ),
      ),
    );
  }
}

class RoundedInputField extends StatelessWidget {
  RoundedInputField(
      {this.label = '',
        this.keyboardtype,
        this.controller,
        this.validator,
        this.iconChoose,
        required this.obscureText,
        required this.onChanged,
        required this.suffixiIcon,
        this.hint = ''});

  final iconChoose;
  final suffixiIcon;
  final String hint;
  final validator;
  final void Function(String) onChanged;
  final controller;
  final keyboardtype;
  final String label;
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardtype,
      validator: validator,
      onChanged: onChanged,
      obscureText: obscureText,
      controller: controller,
      cursorColor: Colors.blue[800],
      decoration: InputDecoration(
          fillColor: Colors.blue[50],
          contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 0.8),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(
              width: 0.8,
              color: Colors.blue,
            ),
          ),
          hintText: hint,
          labelText: label,
          prefixIcon: Icon(
            iconChoose,
            color: Colors.blue,
          ),
          suffixIcon: Icon(suffixiIcon, color: Colors.blue)),
    );
  }
}

class ContactFiled extends StatelessWidget {
  const ContactFiled({
    Key? key,
    required this.onChanged,
    required this.iconData,
    required this.label,
    required this.hint, required this.keybaord,
  }) : super(key: key);

  final void Function(String)? onChanged;
  final IconData iconData;
  final String label, hint;
  final TextInputType keybaord;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keybaord,
      initialValue: '',
      onChanged: onChanged,
      decoration: InputDecoration(
          fillColor: Colors.blue[50],
          contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              width: 1,
              color: Colors.blue,
            ),
          ),
          hintText: hint,
          labelText: label,
          prefixIcon: Icon(
            iconData,
            color: Colors.blue,
          )),
    );
  }
}


InputDecoration kDecoration = InputDecoration(
  fillColor: Colors.blue[50],
  contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
  filled: true,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(width: 1),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(
      width: 1,
      color: Colors.blue,
    ),
  ),
);

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    Key? key,
    required this.heading,
    required this.info,
  }) : super(key: key);

  final String heading, info;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        Text(
          info,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
