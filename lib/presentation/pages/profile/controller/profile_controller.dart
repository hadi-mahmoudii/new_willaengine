import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:willaengine/presentation/pages/Auth/Entities/auth.dart';
import 'package:willaengine/presentation/pages/profile/model/profile_model.dart';
import 'package:willaengine/presentation/pages/profile/repo/profile_repo.dart';

class ProfileController extends GetxController {
//****var****

  var profile = Rxn<ProfileModel>();
  var loading = false.obs;
  var profileInfoLoading = false.obs;
  var passwordLoading = false.obs;

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }

  getProfile() async {
    loading.value = true;
    profile.value = await ProfileRepo.getProfile();
    loading.value = false;
  }

  Future<bool> editProfile(Map profile) async {
    profileInfoLoading.value = true;
    this.profile.value = await ProfileRepo.editProfile(profile);
    profileInfoLoading.value = false;
    if (this.profile.value != null) {
      return true;
    } else {
      return false;
    }
  }

  changePassword(String currentPass, String newPass, String newPasswordConfirm,
      BuildContext context) async {
    passwordLoading.value = true;
    await ProfileRepo.changePassword(
      currentPass,
      newPass,
      newPasswordConfirm,
      context,
    );
    passwordLoading.value = false;
  }

  void logOut() async {
    final prefs = await SharedPreferences.getInstance();
    loading.value = true;
    final bool response = await ProfileRepo.logOut();
    AuthEntity.logout();
    loading.value = false;
  }
}
