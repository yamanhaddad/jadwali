import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jadwali_test_1/modules/child.dart';

class DbHelper {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static const String collectionAdmin = 'Parent';// has to be same name as in firestore

  static Future<bool> isParent(String uid) async {
    final snapshot = await _db.collection(collectionAdmin).doc(uid).get();
    //.doc method returns a document reference from the collection? or creates a new document 
    // pass uid in doc to access a document 
    // to get data from document you can call .get method or .snapshot
    return snapshot.exists;
  }


// sends a child to firebase
static Future<void> addChild(Child newchild){

//create a new document in a collection in firebase
final doc = _db.collection(collectionChild).doc();// return a document reference, this also automaticaly generates an ID
// set child id to the document id
newchild.id = doc.id;
return doc.set(newchild.toMap());
}

//retrive all children 
static Stream<QuerySnapshot<Map<String, dynamic>>> getAllChildren() =>
  _db.collection(collectionChild).snapshots();
}