import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/commons/widgets/app_bar/appbar.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/image_string.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';
import 'package:renteasy_app/utilities/constants/text_strings.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  late final TextEditingController cityController;
  late final TextEditingController genderController;
  late final TextEditingController dobController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: AppTexts.userName);
    emailController = TextEditingController(text: AppTexts.userEmail);
    phoneController = TextEditingController(text: AppTexts.userPhone);
    cityController = TextEditingController(text: AppTexts.userCity);
    genderController = TextEditingController(text: AppTexts.userGender);
    dobController = TextEditingController(text: AppTexts.userDob);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    cityController.dispose();
    genderController.dispose();
    dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const RAppBar(
        showBackArrow: true,
        titleText: 'Edit Profile',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSizes.md),
        child: Column(
          children: [
            // Avatar with camera change button
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.button, width: 2.5),
                    ),
                    padding: const EdgeInsets.all(3.0),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage(images.userProfileImage),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color: AppColors.button,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.camera_alt_rounded, color: Colors.white, size: 18),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24.0),

            // Form Inputs Container
            Container(
              padding: const EdgeInsets.all(18.0),
              decoration: BoxDecoration(
                color: AppColors.propertyContainerBG,
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: const Color(0xFFEBEBF5)),
              ),
              child: Column(
                children: [
                  _buildEditField(
                    label: 'FULL NAME',
                    controller: nameController,
                    icon: Icons.person_outline_rounded,
                  ),
                  const SizedBox(height: 16.0),
                  _buildEditField(
                    label: 'EMAIL',
                    controller: emailController,
                    icon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16.0),
                  _buildEditField(
                    label: 'PHONE',
                    controller: phoneController,
                    icon: Icons.phone_outlined,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 16.0),
                  _buildEditField(
                    label: 'CITY / LOCATION',
                    controller: cityController,
                    icon: Icons.location_on_outlined,
                  ),
                  const SizedBox(height: 16.0),
                  _buildEditField(
                    label: 'GENDER',
                    controller: genderController,
                    icon: Icons.person_outline,
                  ),
                  const SizedBox(height: 16.0),
                  _buildEditField(
                    label: 'DATE OF BIRTH',
                    controller: dobController,
                    icon: Icons.calendar_today_outlined,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28.0),

            // Save Changes Button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  Get.snackbar(
                    'Profile Updated',
                    'Your profile details have been saved successfully!',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: AppColors.button,
                    colorText: Colors.white,
                    margin: const EdgeInsets.all(16.0),
                    borderRadius: 12.0,
                    duration: const Duration(seconds: 2),
                  );
                  Future.delayed(const Duration(milliseconds: 700), () => Get.back());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.button,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Save Changes',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'poppins',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  Widget _buildEditField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 10.0,
            fontWeight: FontWeight.bold,
            color: AppColors.secondaryTextColor,
            fontFamily: 'poppins',
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 6.0),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          style: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            fontFamily: 'poppins',
            color: AppColors.primaryTextColor,
          ),
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Icon(icon, color: AppColors.button, size: 20),
            contentPadding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(color: Color(0xFFEBEBF5)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(color: Color(0xFFEBEBF5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(color: AppColors.button, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
