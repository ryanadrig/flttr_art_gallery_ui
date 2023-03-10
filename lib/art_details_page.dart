import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_expandable_text/flutter_expandable_text.dart';
import 'package:art_store_ui/reactions_widget.dart';
import 'package:art_store_ui/as_globals.dart';

class ArtDetailsPage extends StatefulWidget {
   ArtDetailsPage({Key? key, required this.as_item}) : super(key: key);

  Map as_item;

  @override
  _ArtDetailsPageState createState() => _ArtDetailsPageState();
}

class _ArtDetailsPageState extends State<ArtDetailsPage> {

  // int art_image_chosen_idx = 0;
  PageController page_controller = PageController();
  bool is_favorite = false;

  @override
  Widget build(BuildContext context) {

      double toolbar_height = ss.height*.08;
      double page_view_height = ss.width *.88;
    return SafeArea(child:Scaffold(body:
    Container(width: ss.width,
              height: ss.height,
    child:Column(children: [

    Container(
        height: toolbar_height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width:ss.width*.14,
        height: ss.width*.14,
        child: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back))),
          Container(
            width:ss.width*.14,
            height: ss.width*.14,
            child:
          IconButton(onPressed: (){
            setState(() {
              is_favorite = !is_favorite;
            });
          }, icon: is_favorite==false?Icon(Icons.star_outline):
          Icon(Icons.star,color: Colors.yellow[700],)))
      ],)),


          SingleChildScrollView(
              child: Container(
                  height: page_view_height,
                width: ss.width,
                child:
                PageView.builder(
                      padEnds: false,
                      controller: page_controller,
                      itemBuilder: (context, index) {
                        return
                        SizedBox(
                            width:ss.width,
                            // color: Colors.green[100 * index],
                            child:Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                    Padding(
                      padding: EdgeInsets.only(left:ss.width*.03),
                        child:FittedBox(
                                    fit: BoxFit.contain,
                                    child:ClipRRect(
                        borderRadius: BorderRadius.circular(ss.width*.1),
                        child: Image.asset(widget.as_item["image_path"],
                                                      width: ss.width * .88,
                                                      height: ss.width * .88,
                                                      fit: BoxFit.fitWidth,
                        ))))]));
                      },
                    )
                )),

    Container(
        height: ss.width * .04,
        child:Center(child:
      SmoothPageIndicator(
          // activeIndex: art_image_chosen_idx,
          count:  3,
          controller: page_controller,
          axisDirection: Axis.horizontal,
          effect: ExpandingDotsEffect(
                radius:  ss.width* .02,
                dotWidth:  ss.width * .02,
                dotHeight:  ss.width * .02,
                spacing: ss.width * .03,
                paintStyle:  PaintingStyle.stroke,
                strokeWidth:  1.5,
                dotColor:  g_accent_color,
                activeDotColor:  Colors.lightBlueAccent
          )
        ))),
      Padding(padding:EdgeInsets.all(ss.width*.02),
      child:
      Container(
          height: ss.height - toolbar_height - page_view_height  - ss.width * .13 - ss.width* .03,
          child:
      ListView(children:[
      Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children:[
        Column(children:[
      Container(
          width: ss.width*.7,
          child:Text(widget.as_item["main_title"],
        style: TextStyle(fontSize: ss.width*.05,
            fontWeight: FontWeight.w500),)),
        Container(
            width: ss.width*.7,
            child:Text(widget.as_item["artist"],
          style: TextStyle(fontSize: ss.width*.04,
              fontWeight: FontWeight.w400),))
        ]),

        Container(
            padding:EdgeInsets.all(ss.width*.04),
            child:Text(  "\$" + widget.as_item["price"]))
      ]),
        Padding(padding:EdgeInsets.all(ss.width*.02)),
          Flexible(
            // color: Colors.blue,
            // height: ss.width * .15,
        child: ExpandableText(
            widget.as_item["short_desc"],
          style: TextStyle(
              fontSize: ss.width*.03,
              color: Colors.black
          ),
          trimType: TrimType.lines,
          trim: 3,
          readLessText: 'Less',
          readMoreText: 'Tap for more',
          linkTextStyle:  TextStyle(
              color: g_accent_color,
              fontSize: ss.width*.03,
              fontWeight: FontWeight.bold),
          onLinkPressed: (expanded) {
              setState(() {
                var textExpanded=true;
              });
          },
        )),
        Padding(padding:EdgeInsets.all(ss.width*.02)),
          Container(
            width: ss.width ,

      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
        ClipRRect(borderRadius: BorderRadius.all(Radius.circular(ss.width*.08),),
        child:Image.asset(widget.as_item["pp_path"],
                          width: ss.width*.16,
                          height: ss.width*.16,
                          fit: BoxFit.contain
        )),

        Container(
            width: ss.width * .42,
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding:EdgeInsets.only(left:ss.width*.02),
                        child:
                    Text(widget.as_item["artist"]),),
          Container(
            padding:EdgeInsets.only(left:ss.width*.01),
            child:
                    Text(widget.as_item["num_arts"] + " contributions",
                          style: TextStyle(fontSize: ss.width*.04,
                                            fontWeight: FontWeight.w300),))
                  ],)),

        Container(width: ss.width*.27,
                  height: ss.width*.14,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ss.width*.055),
                border: Border.all(width: 1.0, color:g_accent_color)
            ),
            child:
            MaterialButton(
                onPressed: (){},
                child:
                Center(child:

                  Text("+ Friend",
                    style: TextStyle(color:g_accent_color),
                  ),

                )))
                  ])),
          Container(height: ss.width*.02,),
          Container(
            padding:EdgeInsets.only(left:ss.width*.01),
            height: ss.height*.2,
          child: Row(children: [
          ReactionsWidget(users: widget.as_item["reaction_users"]),

          Container(width: ss.width*.38,
              height: ss.width*.14,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(ss.width*.055),
                  color: g_accent_color
              ),
              child:
              MaterialButton(
                  onPressed: (){},
                  child:
                  Center(child:
                  Row(children: [
                    Text("Buy Now",
                      style: TextStyle(color:Colors.white),
                    ),
                    Icon(Icons.arrow_right,
                        color:Colors.white

                    )
                  ]),
                  )))

        ],))

      ],)))

    ])

    )));
  }
}
