import 'dart:convert';

import 'package:google_sign_in/google_sign_in.dart';
import "package:http/http.dart" as http;

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class FirebaseApi {
  Future<void> handleGoogleSignIn() async {
    try {
      await _googleSignIn.signIn();
      print('Executing the Google SIGN in API level');
    } catch (error) {
      print('Getting the error in Google SIGN in API level');

      print(error);
    }
  }

  Future<dynamic> handleGetContact(GoogleSignInAccount user) async {
    // setState(() {
    //   _contactText = "Loading contact info...";
    // });

    final http.Response response = await http.get(
      Uri.parse('https://people.googleapis.com/v1/people/me/connections'
          '?requestMask.includeField=person.names'),
      headers: await user.authHeaders,
    );
    if (response.statusCode != 200) {
      // setState(() {
      //   _contactText = "People API gave a ${response.statusCode} "
      //       "response. Check logs for details.";
      // });
      print('People API ${response.statusCode} \nresponse: ${response.body}');
      return;
    }
    final Map<String, dynamic> data = json.decode(response.body);
    final String? namedContact = _pickFirstNamedContact(data);
    // setState(() {
    //   if (namedContact != null) {
    //     _contactText = "I see you know $namedContact!";
    //   } else {
    //     _contactText = "No contacts to display.";
    //   }
    // });
    return response;
  }

  String? _pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic>? connections = data['connections'];
    final Map<String, dynamic>? contact = connections?.firstWhere(
      (dynamic contact) => contact['names'] != null,
      orElse: () => null,
    );
    if (contact != null) {
      final Map<String, dynamic>? name = contact['names'].firstWhere(
        (dynamic name) => name['displayName'] != null,
        orElse: () => null,
      );
      if (name != null) {
        return name['displayName'];
      }
    }
    return null;
  }

  /// TODO : Execute the SIGN OUT process from here!!!
  Future<void> handleSignOut() => _googleSignIn.disconnect();
}
