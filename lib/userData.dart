import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'Global.dart';
import 'model.dart';

class userDataDisplay extends StatefulWidget {
  const userDataDisplay({Key? key}) : super(key: key);

  @override
  State<userDataDisplay> createState() => _userDataDisplayState();
}

class _userDataDisplayState extends State<userDataDisplay> {
  HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "UserData Respones",
            style: GoogleFonts.lato(
                fontSize: 20, fontWeight: FontWeight.w900, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),
        backgroundColor: Colors.grey.shade200,
        body: Column(
          children: [
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CupertinoTextField(
                controller: Global.controller,
                keyboardType: TextInputType.number,
                placeholder: "Enter the Number of People",
                placeholderStyle: GoogleFonts.lato(color: Colors.grey),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                onSubmitted: (String val){
                  setState(() {
                    Global.pepole = val;
                    Global.controller.clear();
                  });
                },
              ),
            ),
            Expanded(
                flex: 10,
                child: FutureBuilder(
                  future: httpService.getUserData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Result> data = snapshot.data!;
                      return ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 12),
                              child: ClipRect(
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: ExpansionTile(
                                    expandedCrossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          "${data[index].picture!.medium}"),
                                    ),
                                    tilePadding:
                                    EdgeInsets.symmetric(horizontal: 15),
                                    title: Text(
                                      "${data[index].name!.title} ${data[index].name!.first} ${data[index].name!.last}",
                                      style: FontStyle.title,
                                    ),
                                    subtitle: Text(
                                      "${data[index].email}",
                                      style: FontStyle.subtitle,
                                    ),
                                    expandedAlignment: Alignment.centerLeft,
                                    childrenPadding: EdgeInsets.all(10),
                                    children: [
                                      Center(
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              "${data[index].picture!.large}"),
                                          radius: 60,
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        " Name : ${data[index].name!.title} ${data[index].name!.first} ${data[index].name!.last}",
                                        style: FontStyle.title,
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        " Age : ${data[index].registered!.age}",
                                        style: FontStyle.title,
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        "Phone No : ${data[index].phone} / ${data[index].cell}",
                                        style: FontStyle.title,
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        "Gender : ${data[index].gender}",
                                        style: FontStyle.title,
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        "DOB : ${data[index].dob!.date}",
                                        style: FontStyle.title,
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        "Age : ${data[index].dob!.age}",
                                        style: FontStyle.title,
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        "Register Date : ${data[index].registered!.date}",
                                        style: FontStyle.title,
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        "Register Age : ${data[index].registered!.age}",
                                        style: FontStyle.title,
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        "ID Name : ${data[index].id!.name}",
                                        style: FontStyle.title,
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        "ID Value : ${data[index].id!.value}",
                                        style: FontStyle.title,
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        "Nationality : ${data[index].nat}",
                                        style: FontStyle.title,
                                      ),
                                      SizedBox(height: 3),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          const Text("Location :: "),
                                          Expanded(
                                            child: Text(
                                              "${data[index].location!.street!.number}, ${data[index].location!.street!.name} "
                                                  "${data[index].location!.city}, ${data[index].location!.state}, "
                                                  "${data[index].location!.country}, ${data[index].location!.postcode}, ",
                                              style: FontStyle.title,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 3),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Coordinates :: ",
                                            style: FontStyle.title,
                                          ),
                                          Expanded(
                                            child: Text(
                                              "Latitude : ${data[index].location!.coordinates!.latitude}\n"
                                                  "Longitude : ${data[index].location!.coordinates!.longitude}",
                                              style: FontStyle.title,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 3),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Timezon :: ",
                                            style: FontStyle.title,
                                          ),
                                          Expanded(
                                            child: Text(
                                              "OffSet : ${data[index].location!.timezone!.offset}\n"
                                                  "Description : ${data[index].location!.timezone!.description}",
                                              style: FontStyle.title,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 3),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Login :: ",
                                            style: FontStyle.title,
                                          ),
                                          Expanded(
                                            child: Text(
                                              "Username : ${data[index].login!.username}\n"
                                                  "Password : ${data[index].login!.password}",
                                              style: FontStyle.title,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )),
          ],
        ));
  }
}

class HttpService {
  Future<List<Result>> getUserData() async {
    Response response = await get(Uri.parse(Global.base_url + Global.pepole));
    if (response.statusCode == 200) {
      UserData userdata = UserData.fromJson(json.decode(response.body));
      List<Result> resultList = [];
      resultList.addAll(userdata.results!);
      return resultList;
    } else {
      print(response.statusCode);
      throw "Unable to retrieve posts.";
    }
  }
}
