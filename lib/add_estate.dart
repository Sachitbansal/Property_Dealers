import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:property_dealers/home_page.dart';
import 'package:property_dealers/widgets.dart';

enum SingingCharacter { lafayette, jefferson }

class AddEstate extends StatefulWidget {
  final String id;

  const AddEstate({Key? key, required this.id}) : super(key: key);

  @override
  State<AddEstate> createState() => _AddEstateState();
}

class _AddEstateState extends State<AddEstate> {

  late String name,
      address,
      whatsapp,
      email,
      phone,
      state,
      city,
      country,
      pin,
      buySell = 'na';

  late String area,
      landmark,
      pincode,
      sector,
      Pstate,
      Pcountry,
      Pcity,
      OtherDetails = 'na';

  late String pricing, SellingPrice, paymentType = 'na';

  late String dropdownValue = 'Commertial';

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection(widget.id);

    DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
          value: item,
          child: Text(
            item,
            style: const TextStyle(fontSize: 20),
          ),
        );
    final Size size = MediaQuery.of(context).size;
    final itemList = ['Residential', 'Commertial', 'Retail', 'Office Space'];

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xff92DFF3),
        Color(0xffB7E9F7),
        Color(0xffB7E9F7),
        Color(0xffF5FCFF),
      ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 30,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Text('Add a lead'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: size.width * .35,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue, width: 2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        child: TextButton(
                          onPressed: () => setState(() {
                            buySell = 'Sell';
                          }),
                          child: const Text(
                            'Seller',
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                      Container(
                        width: size.width * .35,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue, width: 2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        child: TextButton(
                          onPressed: () => setState(() {
                            buySell = 'Buy';
                          }),
                          child: const Text(
                            'Buyer',
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * .05,
                  ),
                  const Text(
                    'Contact Details',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  ContactFiled(
                    onChanged: (string) {
                      setState(() {
                        name = string;
                      });
                    },
                    iconData: Icons.perm_identity_outlined,
                    label: 'Name',
                    hint: 'Full Name',
                    keybaord: TextInputType.name,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  ContactFiled(
                    onChanged: (string) {
                      setState(() {
                        phone = string;
                      });
                    },
                    iconData: Icons.call,
                    label: 'Phone',
                    hint: 'Phone Number',
                    keybaord: TextInputType.phone,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  ContactFiled(
                    onChanged: (string) {
                      setState(() {
                        whatsapp = string;
                      });
                    },
                    iconData: Icons.call,
                    label: 'Whatsapp',
                    hint: 'Whatsapp Number',
                    keybaord: TextInputType.phone,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  ContactFiled(
                    onChanged: (string) {
                      setState(() {
                        email = string;
                      });
                    },
                    iconData: Icons.email_outlined,
                    label: 'Email',
                    hint: 'Email ID',
                    keybaord: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  ContactFiled(
                    onChanged: (string) {
                      setState(() {
                        address = string;
                      });
                    },
                    iconData: Icons.home_outlined,
                    label: 'Address',
                    hint: 'Address',
                    keybaord: TextInputType.text,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width * .44,
                        child: ContactFiled(
                          label: 'State',
                          onChanged: (string) {
                            setState(() {
                              state = string;
                            });
                          },
                          iconData: Icons.flag_outlined,
                          hint: 'State',
                          keybaord: TextInputType.text,
                        ),
                      ),
                      SizedBox(
                        width: size.width * .44,
                        child: ContactFiled(
                          label: 'City',
                          keybaord: TextInputType.text,
                          onChanged: (string) {
                            setState(() {
                              city = string;
                            });
                          },
                          iconData: Icons.flag_outlined,
                          hint: 'City',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width * .44,
                        child: ContactFiled(
                          label: 'Country',
                          keybaord: TextInputType.text,
                          onChanged: (string) {
                            setState(() {
                              country = string;
                            });
                          },
                          iconData: Icons.flag_outlined,
                          hint: 'Country',
                        ),
                      ),
                      SizedBox(
                        width: size.width * .44,
                        child: ContactFiled(
                          label: 'Pin',
                          keybaord: TextInputType.number,
                          onChanged: (string) {
                            setState(() {
                              pin = string;
                            });
                          },
                          iconData: Icons.pin,
                          hint: 'Pin Code',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * .03,
                  ),
                  const Text(
                    'Property Details',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  const Text(
                    'Property Type',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * .01,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 1.5),
                        borderRadius: BorderRadius.circular(20)),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 10,
                      underline: Container(
                        height: 1,
                        color: Colors.blue[200],
                      ),
                      onChanged: (value) {
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                      items: itemList.map(buildMenuItem).toList(),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  ContactFiled(
                    onChanged: (string) {
                      setState(() {
                        area = string;
                      });
                    },
                    iconData: Icons.home_outlined,
                    label: 'Area',
                    hint: 'Area',
                    keybaord: TextInputType.text,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  ContactFiled(
                    onChanged: (string) {
                      setState(() {
                        landmark = string;
                      });
                    },
                    iconData: Icons.home_outlined,
                    label: 'Landmark',
                    hint: 'Landmark',
                    keybaord: TextInputType.text,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  ContactFiled(
                    onChanged: (string) {
                      setState(() {
                        pincode = string;
                      });
                    },
                    iconData: Icons.pin,
                    label: 'Pin',
                    hint: 'Pin Code',
                    keybaord: TextInputType.phone,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width * .44,
                        child: ContactFiled(
                          label: 'State',
                          onChanged: (string) {
                            setState(() {
                              Pstate = string;
                            });
                          },
                          iconData: Icons.flag_outlined,
                          hint: 'State',
                          keybaord: TextInputType.text,
                        ),
                      ),
                      SizedBox(
                        width: size.width * .44,
                        child: ContactFiled(
                          label: 'City',
                          keybaord: TextInputType.text,
                          onChanged: (string) {
                            setState(() {
                              Pcity = string;
                            });
                          },
                          iconData: Icons.flag_outlined,
                          hint: 'City',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width * .44,
                        child: ContactFiled(
                          label: 'Country',
                          keybaord: TextInputType.text,
                          onChanged: (string) {
                            setState(() {
                              Pcountry = string;
                            });
                          },
                          iconData: Icons.flag_outlined,
                          hint: 'Country',
                        ),
                      ),
                      SizedBox(
                        width: size.width * .44,
                        child: ContactFiled(
                          label: 'Sector',
                          keybaord: TextInputType.number,
                          onChanged: (string) {
                            setState(() {
                              sector = string;
                            });
                          },
                          iconData: Icons.flag_outlined,
                          hint: 'Sector',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  ContactFiled(
                    onChanged: (string) {
                      setState(() {
                        OtherDetails = string;
                      });
                    },
                    iconData: Icons.find_in_page,
                    label: 'Other Details',
                    hint: 'Details',
                    keybaord: TextInputType.text,
                  ),
                  SizedBox(
                    height: size.height * .03,
                  ),
                  const Text(
                    'Selling Details',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width * .44,
                        child: ContactFiled(
                          label: 'Price',
                          keybaord: TextInputType.number,
                          onChanged: (string) {
                            setState(() {
                              pricing = string;
                            });
                          },
                          iconData: Icons.monetization_on_outlined,
                          hint: 'Price',
                        ),
                      ),
                      SizedBox(
                        width: size.width * .44,
                        child: ContactFiled(
                          label: 'Selling Price',
                          keybaord: TextInputType.number,
                          onChanged: (string) {
                            setState(() {
                              SellingPrice = string;
                            });
                          },
                          iconData: Icons.monetization_on_outlined,
                          hint: 'Price',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  ContactFiled(
                    onChanged: (string) {
                      setState(() {
                        paymentType = string;
                      });
                    },
                    iconData: Icons.money,
                    label: 'Payment',
                    hint: 'Payment Type',
                    keybaord: TextInputType.text,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        CustomPageRoute(
                          child: MyHomePage(
                            id: widget.id,
                          ),
                        ),
                      );
                      await users
                          .doc()
                          .set({
                            'Name': name,
                            'Phone': phone,
                            'Whatsapp': whatsapp,
                            'Email': email,
                            'Address': address,
                            'State': state,
                            'City': city,
                            'Coountry': country,
                            'Pin': pin,
                            'buysell': buySell,
                            'Area': area,
                            'Landmark': landmark,
                            'Ppin': pincode,
                            'Sector': sector,
                            'Pstate': Pstate,
                            'Pcountry': Pcountry,
                            'Pcity': Pcity,
                            'OtherDetails': OtherDetails,
                            'Pricing': pricing,
                            'SellingPrice': SellingPrice,
                            'PaymentType': paymentType,
                          })
                          .then((value) => print("User Added"))
                          .catchError(
                              (error) => print("Failed to add user: $error"));
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
