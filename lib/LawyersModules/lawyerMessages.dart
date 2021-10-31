import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hire_lawyer/Login/DividerBox.dart';
import 'package:hire_lawyer/Values/Strings.dart';



Widget buildMessagesLawyer(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Container(
    color:  Color(0xffEAEDEF),
    child: Column(
      children: [
        Align(
            alignment: Alignment.topCenter,
            child: Text(
              ConstStrings.Messgaes,
              style: TextStyle(
                  fontSize: size.height * 0.028,
                  fontFamily: "NewsCycle-Bold"),
              textAlign: TextAlign.center,
            )),
        DividerBox(
          size: size,
          height: 0.05,
        ),
        Expanded(
            child: ListView(
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(

                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          child: CircleAvatar(
                            radius: 37,
                            backgroundColor: Colors.green,
                            child: CircleAvatar(
                                radius: 33,
                                backgroundImage: NetworkImage(
                                    "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8aHVtYW58ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80")),
                          )),
                      SizedBox(width: size.width * 0.03,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Fathi AYARI"),
                            Text("Bonjour Mr j'espere que vous etiuglhghhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,),
                          ],
                        ),

                      ),
                      Container(
                        child: Text("20:54"),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(

                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          child: CircleAvatar(
                            radius: 37,
                            backgroundColor: Colors.red,
                            child: CircleAvatar(
                                radius: 33,
                                backgroundImage: NetworkImage(
                                    "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8aHVtYW58ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80")),
                          )),
                      SizedBox(width: size.width * 0.03,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Fathi AYARI"),
                            Text("Bonjour Mr j'espere que vous etiuglhghhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,),
                          ],
                        ),

                      ),
                      Container(
                        child: Text("20:54"),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(

                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          child: CircleAvatar(
                            radius: 37,
                            backgroundColor: Colors.green,
                            child: CircleAvatar(
                                radius: 33,
                                backgroundImage: NetworkImage(
                                    "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8aHVtYW58ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80")),
                          )),
                      SizedBox(width: size.width * 0.03,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Fathi AYARI"),
                            Text("Bonjour Mr j'espere que vous etiuglhghhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,),
                          ],
                        ),

                      ),
                      Container(
                        child: Text("20:54"),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(

                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          child: CircleAvatar(
                            radius: 37,
                            backgroundColor: Colors.green,
                            child: CircleAvatar(
                                radius: 33,
                                backgroundImage: NetworkImage(
                                    "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8aHVtYW58ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80")),
                          )),
                      SizedBox(width: size.width * 0.03,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Fathi AYARI"),
                            Text("Bonjour Mr j'espere que vous etiuglhghhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,),
                          ],
                        ),

                      ),
                      Container(
                        child: Text("20:54"),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(

                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          child: CircleAvatar(
                            radius: 37,
                            backgroundColor: Colors.green,
                            child: CircleAvatar(
                                radius: 33,
                                backgroundImage: NetworkImage(
                                    "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8aHVtYW58ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80")),
                          )),
                      SizedBox(width: size.width * 0.03,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Fathi AYARI"),
                            Text("Bonjour Mr j'espere que vous etiuglhghhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,),
                          ],
                        ),

                      ),
                      Container(
                        child: Text("20:54"),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(

                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          child: CircleAvatar(
                            radius: 37,
                            backgroundColor: Colors.green,
                            child: CircleAvatar(
                                radius: 33,
                                backgroundImage: NetworkImage(
                                    "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8aHVtYW58ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80")),
                          )),
                      SizedBox(width: size.width * 0.03,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Fathi AYARI"),
                            Text("Bonjour Mr j'espere que vous etiuglhghhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,),
                          ],
                        ),

                      ),
                      Container(
                        child: Text("20:54"),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(

                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          child: CircleAvatar(
                            radius: 37,
                            backgroundColor: Colors.green,
                            child: CircleAvatar(
                                radius: 33,
                                backgroundImage: NetworkImage(
                                    "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8aHVtYW58ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80")),
                          )),
                      SizedBox(width: size.width * 0.03,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Fathi AYARI"),
                            Text("Bonjour Mr j'espere que vous etiuglhghhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,),
                          ],
                        ),

                      ),
                      Container(
                        child: Text("20:54"),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(

                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          child: CircleAvatar(
                            radius: 37,
                            backgroundColor: Colors.green,
                            child: CircleAvatar(
                                radius: 33,
                                backgroundImage: NetworkImage(
                                    "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8aHVtYW58ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80")),
                          )),
                      SizedBox(width: size.width * 0.03,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Fathi AYARI"),
                            Text("Bonjour Mr j'espere que vous etiuglhghhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,),
                          ],
                        ),

                      ),
                      Container(
                        child: Text("20:54"),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(

                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          child: CircleAvatar(
                            radius: 37,
                            backgroundColor: Colors.green,
                            child: CircleAvatar(
                                radius: 33,
                                backgroundImage: NetworkImage(
                                    "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8aHVtYW58ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80")),
                          )),
                      SizedBox(width: size.width * 0.03,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Fathi AYARI"),
                            Text("Bonjour Mr j'espere que vous etiuglhghhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,),
                          ],
                        ),

                      ),
                      Container(
                        child: Text("20:54"),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(

                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          child: CircleAvatar(
                            radius: 37,
                            backgroundColor: Colors.green,
                            child: CircleAvatar(
                                radius: 33,
                                backgroundImage: NetworkImage(
                                    "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8aHVtYW58ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80")),
                          )),
                      SizedBox(width: size.width * 0.03,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Fathi AYARI"),
                            Text("Bonjour Mr j'espere que vous etiuglhghhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,),
                          ],
                        ),

                      ),
                      Container(
                        child: Text("20:54"),
                      )
                    ],
                  ),
                ),
              ],
            ))
      ],
    ),
  );
}
