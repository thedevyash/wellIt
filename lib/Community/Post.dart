import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final description =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Non odio euismod lacinia at. Tortor aliquam nulla facilisi cras fermentum odio eu. Ut tortor pretium viverra suspendisse potenti nullam. Massa enim nec dui nunc mattis enim ut tellus. In tellus integer feugiat scelerisque varius morbi enim nunc. Quis lectus nulla at volutpat diam ut venenatis tellus. Dolor magna eget est lorem ipsum dolor sit amet. Pellentesque id nibh tortor id. Duis tristique sollicitudin nibh sit amet commodo nulla facilisi. Et netus et malesuada fames ac turpis egestas. Tortor vitae purus faucibus ornare suspendisse sed nisi lacus. Faucibus pulvinar elementum integer enim neque volutpat ac tincidunt. Tellus at urna condimentum mattis. Maecenas accumsan lacus vel facilisis volutpat. Nulla posuere sollicitudin aliquam ultrices sagittis orci. Tellus in metus vulputate eu scelerisque felis imperdiet proin fermentum. Natoque penatibus et magnis dis parturient.";

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white, foregroundColor: Colors.white),
        body: Container(
          padding: const EdgeInsets.all(12),
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(color: Colors.white),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Image.asset("assets/images/india.png"),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Ministry Of Jal Shakti",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ]),
                const SizedBox(
                  height: 10,
                ),
                DescriptionTextWidget(
                  text: description,
                ),
                SizedBox(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/images/jalshakti.png',
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ));
  }
}

class DescriptionTextWidget extends StatefulWidget {
  final String text;

  DescriptionTextWidget({required this.text});

  @override
  _DescriptionTextWidgetState createState() =>
      new _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 50) {
      firstHalf = widget.text.substring(0, 200);
      secondHalf = widget.text.substring(50, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: secondHalf.isEmpty
          ? Text(
              firstHalf,
              style: const TextStyle(color: Colors.black),
            )
          : Column(
              children: <Widget>[
                Text(flag ? (firstHalf + "...") : (firstHalf + secondHalf),
                    style: const TextStyle(color: Colors.black)),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(flag ? "show more" : "show less",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                ),
              ],
            ),
    );
  }
}
