import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/screens/education/components/ncert/components/pages/firstClass.dart';
import 'package:swastha_aur_swabhimaan/screens/education/components/ncert/components/pages/secondClass.dart';
import 'package:swastha_aur_swabhimaan/screens/education/components/ncert/components/pages/thirdClass.dart';
import 'package:swastha_aur_swabhimaan/screens/education/components/ncert/components/pages/fourthClass.dart';
import 'package:swastha_aur_swabhimaan/screens/education/components/ncert/components/pages/fifthClass.dart';
import 'package:swastha_aur_swabhimaan/screens/education/components/ncert/components/pages/sixthClass.dart';
import 'package:swastha_aur_swabhimaan/screens/education/components/ncert/components/pages/seventhClass.dart';
import 'package:swastha_aur_swabhimaan/screens/education/components/ncert/components/pages/eighthClass.dart';
import 'package:swastha_aur_swabhimaan/screens/education/components/ncert/components/pages/ninthClass.dart';
import 'package:swastha_aur_swabhimaan/screens/education/components/ncert/components/pages/tenthClass.dart';
import 'package:swastha_aur_swabhimaan/screens/education/components/ncert/components/pages/eleventhClass.dart';
import 'package:swastha_aur_swabhimaan/screens/education/components/ncert/components/pages/twelvethClass.dart';
import 'package:url_launcher/url_launcher.dart';

class Constants {
  static String appId = "1:558376078874:android:6fe480ffff9f36c0be0ba3";
  static String apiKey = "AIzaSyCpmqcKBTq-TZLjZP2cKdqTVQ2pjvACpBs";
  static String messagingSenderId = "558376078874";
  static String projectId = "swasthaaurabhimaan";
}

void nextScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void nextScreenReplace(context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}

final List<String> imgList = [
  'Assets/images/adminLogin.png',
  'Assets/images/adminRegister.png',
  'Assets/images/register.png',
];

final List villageName = [
  'Everyone',
  'Vikasnagar',
  'Sahaspur',
  'Doiwala',
];

final List sub = [
  'Send notification to everyone !!',
  'Send notification to Vikasnagar !!',
  'Send notification to Sahaspur !!',
  'Send notification to Doiwala !!',
];

const String maleDoc =
    'https://static.vecteezy.com/system/resources/previews/015/412/022/original/doctor-round-avatar-medicine-flat-avatar-with-male-doctor-medical-clinic-team-round-icon-medical-collection-illustration-vector.jpg';

const String femaleDoc =
    'https://static.vecteezy.com/system/resources/previews/015/413/667/original/doctor-round-avatar-medicine-flat-avatar-with-female-doctor-medical-clinic-team-round-icon-medical-collection-illustration-vector.jpg';

// Education Resource and constants starts

final List resources = [
  {
    'name': 'Unacademy',
    'link': 'https://www.youtube.com/@UnacademyJEE',
    'image': 'Assets/Logo/unacademy.jpg'
  },
  {
    'name': 'Physics Wallah',
    'link': 'https://www.youtube.com/@PhysicsWallah',
    'image': 'Assets/Logo/pw.jpg'
  },
  {
    'name': 'Khan Academy',
    'link': 'https://www.khanacademy.org/',
    'image': 'Assets/Logo/ka.png'
  },
  {
    'name': 'Vedantu',
    'link': 'https://www.vedantu.com/',
    'image': 'Assets/Logo/vedantu.png'
  },
  {
    'name': 'ByJus',
    'link': 'https://byjus.com/',
    'image': 'Assets/Logo/byjus.png'
  },
  {
    'name': 'JavaTpoint',
    'link': 'https://www.javatpoint.com/',
    'image': 'Assets/Logo/javatpoint.png'
  },
  {
    'name': 'Geeks For Geeks',
    'link': 'https://www.geeksforgeeks.org/',
    'image': 'Assets/Logo/gfg.png'
  },
];

final List ncert = [
  {
    'class': '1',
    'page': const FirstClass(),
  },
  {
    'class': '2',
    'page': const SecondClass(),
  },
  {
    'class': '3',
    'page': const ThirdClass(),
  },
  {
    'class': '4',
    'page': const FourthClass(),
  },
  {
    'class': '5',
    'page': const FifthClass(),
  },
  {
    'class': '6',
    'page': const SixthClass(),
  },
  {
    'class': '7',
    'page': const SeventhClass(),
  },
  {
    'class': '8',
    'page': const EighthClass(),
  },
  {
    'class': '9',
    'page': const NinthClass(),
  },
  {
    'class': '10',
    'page': const TenthClass(),
  },
  {
    'class': '11',
    'page': const EleventhClass(),
  },
  {
    'class': '12',
    'page': const TwelvethClass(),
  },
];

final List ncertH = [
  {
    'class': '१',
    'page': '',
  },
  {
    'class': '२',
    'page': '',
  },
  {
    'class': '३',
    'page': '',
  },
  {
    'class': '४',
    'page': '',
  },
  {
    'class': '५',
    'page': '',
  },
  {
    'class': '६',
    'page': '',
  },
  {
    'class': '७',
    'page': '',
  },
  {
    'class': '८',
    'page': '',
  },
  {
    'class': '९',
    'page': '',
  },
  {
    'class': '१o',
    'page': '',
  },
  {
    'class': '११',
    'page': '',
  },
  {
    'class': '१२',
    'page': '',
  }
];

final List first = ['English', 'Hindi', 'Maths'];
final List firstLinks = [
  'https://www.ncertbooks.guru/ncert-books-for-class-1-english-marigold/',
  'https://www.ncertbooks.guru/ncert-class-1-hindi-book/',
  'https://www.ncertbooks.guru/ncert-books-class-1-maths/amp/'
];

final List firstHLinks = [];
final List secondLinks = [
  'https://www.ncertbooks.guru/ncert-books-for-class-2-english-marigold/',
  'https://www.ncertbooks.guru/ncert-class-2-hindi-book/',
  'https://www.ncertbooks.guru/ncert-books-class-2-maths/amp/'
];

final List third = ['English', 'EVS', 'Hindi', 'Maths'];
final List thirdLinks = [
  'https://www.ncertbooks.guru/ncert-books-for-class-3-english-marigold/',
  'https://www.ncertbooks.guru/ncert-class-3-science-book/',
  'https://www.ncertbooks.guru/ncert-class-3-hindi-book/',
  'https://www.ncertbooks.guru/ncert-books-class-3-maths/amp/',
];

final List fourthLinks = [
  'https://www.ncertbooks.guru/ncert-books-for-class-4-english-marigold/',
  'https://www.ncertbooks.guru/ncert-class-4-science-book/',
  'https://www.ncertbooks.guru/ncert-class-4-hindi-book/',
  'https://www.ncertbooks.guru/ncert-books-class-4-maths/amp/',
];

final fifthLinks = [
  'https://www.ncertbooks.guru/ncert-english-book/amp/#Class_5_NCERT_English_Books',
  'https://www.ncertbooks.guru/ncert-science-book/amp/#Class_5_NCERT_Science_Books',
  'https://www.ncertbooks.guru/ncert-class-5-hindi-book/',
  'https://www.ncertbooks.guru/ncert-books-class-5-maths/amp/',
];

final List sixth = [
  'English',
  'Hindi',
  'Maths',
  'Science',
  'History',
  'Geography',
  'Political Science',
];

final List sixthLinks = [
  'https://www.ncertbooks.guru/ncert-class-6-english-book/amp/#NCERT_Class_6_English_Honeysuckle_Book',
  'https://www.ncertbooks.guru/ncert-class-6-hindi-books/',
  'https://www.ncertbooks.guru/ncert-books-class-7-maths/amp/',
  'https://www.ncertbooks.guru/ncert-books-class-6-science/amp/#Class_6_NCERT_Science_Books',
  'https://www.ncertbooks.guru/ncert-class-6-history-books/amp/',
  'https://www.ncertbooks.guru/ncert-geography-book-class-6/amp/',
  'https://ncert.nic.in/textbook/pdf/fess3dd.zip',
];

final List seventh = [
  'English',
  'Hindi',
  'Maths',
  'Science',
  'Social Science',
];

final List seventhLinks = [
  'https://www.ncertbooks.guru/ncert-english-book/amp/#Class_7_NCERT_English_Books',
  'https://www.ncertbooks.guru/ncert-class-7-hindi-books/',
  'https://www.ncertbooks.guru/ncert-books-class-7-maths/amp/',
  'https://www.ncertbooks.guru/ncert-books-class-7-science/amp/#Class_7_NCERT_Science_Books',
  'https://www.ncertbooks.guru/ncert-books-for-class-7-social-science/',
];

final List eighthLinks = [
  'https://www.ncertbooks.guru/ncert-english-book/amp/#Class_8_NCERT_English_Books',
  'https://www.ncertbooks.guru/ncert-class-8-hindi-books/',
  'https://www.ncertbooks.guru/ncert-books-class-8-maths/amp/',
  'https://www.ncertbooks.guru/ncert-books-class-8-science/amp/#Class_8_NCERT_Science_Books',
  'https://www.ncertbooks.guru/ncert-books-for-class-8-social-science/',
];

final List ninth = [
  'English',
  'Hindi',
  'ICT',
  'Maths',
  'Science',
  'Social Science',
];

final List ninthLinks = [
  'https://www.ncertbooks.guru/ncert-english-book/amp/#Class_9_NCERT_English_Books',
  'https://www.ncertbooks.guru/ncert-books-for-class-9-hindi/',
  'https://www.ncertbooks.guru/ncert-books-for-class-9-information-and-communication-technology/',
  'https://www.ncertbooks.guru/ncert-books-class-9-maths/amp/',
  'https://www.ncertbooks.guru/ncert-books-class-9-science/amp/#Class_9_NCERT_Science_Books',
  'https://www.ncertbooks.guru/ncert-books-for-class-9-social-science/',
];

final List tenthLinks = [
  'https://www.ncertbooks.guru/ncert-english-book/amp/#Class_10_NCERT_English_Books',
  'https://www.ncertbooks.guru/ncert-class-10-hindi-book/',
  'https://www.ncertbooks.guru/ncert-books-class-10-maths/amp/',
  'https://www.ncertbooks.guru/ncert-books-class-10-science/amp/#Class_10_NCERT_Science_Books',
  'https://www.ncertbooks.guru/ncert-books-for-class-10-social-science/',
];
final List eleventh = [
  'Acountancy',
  'Biology',
  'Business Studies',
  'Chemistry',
  'Computer Science',
  'Economics',
  'English',
  'Geography',
  'Hindi',
  'History',
  'Informatics Practices',
  'Mathematics',
  'Physics',
  'Political Science',
];

final List eleventhLinks = [
  'https://www.ncertbooks.guru/ncert-books-class-11-accountancy/amp/',
  'https://www.ncertbooks.guru/ncert-books-class-11-biology/amp/',
  'https://www.ncertbooks.guru/ncert-books-class-11-business-studies/amp/',
  'https://www.ncertbooks.guru/ncert-books-class-11-chemistry/amp/',
  'https://www.ncertbooks.guru/ncert-books-for-class-11-computer-science/',
  'https://www.ncertbooks.guru/ncert-books-for-class-11-india-economic-development/',
  'https://www.ncertbooks.guru/ncert-english-book/amp/#Class_11_NCERT_English_Books',
  'https://www.ncertbooks.guru/ncert-geography-book-class-11/amp/',
  'https://www.ncertbooks.guru/ncert-class-11-hindi-book/',
  'https://www.ncertbooks.guru/ncert-class-11-history-books/amp/',
  'https://www.ncertbooks.guru/ncert-books-for-class-11-informatics-practices/',
  'https://www.ncertbooks.guru/ncert-books-class-11-maths/amp/',
  'https://www.ncertbooks.guru/ncert-books-class-11-physics/amp/',
  'https://www.ncertbooks.guru/ncert-books-for-class-11-india-constitution-at-work/'
];

final List twelvth = [
  'Acountancy',
  'Biology',
  'Business Studies',
  'Chemistry',
  'English',
  'Geography',
  'Hindi',
  'History',
  'Mathematics',
  'Physics',
  'Political Science',
];
final List twelvethLinks = [
  'https://www.ncertbooks.guru/ncert-books-class-12-accountancy/amp/',
  'https://www.ncertbooks.guru/ncert-books-class-12-biology/amp/',
  'https://www.ncertbooks.guru/ncert-books-class-12-business-studies/amp/',
  'https://www.ncertbooks.guru/ncert-books-class-12-chemistry/amp/',
  'https://www.ncertbooks.guru/ncert-english-book/amp/#Class_12_NCERT_English_Books',
  'https://www.ncertbooks.guru/ncert-geography-book-class-12/amp/',
  'https://www.ncertbooks.guru/ncert-class-12-hindi-book/',
  'https://www.ncertbooks.guru/ncert-class-12-history-book/amp/',
  'https://www.ncertbooks.guru/ncert-books-class-12-maths/amp/',
  'https://www.ncertbooks.guru/ncert-books-class-12-physics/amp/',
  'https://www.ncertbooks.guru/ncert-books-class-12-contemporary-world-politics/amp/'
];

// Education resource and constants ends

// high blood pressure info starts

final List highBPAbout = [
  {
    'head': 'What is High Blood Pressure?',
    'body':
        'High blood pressure is a common condition in which the long-term force of the blood against your artery walls is high enough that it may eventually cause health problems, such as heart disease. Blood pressure is determined both by the amount of blood your heart pumps and the amount of resistance to blood flow in your arteries. High blood pressure, also called hypertension, is when your blood pressure is consistently too high.',
  },
];

final List highBPSymp = [
  {
    'head': 'What are the symptoms of High Blood Pressure?',
    'body':
        'High blood pressure usually has no symptoms. If you have high blood pressure, you may have headaches, shortness of breath, nosebleeds, or changes in vision. If you have severe high blood pressure, you may have chest pain, confusion, or difficulty seeing.',
  },
];

final List highBPCause = [
  {
    'head': 'What are the causes of High Blood Pressure?',
    'body':
        'High blood pressure is often caused by a combination of factors, including: Age. The risk of high blood pressure increases as you get older. Family history. High blood pressure tends to run in families. Being overweight or obese. Being overweight or obese increases your risk of high blood pressure. Lack of physical activity. Not getting enough physical activity increases your risk of high blood pressure. Too much salt in your diet. Eating too much salt can raise your blood pressure. Too much alcohol. Drinking too much alcohol can raise your blood pressure. Stress. Stress can raise your blood pressure. Certain chronic conditions. Certain chronic conditions, such as kidney disease, can cause high blood pressure. Certain medicines. Some medicines can raise your blood pressure.',
  }
];

final List highBPRemedies = [
  {
    'head': '1. Lose Extra pounds and watch your waistline',
    'body':
        'Carrying too much weight around the waist can increase the risk of high blood pressure.\nIn general:\n\t\t\t\t•	Men are at risk if their waist measurement is greater than 40 inches (102 centimeters).\n\t\t\t\t•	Women are at risk if their waist measurement is greater than 35 inches (89 centimeters).\nThese numbers vary among ethnic groups. Ask your health care provider about a healthy waist measurement for you.',
  },
  {
    'head': '2. Exercise regularly',
    'body':
        'Regular physical activity can lower high blood pressure by about 5 to mm Hg. It\'s important to keep exercising to keep blood pressure from rising again. As a general goal, aim for at least 30 minutes of moderate physical activity every day',
  },
  {
    'head': '3. Eat a Healthy diet',
    'body':
        'Eating a diet rich in whole grains, fruits, vegetables and low-fat dairy products and low in saturated fat and cholesterol can lower high blood pressure by up to 11 mm Hg. Examples of eating plans that can help control blood pressure are the Dietary Approaches to Stop Hypertension (DASH) diet and the Mediterranean diet.',
  },
  {
    'head': '4. Reduce sodium in your diet',
    'body':
        'Even a small reduction of sodium in the diet can improve heart health and reduce high blood pressure by about 5 to 6 mm Hg.\n\nTo reduce sodium in the diet:\n\t\t•	Read food labels. Look for low-sodium versions of foods and beverages.\n\t\t•	Eat fewer processed foods. Only a small amount of sodium occurs naturally in foods. Most sodium is added during processing.\n\t\t•	Don\'t add salt. Use herbs or spices to add flavor to food.\n\t\t•	Cook. Cooking lets you control the amount of sodium in the food.'
  },
  {
    'head': '5. Limit alcohol',
    'body':
        'Limiting alcohol to less than one drink a day for women or two drinks a day for men can help lower blood pressure by about 4 mm Hg. One drink equals 12 ounces of beer, 5 ounces of wine or 1.5 ounces of 80-proof liquor.',
  },
  {
    'head': '6. Quit Smoking',
    'body':
        'Smoking can raise blood pressure by about 5 to 20 mm Hg. Quitting smoking can lower blood pressure back to normal within a few weeks.'
  },
];
// High Blood Pressure Info end

// Low Blood Pressure Info start
final List lowBpRemedies = [
  {
    'head': '1. Eat more salt',
    'body':
        'Contrary to popular advice, low-sodium diets are not good for everyone with blood pressure problems.\n\nPeople with low blood pressure should consider increasing their sodium intake moderately to help raise blood pressure',
  },
  {
    'head': '2. Avoid Alcoholic Bevarages',
    'body':
        'Alcohol can lower blood pressure further, so people with low blood pressure should avoid drinking excessive amounts of alcohol.',
  },
  {
    'head': '3. Discuss medications with a doctor',
    'body':
        'Low blood pressure can be a side effect of a variety of medications.\n\nIf symptoms of low blood pressure begin after starting a medication, a person should discuss the symptoms with their doctor.'
  },
  {
    'head': '4. Cross legs while sitting',
    'body':
        'Crossing the legs while sitting has been shown to increase blood pressure.\n\nFor people with low blood pressure symptoms, crossed legs may help increase blood pressure with minimal effort.'
  },
  {
    'head': '5. Drink more water',
    'body':
        'Drinking more water can help increase blood volume, which can aleviate one of the potential causes of low blood pressure. It can also help avoid dehydration'
  },
  {
    'head': '6. Eat small meals frequently',
    'body':
        'Eating smaller, more frequent meals throughout the day may help with low blood pressure.\n\nThis is because the smaller meals help prevent a drop in a blood pressure associated with eating larger, heavier meals.',
  },
  {
    'head': 'Wear compression stockings',
    'body':
        'Compression stockings help reduce the amount of blood that gets caught in the lower legs and feet, so shifting it elsewhere.\n\nCompression stockings are also used to help relieve pressure and pain associated with varicose veins.'
  },
  {
    'head': '8. Avoid sudden position changes',
    'body':
        'Sitting up or standing up rapidly can cause a feeling of lightheadedness, dizziness, or potential fainting in people with low blood pressure.\n\nIn these cases, the heart has not pumped enough blood through the body quickly enough to account for the sudden change in position or elevation.',
  },
  {
    'head': '9. Be aware of symptoms',
    'body':
        'Low blood pressure is only considered a problem if symptoms exist. If there are no symptoms present, low blood pressure should be taken as a sign of good health.\n\nIt is important for a person to know the symptoms and what to look out for if their low blood pressure starts to cause problems',
  }
];

final List lowBpAbout = [
  {
    'head': 'What is Low Blood Pressure?',
    'body':
        'Low blood pressure, also called hypotension, is when your blood pressure is lower than normal. Blood pressure is the force of blood pushing against the walls of your arteries as the heart pumps blood. Your blood pressure changes throughout the day. It is usually lowest when you are sleeping and highest when you are active or excited. Low blood pressure is not a disease. It is a sign that your body is not getting enough blood. Low blood pressure can be caused by dehydration, blood loss, or certain medicines. It can also be a sign of a serious medical problem.',
  }
];

final List lowBpSymptoms = [
  {
    'head': 'What are the symptoms of Low Blood Pressure?',
    'body':
        'Low blood pressure usually has no symptoms. If you have low blood pressure, you may feel dizzy or lightheaded. You may also feel weak, tired, or have a fast heartbeat. If you have severe low blood pressure, you may faint or lose consciousness.\n\t🔹If you have low blood pressure, you may have symptoms of an underlying condition. For example, if you have low blood pressure because of dehydration, you may have a dry mouth, headache, or feel dizzy or lightheaded. If you have low blood pressure because of an infection, you may have a fever, chills, or aches and pains.\n\t🔹If you have low blood pressure because of a heart problem, you may have chest pain, shortness of breath, or fainting.\n\t🔹If you have low blood pressure because of a problem with your nervous system, you may have numbness or tingling in your hands or feet, or you may have trouble walking.\n\t🔹If you have low blood pressure because of a problem with your thyroid gland, you may have a fast heartbeat, weight gain, or fatigue.\n\t🔹If you have low blood pressure because of a problem with your adrenal glands, you may have a fast heartbeat, nausea, or vomiting.\n\t🔹If you have low blood pressure because of a problem with your kidneys, you may have a fast heartbeat, nausea, or vomiting.\n\t🔹If you have low blood pressure because of a problem with your pituitary gland, you may have a fast heartbeat, nausea, or vomiting.',
  }
];

final List lowBpCauses = [
  {
    'head': 'What are the causes of Low Blood Pressure?',
    'body':
        'Low blood pressure is often caused by a combination of factors, including:\n\t🔹Dehydration.\nDehydration is the most common cause of low blood pressure. Dehydration can be caused by:\n\t\t\t\t🔹Vomiting\n\t\t\t\t🔹Diarrhea\n\t\t\t\t🔹Excessive sweating\n\t\t\t\t🔹Not drinking enough fluids\n\t\t\t\t🔹Not eating enough\n\t\t\t\t🔹Drinking too much alcohol\n\t\t\t\t🔹Taking certain medicines\n\t\t\t\t🔹Being in a hot environment\n\t\t\t\t🔹Being in a high altitude\n\t\t\t\t🔹Being in a low humidity environment\n\t\t\t\t🔹Being in a dry climate\n\t\t\t\t🔹Being in a hot climate\n\t\t\t\t🔹Being in a cold climate\n\t\t\t\t',
  },
];

final List lowBpLinks = [
  {
    'text': 'Dehydration',
    'link': "https://www.medicalnewstoday.com/articles/153363",
  },
  {
    'text': 'Varicose Viens',
    'link': 'https://www.medicalnewstoday.com/articles/240129',
  },
];

// Low Blood Pressure Info Ends

// high Blood sugar info starts

final List highBloodSugarHome = [
  {
    'head': '1. Get Physical',
    'body':
        'Regular exercise is often an effective way to control blood sugar. But don\'t exercise if you have ketones in your urine. This can drive your blood sugar even higher.',
  },
  {
    'head': '2. Take your medication as directed',
    'body':
        'If you develop hyperglycemia often, your health care provider may adjust the dosage or timing of your medication.',
  },
  {
    'head': '3. Follow your diabetes eating plan',
    'body':
        'It helps to eat smaller portions and avoid sugary beverages and frequent snacking. If you\'re having trouble sticking to your meal plan, ask your health care provider or dietitian for help.'
  },
  {
    'head': '4. Check your blood sugar',
    'body':
        'Monitor your blood glucose as directed by your health care provider. Check more often if you\'re sick or if you\'re concerned about severe hyperglycemia or hypoglycemia.',
  },
  {
    'head': '5.	Adjust your insulin doses',
    'body':
        'Changes to your insulin program or a supplement of short-acting insulin can help control hyperglycemia. A supplement is an extra dose of insulin used to help temporarily correct a high blood sugar level. Ask your health care provider how often you need an insulin supplement if you have high blood sugar.'
  }
];

final List highBloodSugarEmer = [
  {
    'head': '1. Fluid Replacement',
    'body':
        'You\'ll receive fluids — usually through a vein (intravenously) — until your body has the fluids it needs. This replaces fluids you\'ve lost through urination. It also helps dilute the extra sugar in your blood.'
  },
  {
    'head': '2. Electrolyte Replacement',
    'body':
        'Electrolytes are minerals in your blood that are necessary for your tissues to work properly. A lack of insulin can lower the level of electrolytes in your blood. You\'ll receive electrolytes through your veins to help keep your heart, muscles and nerve cells working the way they should.'
  },
  {
    'head': '3. Insulin Therapy',
    'body':
        'Insulin reverses the processes that cause ketones to build up in your blood. Along with fluids and electrolytes, you\'ll receive insulin therapy — usually through a vein.'
  }
];

final List highBloodSugarAbout = [
  {
    'head': 'What is High Blood Sugar?',
    'body':
        'High blood sugar, also called hyperglycemia, is when your blood sugar is too high. Blood sugar is the main source of energy and fuel for your body. It comes from the food you eat. Insulin, a hormone made by the pancreas, helps glucose from food get into your cells to be used for energy. Sometimes your body doesn\'t make enough — or any — insulin or doesn\'t use insulin well. Glucose then stays in your blood and doesn\'t reach your cells. Your blood sugar level rises.\n\nThis is called hyperglycemia. High blood sugar can be caused by:\n\t\t\t\t🔹Not taking your diabetes medicine\n\t\t\t\t🔹Not eating enough\n\t\t\t\t🔹Eating too much\n\t\t\t\t🔹Being sick\n\t\t\t\t🔹Being under stress\n\t\t\t\t🔹Being more active than usual\n\t\t\t\t🔹Taking certain medicines\n\t\t\t\t🔹Drinking too much alcohol\n\t\t\t\t🔹Being pregnant\n\t\t\t\t🔹Being older\n\t\t\t\t🔹Having a family history of diabetes\n\t\t\t\t🔹Being overweight\n\t\t\t\t🔹Having a history of gestational diabetes\n\t\t\t\t🔹Having a history of polycystic ovary syndrome\n\t\t\t\t🔹Having a history of Cushing\'s syndrome\n\t\t\t\t🔹Having a history of acromegaly\n\t\t\t\t🔹Having a history of pheochromocytoma\n\t\t\t\t🔹Having a history of a tumor in the pancreas\n\t\t\t\t🔹Having a history of a tumor in the pituitary gland\n\t\t\t\t🔹Having a history of a tumor in the adrenal gland',
  },
];

final List highBloodSugarSymptoms = [
  {
    'head': 'Symptoms of High Blood Sugar',
    'body':
        '\n\t\t\t\t🔹Feeling very thirsty\n\t\t\t\t🔹Feeling very hungry\n\t\t\t\t🔹Feeling very tired\n\t\t\t\t🔹Feeling very irritable\n\t\t\t\t🔹Feeling very confused\n\t\t\t\t🔹Having blurry vision\n\t\t\t\t🔹Having frequent urination\n\t\t\t\t🔹Having dry mouth\n\t\t\t\t🔹Having dry skin\n\t\t\t\t🔹Having fruity-smelling breath\n\t\t\t\t🔹Having nausea\n\t\t\t\t🔹Having vomiting\n\t\t\t\t🔹Having stomach pain\n\t\t\t\t🔹Having a headache\n\t\t\t\t🔹Having dizziness\n\t\t\t\t🔹Having a fast heartbeat\n\t\t\t\t🔹Having a slow heartbeat\n\t\t\t\t🔹Having a flushed face\n\t\t\t\t🔹Having a warm, dry skin\n\t\t\t\t🔹Having a fruity-smelling breath\n\t\t\t\t🔹Having a fruity-smelling urine\n\t\t\t\t🔹Having a sweet-smelling breath\n\t\t\t\t🔹Having a sweet-smelling urine\n\t\t\t\t🔹Having a metallic taste in the mouth\n\t\t\t\t🔹Having a loss of consciousness\n\t\t\t\t🔹Having a seizure\n\t\t\t\t🔹Having a coma',
  }
];

// high blood sugar info ends

// low blood sugar info starts

final List lowBloodSugarAbout = [
  {
    'head': 'What is Low Blood Sugar?',
    'body':
        'Low blood sugar, also called hypoglycemia, is when your blood sugar is too low. Blood sugar is the main source of energy and fuel for your body. It comes from the food you eat. Insulin, a hormone made by the pancreas, helps glucose from food get into your cells to be used for energy. Sometimes your body doesn\'t make enough — or any — insulin or doesn\'t use insulin well. Glucose then stays in your blood and doesn\'t reach your cells. Your blood sugar level falls.\n\nThis is called hypoglycemia. Low blood sugar can be caused by:\n\t\t\t\t🔹Taking too much insulin.\n\t\t\t\t🔹Not eating enough carbs for how much insulin you take.\n\t\t\t\t🔹Timing of when you take your insulin.\n\t\t\t\t🔹The amount and timing of physical activity.\n\t\t\t\t🔹Drinking alcohol.\n\t\t\t\t🔹How much fat, protein, and fiber are in your meal.\n\t\t\t\t🔹Hot and humid weather.\n\t\t\t\t🔹Unexpected changes in your schedule.\n\t\t\t\t🔹Spending time at a high altitude.\n\t\t\t\t🔹Going through puberty.\n\t\t\t\t🔹Menstruation.',
  },
];

final List lowBloodSugarSymp = [
  {
    'head': 'Symptoms of Low Blood Sugar',
    'body':
        '\n\t\t\t\t🔹Fast heartbeat\n\t\t\t\t🔹Feeling very shaky\n\t\t\t\t🔹Feeling very sweaty\n\t\t\t\t🔹Feeling very nervous\n\t\t\t\t🔹Feeling very irritable\n\t\t\t\t🔹Feeling very confused\n\t\t\t\t🔹Hunger\n\t\t\t\t🔹Feeling very dizzy',
  }
];

final List lowBloodSugarCandy = [
  {
    'head': 'Candy',
    'body':
        ' \n\t\t\t\t🔹5 small gum drops\n\t\t\t\t🔹12 Gummy bears\n\t\t\t\t🔹6 Large Jelly beans\n\t\t\t\t🔹5 Life savers\n\t\t\t\t🔹15 Skittles\n\t\t\t\t🔹1 Tablespoo honey, jam or jelly\n\t\t\t\t🔹1 tablespoon sugar in water\n\t\t\t\t🔹4 Starburst'
  }
];

final List lowBloodSugarBev = [
  {
    'head': 'Beverages',
    'body':
        ' \n\t\t\t\t🔹1/2 cup apple juice\n\t\t\t\t🔹1/2 cup orange or grapefruit juice\n\t\t\t\t🔹1/2 cup pineapple juice\n\t\t\t\t🔹1/2 cup regular soda (not diet)\n\t\t\t\t🔹1/3 cup grape juice\n\t\t\t\t🔹1/3 cup cranberry juice\n\t\t\t\t🔹1/3 cup prune juice\n\t\t\t\t🔹1 cup fat free milk',
  }
];

final List lowBloodSugarFruits = [
  {
    'head': 'Fruits',
    'body':
        ' \n\t\t\t\t🔹1/2 banana\n\t\t\t\t🔹1 small apple\n\t\t\t\t🔹1 small orange\n\t\t\t\t🔹1/2 cup applesauce\n\t\t\t\t🔹2 tablespoons of raisins\n\t\t\t\t🔹15 grapes',
  }
];

// open books link function
openBookLink(Uri link) async {
  if (await canLaunchUrl(link)) {
    await launchUrl(link, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $link';
  }

  // open books link in browser
}

capitaliseString(String string) {
  return string[0].toUpperCase() + string.substring(1);
}
