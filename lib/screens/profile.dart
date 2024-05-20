import 'package:flutter/material.dart';
import 'dart:io' show File;
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late File _image;
  late SharedPreferences _prefs;
  late TextEditingController _emailController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _locationController;

  @override
  void initState() {
    super.initState();
    _image = File(
        'assets/default_profile_image.jpg'); // Initialize with a default value
    _loadImage();
    _emailController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _locationController = TextEditingController();
    _loadTextFields();
  }

  Future<void> _loadImage() async {
    _prefs = await SharedPreferences.getInstance();
    final String? imagePath = _prefs.getString('imagePath');
    if (imagePath != null) {
      setState(() {
        _image = File(imagePath);
      });
    }
  }

  Future<void> _saveImage(String imagePath) async {
    await _prefs.setString('imagePath', imagePath);
  }

  Future<void> _loadTextFields() async {
    _prefs = await SharedPreferences.getInstance();
    _emailController.text = _prefs.getString('email') ?? '';
    _phoneNumberController.text = _prefs.getString('phoneNumber') ?? '';
    _locationController.text = _prefs.getString('location') ?? '';
  }

  Future<void> _saveText(String key, String value) async {
    await _prefs.setString(key, value);
  }

  Future<void> getImage() async {
    try {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: FileType.image);

      if (result != null) {
        File selectedImage = File(result.files.single.path!);

        if (selectedImage.existsSync()) {
          setState(() {
            _image = selectedImage;
          });
          _saveImage(result.files.single.path!);
        } else {
          print('Selected image file does not exist.');
        }
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: getImage,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundImage:
                          _image.existsSync() ? FileImage(_image) : null,
                    ),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                'EJ D. ARNADO',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Student',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 24),
              _buildTextField(_emailController, 'Email', Icons.email, 'email'),
              _buildTextField(_phoneNumberController, 'Phone Number',
                  Icons.phone, 'phoneNumber'),
              _buildTextField(_locationController, 'Location',
                  Icons.location_on, 'location'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      IconData icon, String key) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        suffixIcon: IconButton(
          icon: Icon(Icons.save),
          onPressed: () {
            _saveText(key, controller.text);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Saved $label'),
                duration: Duration(seconds: 2),
              ),
            );
          },
        ),
      ),
    );
  }
}
