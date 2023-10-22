import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference videoCollection =
      FirebaseFirestore.instance.collection('videos');
  final CollectionReference uploadVideoCollection =
      FirebaseFirestore.instance.collection('uploadVideos');
  final CollectionReference infoCollection =
      FirebaseFirestore.instance.collection('info');
  final CollectionReference allImgCollection =
      FirebaseFirestore.instance.collection('allImages');
  final CollectionReference uploadPhotosCollection =
      FirebaseFirestore.instance.collection('uploadPhotos');
  final CollectionReference doctorCollection =
      FirebaseFirestore.instance.collection('doctors');
  final CollectionReference trainerCollection =
      FirebaseFirestore.instance.collection('trainers');
  final CollectionReference teachersCollection =
      FirebaseFirestore.instance.collection('teachers');
  final CollectionReference adminCollection =
      FirebaseFirestore.instance.collection('admin');
  final CollectionReference quizCollection =
      FirebaseFirestore.instance.collection("quiz");
  final CollectionReference groupCollection =
      FirebaseFirestore.instance.collection("groups");
  final CollectionReference messageCollection =
      FirebaseFirestore.instance.collection("messages");
  final CollectionReference prescriptionCollection =
      FirebaseFirestore.instance.collection("prescriptions");

  // Saving Doctor data into firestore
  Future savingDoctorData(
      String name, String email, String gender, String type) async {
    return await doctorCollection
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      'name': name,
      'email': email,
      'profilePic': '',
      'groups': [],
      'gender': gender,
      'doctor': type,
      'doctorId': FirebaseAuth.instance.currentUser!.uid
    });
  }

  // Saving User data into firestore
  Future savingUserData(
      String name, String email, String village, String gender) async {
    return await userCollection
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      'name': name,
      'email': email,
      'profilePic': '',
      'village': village,
      'gender': gender,
      'userId': FirebaseAuth.instance.currentUser!.uid,
      'groups': [],
    });
  }

  Future savingTeacherData(
      String fullName, String email, String gender, String subject) async {
    return await teachersCollection
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      'name': fullName,
      'email': email,
      'gender': gender,
      'groups': [],
      'subject': subject,
      'teacherId': FirebaseAuth.instance.currentUser!.uid,
    });
  }

  // uploading prescription of user in subcollection of user
  Future uploadingUserPrescription(String name, String village, String age,
      String description, String prescriptionUrl, String userId) async {
    await userCollection.doc(userId).collection('prescriptions').add({
      'name': name,
      'village': village,
      'age': age,
      'description': description,
      'prescriptionUrl': prescriptionUrl,
      'userId': userId,
      'date': DateTime.now().toString(),
    });

    await prescriptionCollection.doc('${userId}_$name').set({
      'name': name,
      'village': village,
      'age': age,
      'description': description,
      'prescriptionUrl': prescriptionUrl,
      'userId': userId,
      'date': DateTime.now().toString(),
    });
  }

  gettingPrescription() async {
    return await prescriptionCollection.get();
  }

  deletePrescription(String id, String name) async {
    await prescriptionCollection.doc('${id}_$name').delete();
  }

  // adding user to group
  Future addingUserToGroup(
      String groupId, String groupName, String userId, String userName) async {
    DocumentReference userDocRef = userCollection.doc(userId);
    DocumentReference groupDocRef = groupCollection.doc(groupId);

    await userDocRef.update(
      ({
        'groups': FieldValue.arrayUnion(['${groupId}_$groupName'])
      }),
    );
    await groupDocRef.update({
      "members": FieldValue.arrayUnion(["${userId}_$userName"])
    });
  }

  // adding trainer to group
  Future addingTrainerToGroup(String groupId, String groupName,
      String trainerId, String trainerName) async {
    DocumentReference trainerDocRef = trainerCollection.doc(trainerId);
    DocumentReference groupDocRef = groupCollection.doc(groupId);

    await trainerDocRef.update(
      ({
        'groups': FieldValue.arrayUnion(['${groupId}_$groupName'])
      }),
    );
    await groupDocRef.update({
      "members": FieldValue.arrayUnion(["${trainerId}_$trainerName"])
    });
  }

  // adding doctor to group
  Future addingDoctorToGroup(String groupId, String groupName, String doctorId,
      String doctorName) async {
    DocumentReference doctorDocRef = doctorCollection.doc(doctorId);
    DocumentReference groupDocRef = groupCollection.doc(groupId);

    await doctorDocRef.update(
      ({
        'groups': FieldValue.arrayUnion(['${groupId}_$groupName'])
      }),
    );
    await groupDocRef.update({
      "members": FieldValue.arrayUnion(["${doctorId}_$doctorName"])
    });
  }

  // adding teacher to group
  Future addingTeacherToGroup(String groupId, String groupName,
      String teacherId, String teacherName) async {
    DocumentReference teacherDocRef = teachersCollection.doc(teacherId);
    DocumentReference groupDocRef = groupCollection.doc(groupId);

    await teacherDocRef.update(
      ({
        'groups': FieldValue.arrayUnion(['${groupId}_$groupName'])
      }),
    );
    await groupDocRef.update({
      "members": FieldValue.arrayUnion(["${teacherId}_$teacherName"])
    });
  }

  Future addingAdminToGroup(String groupId, String groupName, String adminId,
      String adminName) async {
    DocumentReference adminDocRef = adminCollection.doc(adminId);
    DocumentReference groupDocRef = groupCollection.doc(groupId);

    await adminDocRef.update(
      ({
        'groups': FieldValue.arrayUnion(['${groupId}_$groupName'])
      }),
    );
    await groupDocRef.update({
      "members": FieldValue.arrayUnion(["${adminId}_$adminName"])
    });
  }

  // getting groups of user
  getUserGroup() async {
    return userCollection.doc(uid).snapshots();
  }

  // getting groups of admin
  getAdminGroup() async {
    return adminCollection.doc(uid).snapshots();
  }

  // getting groups of doctor
  getDoctorGroup(String uid) async {
    return doctorCollection.doc(uid).snapshots();
  }

  // getting groups of trainer
  getTrainerGroup() async {
    return trainerCollection.doc(uid).snapshots();
  }

  // getting groups of teacher
  getTeacherGroup() async {
    return teachersCollection.doc(uid).snapshots();
  }

  // Saving Admin data into firestore
  Future savingAdminData(String name, String email, String gender) async {
    return await adminCollection
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      'name': name,
      'email': email,
      'profilePic': '',
      'gender': gender,
      'adminId': FirebaseAuth.instance.currentUser!.uid,
      'groups': [],
    });
  }

  Future gettingAdminDataUsingUID() async {
    return await adminCollection.doc(uid).get();
  }

  // Saving form data in firestore
  Future savingQuizData(
    String block,
    String fullName,
    String id,
    String village,
    String faHsName,
    String gender,
    String role,
    String dob,
    String aadharNo,
    String religion,
    String category,
    String martial,
    String education,
    String employment,
    String income,
    String famSize,
    int childrenCount,
    String eduInCov,
    String covid,
    String wave,
    String test,
    String treatment,
    String vaccinated,
    String dose,
    String vaccine,
    String whyNot,
    String pharmacies,
    String blockNo,
    String closeCovid,
    String closeDie,
    String sleepProb,
    String dietTaken,
    String milletIn,
    String milletUse,
    String milkConsum,
    String veg,
    String waterSrc,
    String waterTreat,
    String waterQualSat,
    String waterCausePoor,
    String handSani,
    String handSaniFreq,
    String handWashAlte,
    String cleanliness,
    String formFiller,
    // medicines
    bool highBP,
    bool diabetes,
    bool heartDisease,
    bool highCholesterol,
    bool depression,
    bool sleeppills,
    bool anxiety,
    bool thyroid,
    bool memoryEnhancer,
    bool parkinson,
    bool jointPain,
    bool eyeDisorder,
    bool preventHeartAttack,
  ) async {
    return await quizCollection.doc().set({
      'block': block,
      'fullName': fullName,
      'id': id,
      'village': village,
      'father_husbandName': faHsName,
      'Gender': gender,
      'role': role,
      'dob': dob,
      'aadharNo': aadharNo,
      'religion': religion,
      'category': category,
      'martial': martial,
      'education': education,
      'employment': employment,
      'income': income,
      'famSize': famSize,
      'childrenCount': childrenCount,
      'eduInCov': eduInCov,
      'covid': covid,
      'wave': wave,
      'test': test,
      'treatment': treatment,
      'vaccinated': vaccinated,
      'whyNot': whyNot,
      'pharmacies': pharmacies,
      'blockNo': blockNo,
      'closeCovid': closeCovid,
      'closeDie': closeDie,
      'sleepProb': sleepProb,
      'dietTaken': dietTaken,
      'milletIn': milletIn,
      'milletUse': milletUse,
      'milkConsum': milkConsum,
      'veg': veg,
      'waterSrc': waterSrc,
      'waterTreat': waterTreat,
      'waterQualSat': waterQualSat,
      'waterCausePoor': waterCausePoor,
      'HandSanitier': handSani,
      'handSaniFreq': handSaniFreq,
      'handWashAlternative': handWashAlte,
      'cleanliness': cleanliness,
      'formFiller': formFiller,
      'meds': [
        {
          'highBP': highBP,
          'diabetes': diabetes,
          'heartDisease': heartDisease,
          'highCholesterol': highCholesterol,
          'depression': depression,
          'sleeppills': sleeppills,
          'anxiety': anxiety,
          'thyroid': thyroid,
          'memoryEnhancer': memoryEnhancer,
          'parkinson': parkinson,
          'jointPain': jointPain,
          'eyeDisorder': eyeDisorder,
          'preventHeartAttack': preventHeartAttack,
        }
      ]
    });
  }

  Future gettingQuizData() async {
    return await quizCollection.get();
  }

  Future gettingQuizDataUsingUID(String id) async {
    return await quizCollection.where('id', isEqualTo: id).get();
  }

  // Getting Doctor data from firestore using userID
  Future gettingDoctorData(String uid) async {
    QuerySnapshot snapshot =
        await doctorCollection.where("doctorId", isEqualTo: uid).get();
    return snapshot;
  }

  Future gettingDoctorDataByEmail(String doctorMail) async {
    QuerySnapshot snapshot =
        await doctorCollection.where("email", isEqualTo: doctorMail).get();
    return snapshot;
  }

  // getting doctor data from firestore as snapshot
  Future getDocData() async {
    QuerySnapshot snapshot = await doctorCollection.get();
    return snapshot;
  }

  // Getting User data from firestore
  Future gettingUserData(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }

  // Getting Admin data from firestore
  Future gettingAdminData(String email) async {
    QuerySnapshot snapshot =
        await adminCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }

  // getting group info with group name
  Future gettingGroupData(String groupName) async {
    QuerySnapshot snapshot =
        await groupCollection.where("groupName", isEqualTo: groupName).get();
    return snapshot;
  }

  // Adding video data into firestore
  Future addVideoData(String videoUrl, String videoTitle, String tag) async {
    return await videoCollection.doc(videoTitle).set({
      'videoID': videoUrl,
      'videoTitle': videoTitle,
      'tag': tag,
    });
  }

  // Getting video data from firestore
  Future getVideoData() async {
    QuerySnapshot snapshot = await videoCollection.get();
    return snapshot;
  }

  Future saveAllImages(String imageUrls) async {
    return await allImgCollection.doc().set(
      {'imageUrl': imageUrls},
    );
  }

  // Adding image url into firestore
  Future addImageUrl(List imageUrl, String description, String visitDate,
      String visitVillage, String label) async {
    return await uploadPhotosCollection.doc().set({
      'imageUrl': FieldValue.arrayUnion(imageUrl),
      'description': description,
      'visitDate': visitDate,
      'visitVillage': visitVillage,
      'label': label,
    });
  }

  // Getting image url from firestore
  Future getImageUrl() async {
    QuerySnapshot snapshot = await uploadPhotosCollection.get();
    return snapshot;
  }

  // adding video url to firestore
  Future addVideoUrl(String title, String description, String label,
      String eduTag, String videoUrl) async {
    return await uploadVideoCollection.doc().set({
      'title': title,
      'description': description,
      'eduTag': eduTag,
      'videoUrl': videoUrl,
      'label': label,
    });
  }

  Future visitVideoUpload(
    String title,
    String description,
    String visitVillage,
    String visitDate,
    String label,
    String videoUrl,
  ) async {
    return await uploadVideoCollection.doc().set({
      'title': title,
      'description': description,
      'visitVillage': visitVillage,
      'visitDate': visitDate,
      'videoUrl': videoUrl,
      'label': label,
    });
  }

  Future nutritionVideoUpload(
      String title, String description, String videoUrl, String label) async {
    return await uploadVideoCollection.doc().set({
      'title': title,
      'description': description,
      'videoUrl': videoUrl,
      'label': label,
    });
  }

  Future skillVideoUpload(
      String title, String description, String videoUrl, String label) async {
    return await uploadVideoCollection.doc().set({
      'title': title,
      'description': description,
      'videoUrl': videoUrl,
      'label': label,
    });
  }

  // getVideos(String videoId) async {
  //   return videoCollection.doc(videoId).snapshots();
  // }

  // Future<List<DocumentSnapshot>> getData() async {
  //   QuerySnapshot snapshot =
  //       await FirebaseFirestore.instance.collection("doctors").get();
  //   final List<DocumentSnapshot> documents = snapshot.docs;
  //   return documents;
  // }

  // searching video by tag
  searchVideoByTag(String tag) async {
    return videoCollection.where("tag", isEqualTo: tag).get();
  }

  searchUploadedVideos(String sub) async {
    return uploadVideoCollection
        .where("label", isEqualTo: 'education')
        .where('eduTag', isEqualTo: sub)
        .get();
  }

  // searching doctor by tag
  searchDoctorByTag(String tag) async {
    return doctorCollection.where("doctor", isEqualTo: tag).get();
  }

  // searching user by village name
  searchUserByVillage(String village) async {
    return userCollection.where("village", isEqualTo: village).get();
  }

  // searching user by block name
  searchUserByBlock(String block) async {
    return quizCollection.where("block", isEqualTo: block).get();
  }

  // searching user by gender
  searchUserByGender(String gender) async {
    return userCollection.where('gender', isEqualTo: gender).get();
  }

  searchUserByName(String name) async {
    return userCollection.where('name', isEqualTo: name).get();
  }

  // creating group, adding admin to grouo and adding group to users group list
  Future createGroup(String userName, String id, String groupName) async {
    DocumentReference groupReference = await groupCollection.add({
      'groupName': groupName,
      'id': id,
      'members': [],
      'recentMessage': "",
      'recentMessageSender': "",
    });
    await groupReference.update({
      "members": FieldValue.arrayUnion(["${uid}_$userName"]),
      "groupId": groupReference.id,
    });

    DocumentReference adminDocumentReference = adminCollection.doc(uid);
    return await adminDocumentReference.update({
      "groups": FieldValue.arrayUnion(["${groupReference.id}_$groupName"])
    });
  }

  Future createGroupByDoctor(
      String userName, String id, String groupName) async {
    DocumentReference groupReference = await groupCollection.add({
      'groupName': groupName,
      'id': id,
      'members': [],
      'recentMessage': "",
      'recentMessageSender': "",
    });
    await groupReference.update({
      "members": FieldValue.arrayUnion(["${uid}_$userName"]),
      "groupId": groupReference.id,
    });

    DocumentReference doctorDocumentReference = doctorCollection.doc(uid);
    return await doctorDocumentReference.update({
      "groups": FieldValue.arrayUnion(["${groupReference.id}_$groupName"])
    });
  }

  Future createGroupByTrainer(
      String userName, String id, String groupName) async {
    DocumentReference groupReference = await groupCollection.add({
      'groupName': groupName,
      'id': id,
      'members': [],
      'recentMessage': "",
      'recentMessageSender': "",
    });
    await groupReference.update({
      "members": FieldValue.arrayUnion(["${uid}_$userName"]),
      "groupId": groupReference.id,
    });

    DocumentReference trainerDocumentReference = trainerCollection.doc(uid);
    return await trainerDocumentReference.update({
      "groups": FieldValue.arrayUnion(["${groupReference.id}_$groupName"])
    });
  }

  Future createGroupByTeacher(
      String userName, String id, String groupName) async {
    DocumentReference groupReference = await groupCollection.add({
      'groupName': groupName,
      'id': id,
      'members': [],
      'recentMessage': "",
      'recentMessageSender': "",
    });
    await groupReference.update({
      "members": FieldValue.arrayUnion(["${uid}_$userName"]),
      "groupId": groupReference.id,
    });

    DocumentReference teacherDocumentReference = teachersCollection.doc(uid);
    return await teacherDocumentReference.update({
      "groups": FieldValue.arrayUnion(["${groupReference.id}_$groupName"])
    });
  }

  // searching group by name
  searchGroupByName(String groupName) {
    return groupCollection.where('groupName', isEqualTo: groupName).get();
  }

  getGroupNames() async {
    QuerySnapshot snapshot = await groupCollection.get();
    return snapshot;
  }

  // checking whether user is already joined in group or not
  Future<bool> isUserJoined(
      String groupName, String groupId, String userName) async {
    DocumentReference userDocumentReference = userCollection.doc(uid);
    DocumentSnapshot documentSnapshot = await userDocumentReference.get();

    List<dynamic> groups = await documentSnapshot['groups'];
    if (groups.contains("${groupId}_$groupName")) {
      return true;
    } else {
      return false;
    }
  }

  // adding and removing user from group
  Future togglegroupJoin(
      String groupId, String userName, String groupName) async {
    DocumentReference userDocumentReference =
        userCollection.doc(FirebaseAuth.instance.currentUser!.uid);
    DocumentReference groupDocumentReference = groupCollection.doc(groupId);

    DocumentSnapshot snapshot = await userDocumentReference.get();
    List<dynamic> groups = await snapshot['groups'];

    if (groups.contains("${groupId}_$groupName")) {
      await userDocumentReference.update({
        "groups": FieldValue.arrayRemove(["${groupId}_$groupName"])
      });
      await groupDocumentReference.update({
        "members": FieldValue.arrayRemove(
            ["${FirebaseAuth.instance.currentUser!.uid}_$userName"])
      });
    } else {
      await userDocumentReference.update({
        "groups": FieldValue.arrayUnion(["${groupId}_$groupName"])
      });
      await groupDocumentReference.update({
        "members": FieldValue.arrayUnion(
            ["${FirebaseAuth.instance.currentUser!.uid}_$userName"])
      });
    }
  }

  // sending message to group
  sendMessage(String groupId, Map<String, dynamic> chatMessageData) async {
    groupCollection.doc(groupId).collection('messages').add(chatMessageData);
    groupCollection.doc(groupId).update({
      "recentMessage": chatMessageData['message'],
      "recentMessageSender": chatMessageData['sender'],
      "recentMessageTime": chatMessageData['time'].toString(),
    });
  }

  sendOneToOneMessageAdmin(String senderId, String senderName,
      String receiverId, String receiverName, Map<String, dynamic> chats) {
    adminCollection
        .doc(senderId)
        .collection('messages')
        .doc()
        .collection(receiverName)
        .add({
      'messages': FieldValue.arrayUnion([chats['message']]),
      'sender': chats['sender'],
      'time': FieldValue.arrayUnion([chats['time']]),
    });
    adminCollection.doc(senderId).update({
      'recentMessage': chats['message'],
      'recentMessageSender': chats['sender'],
      'recentMessageTime': chats['time'].toString(),
    });

    userCollection
        .doc(receiverId)
        .collection('messages')
        .doc()
        .collection(senderName)
        .add({
      'messages': FieldValue.arrayUnion([chats['message']]),
      'sender': chats['sender'],
      'time': FieldValue.arrayUnion([chats['time']]),
    });
    userCollection.doc(receiverId).update({
      'recentMessage': chats['message'],
      'recentMessageSender': chats['sender'],
      'recentMessageTime': chats['time'].toString(),
    });
  }

  // getting group chat
  getChat(String groupId) async {
    return groupCollection
        .doc(groupId)
        .collection("messages")
        .orderBy("time")
        .snapshots();
  }

  // getting group members
  getGroupMembers(groupId) async {
    QuerySnapshot snapshot =
        await groupCollection.where('groupId', isEqualTo: groupId).get();
    return snapshot;
  }

  // getting user details
  getUserDetials(String userId) async {
    QuerySnapshot snapshot =
        await userCollection.where('userId', isEqualTo: userId).get();
    return snapshot;
  }

  // length of user collection
  Future<int> getUserLength() async {
    QuerySnapshot snapshot = await userCollection.get();
    return snapshot.docs.length;
  }

  // length of doctor collection
  Future<int> getDoctorLength() async {
    QuerySnapshot snapshot = await doctorCollection.get();
    return snapshot.docs.length;
  }

  // length of trainer collection
  Future<int> getTrainerLength() async {
    QuerySnapshot snapshot = await trainerCollection.get();
    return snapshot.docs.length;
  }

  // length of teacher collection
  Future<int> getTeacherLength() async {
    QuerySnapshot snapshot = await teachersCollection.get();
    return snapshot.docs.length;
  }

  // event collection
  final CollectionReference eventCollection =
      FirebaseFirestore.instance.collection('events');

  // adding event
  Future addEvent(String eventName, String eventDesc, String eventDate,
      String village, String eventTag, String day) {
    return eventCollection.doc('${eventName}_$eventDate').set({
      'eventName': eventName,
      'eventDesc': eventDesc,
      'eventStartDate': eventDate,
      'tag': eventTag,
      'village': village,
      'day': day,
      'eventImages': [],
      'eventVideos': [],
      'eventId': '${eventName}_$eventDate',
    });
  }

  Future getEventByName(String eventName) async {
    QuerySnapshot snapshot =
        await eventCollection.where('eventName', isEqualTo: eventName).get();
    return snapshot;
  }

  Future addEventVideos(
      String videoUrl, String eventName, String eventDate) async {
    eventCollection
        .doc('${eventName}_$eventDate')
        .collection('videos')
        .add({'videoUrl': videoUrl});
  }

  // Trainer
  gettingTrainerDetails(String trainerEmail) async {
    QuerySnapshot snapshot =
        await trainerCollection.where('email', isEqualTo: trainerEmail).get();
    return snapshot;
  }

  // teacher
  gettingTeacherDetails(String teacherEmail) async {
    QuerySnapshot snapshot =
        await teachersCollection.where('email', isEqualTo: teacherEmail).get();
    return snapshot;
  }

  // saving trainer data
  Future savingTrainerData(
      String trainerName, String trainerEmail, String gender) async {
    DocumentReference trainerDocumentReference =
        trainerCollection.doc(FirebaseAuth.instance.currentUser!.uid);
    return await trainerDocumentReference.set({
      "name": trainerName,
      "email": trainerEmail,
      "gender": gender,
      'trainerId': FirebaseAuth.instance.currentUser!.uid,
      "groups": [],
    });
  }

  // get trainer data
  Future getTrainerData() async {
    DocumentReference trainerDocumentReference = trainerCollection.doc(uid);
    return await trainerDocumentReference.get();
  }

  // get trainer who are not in group
  Future getTrainerWhoAreNotInGroup(String groupId, String groupName) async {
    QuerySnapshot snapshot = await trainerCollection
        .where('groups', isNotEqualTo: '${groupId}_$groupName')
        .get();
    return snapshot;
  }

  Future getDoctorsWhoAreNotInGroup(String groupId, String groupName) async {
    QuerySnapshot snapshot = await doctorCollection
        .where('groups', isNotEqualTo: '${groupId}_$groupName')
        .get();
    return snapshot;
  }

  Future getTeachersWhoAreNotInGroup(String groupId, String groupName) async {
    QuerySnapshot snapshot = await teachersCollection
        .where('groups', isNotEqualTo: '${groupId}_$groupName')
        .get();
    return snapshot;
  }

  Future getUsersWhoAreNotInGroup(String groupId, String groupName) async {
    QuerySnapshot snapshot = await userCollection
        .where('village', isEqualTo: groupName)
        .where('groups', isNotEqualTo: '${groupId}_$groupName')
        .get();
    return snapshot;
  }

  Future getUsersWhoAreNotInGroup1(String groupId, String groupName) async {
    QuerySnapshot snapshot = await userCollection
        .where('groups', isNotEqualTo: '${groupId}_$groupName')
        .get();
    return snapshot;
  }

  Future getAdminWhoAreNotInGroup(String groupId, String groupName) async {
    QuerySnapshot snapshot = await adminCollection
        .where('groups', isNotEqualTo: '${groupId}_$groupName')
        .get();
    return snapshot;
  }

  // get users
  Future getAllUsers() async {
    QuerySnapshot userSnapshot = await userCollection.get();
    return userSnapshot;
  }

  Future getAllDoctors() async {
    QuerySnapshot docSnapshot = await doctorCollection.get();
    return docSnapshot;
  }

  Future getAllTrainers() async {
    QuerySnapshot trainerSnapshot = await trainerCollection.get();
    return trainerSnapshot;
  }

  Future getAllTeacher() async {
    QuerySnapshot teacherSnapshot = await teachersCollection.get();
    return teacherSnapshot;
  }

  // saving and getting messages
  Future saveMessage(
    String senderId,
    String receiverId,
    List message,
  ) async {
    messageCollection.doc().set({
      'senderId': senderId,
      'receiverId': receiverId,
      'messages': message,
    });
  }

  Future getMessage(String senderId, String receiverId) async {
    QuerySnapshot snapshot = await messageCollection
        .where('senderId', isEqualTo: senderId)
        .where('receiverId', isEqualTo: receiverId)
        .get();
    return snapshot;
  }

  Future otoMessageSend(String id1, String id2, String message, String sender,
      String receiver, String time) async {
    if (id1.hashCode <= id2.hashCode) {
      await messageCollection.doc(id1 + id2).collection('messages').doc().set({
        'message': message,
        'sender': sender,
        'receiver': receiver,
        'time': time,
      });
    } else {
      await messageCollection.doc(id2 + id1).collection('messages').doc().set({
        'message': message,
        'sender': sender,
        'receiver': receiver,
        'time': time,
      });
    }
  }

  Future otoMessageGet(String id1, String id2) async {
    if (id1.hashCode <= id2.hashCode) {
      QuerySnapshot snapshot = await messageCollection
          .doc(id1 + id2)
          .collection('messages')
          .orderBy('time')
          .get();
      return snapshot;
    } else {
      QuerySnapshot snapshot = await messageCollection
          .doc(id2 + id1)
          .collection('messages')
          .orderBy('time')
          .get();
      return snapshot;
    }
  }

  sendText(String senderCollection, String receiverCollection, String message,
      String senderId, String receiverId, String time) async {
    await FirebaseFirestore.instance
        .collection(senderCollection)
        .doc(senderId)
        .collection('messages')
        .doc()
        .set({
      'message': message,
      'sender': senderId,
      'time': time,
    });
    await FirebaseFirestore.instance
        .collection(receiverCollection)
        .doc(receiverId)
        .collection('messages')
        .doc()
        .set({
      'message': message,
      'sender': senderId,
      'time': time,
    });
  }
}
