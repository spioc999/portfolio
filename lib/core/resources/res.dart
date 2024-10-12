import 'package:flutter/foundation.dart';

class Res {
  static const jpgMeSerious = 'assets/imgs/me_serious.jpg';
  static const jpgMeSmiling = 'assets/imgs/me_smiling.jpg';

  static const jpgHobbyBasket = 'assets/imgs/hobby_basket.jpg';
  static const jpgHobbyGdmi = 'assets/imgs/hobby_gdmi.jpg';
  static const jpgHobbyRacket = 'assets/imgs/hobby_racket.jpg';
  static const jpgHobbySea = 'assets/imgs/hobby_sea.jpg';
  static const jpgHobbyTravelling = 'assets/imgs/hobby_travelling.jpg';
  static const jpgHobbyTrumpet = 'assets/imgs/hobby_trumpet.jpg';
  static const jpgHobbyLego = 'assets/imgs/hobby_lego.jpg';

  static const jpgExperienceAlpiantech =
      'assets/imgs/experience_alpiantech.jpg';
  static const jpgExperienceFip = 'assets/imgs/experience_fip.jpg';
  static const jpgExperienceNttdata = 'assets/imgs/experience_nttdata.jpg';
  static const jpgExperiencePiggybank = 'assets/imgs/experience_piggybank.jpg';

  static const jpgEducationElis = 'assets/imgs/education_elis.jpg';
  static const jpgEducationItis = 'assets/imgs/education_itis.jpg';
  static const jpgEducationPolimi = 'assets/imgs/education_polimi.jpg';
  static const jpgEducationUcbm = 'assets/imgs/education_ucbm.jpg';
  static const jpgEducationTorquay = 'assets/imgs/education_torquay.jpg';

  static const pdfSpcCv = 'assets/pdfs/simone_pio_caronia_cv.pdf';

  static String resolvePath(String path) =>
      kReleaseMode ? 'assets/$path' : path;
}
