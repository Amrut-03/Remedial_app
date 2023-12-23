import 'package:appwrite/appwrite.dart';

Client client = Client()
    .setEndpoint('https://cloud.appwrite.io/v1')
    .setProject('658155dbd0e56107e5ea')
    .setSelfSigned(status: true); // For self signed certificates, only use for development