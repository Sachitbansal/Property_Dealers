import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/painting.dart';
import 'package:property_dealers/add_estate.dart';
import 'package:property_dealers/widgets.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading = false;
  late Map<String, dynamic> userMap;
  final TextEditingController searchController = TextEditingController();
  List docIDs = [];
  late String dropdownValue = 'Name';

  void onSearch() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    setState(() {
      isLoading = true;
    });

    await firestore
        .collection(widget.id)
        .where(dropdownValue, isGreaterThanOrEqualTo: searchController.text)
        .get()
        .then((value) {
      setState(() {
        userMap = value.docs[0].data();
        isLoading = false;
      });
      print(userMap);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> user =
        FirebaseFirestore.instance.collection(widget.id).snapshots();
    final itemList = ['Name', 'Area', 'Pin Code', 'State'];

    DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
          value: item,
          child: Text(
            item,
            style: const TextStyle(fontSize: 20),
          ),
        );
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          size: 35,
        ),
        onPressed: () => Navigator.push(
          context,
          CustomPageRoute(
            child: AddEstate(
              id: widget.id,
            ),
          ),
        ),
      ),
      appBar: AppBar(),
      body: isLoading
          ? const CircularProgressIndicator()
          : SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: onSearch,
                        ),
                        hintText: 'Search',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 1.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 10,
                      onChanged: (value) {
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                      items: itemList.map(buildMenuItem).toList(),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 88 - 61,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: user,
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return const Text('Something went wrong');
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Text('Loading');
                        }

                        final data = snapshot.requireData;

                        return ListView.builder(
                          reverse: true,
                          itemCount: data.size,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.all(20),
                              padding: const EdgeInsets.all(10),
                              color: Colors.blue[50],
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          icon: const Icon(Icons.delete),
                                          onPressed: () async {
                                            var docRef = await FirebaseFirestore
                                                .instance
                                                .collection(widget.id)
                                                .get();
                                            for (var result in docRef.docs) {
                                              docIDs.add(result.id);
                                            }
                                            FirebaseFirestore.instance
                                                .collection(widget.id)
                                                .doc(docIDs[index])
                                                .delete();
                                          }),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  InfoWidget(
                                    info: '${data.docs[index]['Area']}',
                                    heading: 'Area',
                                  ),
                                  InfoWidget(
                                    info: '${data.docs[index]['Landmark']}',
                                    heading: 'Landmark',
                                  ),
                                  InfoWidget(
                                    info: '${data.docs[index]['Ppin']}',
                                    heading: 'Pin Code',
                                  ),
                                  InfoWidget(
                                    info: '${data.docs[index]['Sector']}',
                                    heading: 'Sector',
                                  ),
                                  InfoWidget(
                                    info: '${data.docs[index]['Pstate']}',
                                    heading: 'State',
                                  ),
                                  InfoWidget(
                                    info: '${data.docs[index]['Pcountry']}',
                                    heading: 'Country',
                                  ),
                                  InfoWidget(
                                    info: '${data.docs[index]['OtherDetails']}',
                                    heading: 'Other Details ',
                                  ),
                                  InfoWidget(
                                    info: '${data.docs[index]['Pricing']}',
                                    heading: 'Pricing',
                                  ),
                                  InfoWidget(
                                    info: '${data.docs[index]['SellingPrice']}',
                                    heading: 'Selling Price',
                                  ),
                                  InfoWidget(
                                    info: '${data.docs[index]['PaymentType']}',
                                    heading: 'Payment Type',
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
