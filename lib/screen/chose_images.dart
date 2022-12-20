import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
class ImagesUpload extends StatefulWidget {
  const ImagesUpload({Key? key}) : super(key: key);

  @override
  State<ImagesUpload> createState() => _ImagesUploadState();
}

class _ImagesUploadState extends State<ImagesUpload> {
  CollectionReference _collectionReference=FirebaseFirestore.instance.collection('products');
  String image_url='';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(onPressed: () async {
          ImagePicker imagePicker=ImagePicker();
          XFile ? file= await imagePicker.pickImage(source: ImageSource.camera);
          Reference reference=FirebaseStorage.instance.ref();
          Reference referenceDirImage=reference.child('images');
          Reference referenceImageUpload=referenceDirImage.child("${file?.path}");
          try{
            await referenceImageUpload.putFile(File(file!.path));
            image_url=await referenceImageUpload.getDownloadURL();
          }catch(e){
              print(e);
          }
        }, icon: Icon(Icons.camera_alt_sharp)),
        IconButton(onPressed: (){
          ImagePicker imagePicker=ImagePicker();
          imagePicker.pickImage(source: ImageSource.gallery);
        }, icon: Icon(Icons.image)),

      ],
    );
  }
}
