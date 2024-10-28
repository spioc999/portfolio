import 'package:spioc_portfolio/core/resources/res.dart';
import 'package:spioc_portfolio/models/models.dart';
import 'package:spioc_portfolio/utils/typedefs.dart';

class Me {
  static const initials = 'SPC';
  static const firstName = 'Simone Pio';
  static const lastName = 'Caronia';

  static const fullName = '$firstName $lastName';

  static const imagesAndBlurHashs = <ImageAndBlurHash>[
    (img: Res.jpgMeSerious, blurHash: 'UMDbd6M|VDn\$}UnOR.WBz:aexbofIUt7t7WB'),
    (img: Res.jpgMeSmiling, blurHash: 'UdF}\$mx]rpV=~Ux[bcaextb_s;R+XTkXjFWB'),
  ];

  final LocalizedString role;
  final About about;
  final Education education;
  final Experience experience;

  Me({
    required this.role,
    required this.about,
    required this.education,
    required this.experience,
  });
}
